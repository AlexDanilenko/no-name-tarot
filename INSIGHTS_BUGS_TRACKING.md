# Insights System - Bug Tracking Document

**Project:** Tarot App - Insights & Interests System  
**Created:** December 2024  
**Status:** Active  
**Priority:** Track all bugs for future resolution  

---

## 🚨 **CRITICAL BUGS**

### **Bug #001: Infinite Cycle on Retry After Error**
**Status:** ✅ **RESOLVED - FIXED**  
**Reporter:** User  
**Date Found:** December 2024  
**Date Fixed:** December 2024  
**Priority:** P0 - App becomes unusable (WAS CRITICAL)  

#### **Description:**
When user tries to fetch an interest again after an error occurs, the app gets stuck in an infinite cycle and becomes unresponsive.

#### **Steps to Reproduce:**
1. Open app and navigate to Spread view
2. Open cards to reveal insights section
3. Select any interest to trigger insight loading
4. Force a network error (airplane mode, bad connection, etc.)
5. Wait for error state to appear
6. Tap "Try Again" or "Get New Insight" button
7. **BUG:** App enters infinite cycle and becomes stuck

#### **Expected Behavior:**
- User taps retry button
- New insight loading request is made
- Either succeeds with new insight OR fails gracefully with error message
- User can continue using the app

#### **Actual Behavior:**
- User taps retry button  
- App becomes unresponsive
- Infinite cycle occurs (likely endless action dispatching)
- App must be force-closed

#### **Root Cause Analysis:**

**🔍 IDENTIFIED ISSUE: `insightFailed` → `insightFailed` Infinite Loop**

**Location:** `TarotApp/TarotApp/Sources/Features/HomePage/Insights/Insights.swift:78-85`

```swift
case .insightFailed(let error):
    state.isLoadingInsight = false
    state.retryCount += 1
    
    // ❌ BUG: This creates infinite cycle!
    if state.retryCount >= State.maxRetryCount {
        return .send(.insightFailed(.maxRetriesReached))  // <-- CYCLES BACK TO SAME CASE!
    }
    
    return .none
```

**Problem:** When `maxRetryCount` is reached, the reducer sends another `.insightFailed(.maxRetriesReached)` action, which triggers the same case again, creating an infinite loop.

#### **Technical Details:**
- **Cycle Pattern:** `.insightFailed` → `.send(.insightFailed(.maxRetriesReached))` → `.insightFailed` → repeat
- **Memory Impact:** Action queue fills up infinitely  
- **UI Impact:** App becomes unresponsive due to action flooding
- **Thread Impact:** Main thread blocked by endless action processing

#### **✅ IMPLEMENTED FIX:**
**Location:** `TarotApp/TarotApp/Sources/Features/HomePage/Insights/Insights.swift:78-85`

```swift
case .insightFailed(let error):
    state.isLoadingInsight = false
    
    // Only increment retry count for actual failures, not max retries reached
    if error != .maxRetriesReached {
        state.retryCount += 1
    }
    
    // Don't send another action when max retries reached - just update state
    // This prevents the infinite cycle
    return .none
```

**Key Changes:**
1. ✅ Only increment `retryCount` for real failures, not for `.maxRetriesReached`
2. ✅ Removed the problematic `return .send(.insightFailed(.maxRetriesReached))` that caused infinite loops
3. ✅ Simplified retry logic in `.retry` case with better guard statements

#### **✅ TESTING IMPLEMENTED:**
**Test:** `test_retryCountIncrementBehavior()` in `TarotAppTests.swift`

**Coverage:**
1. ✅ Regular errors increment `retryCount` (`.networkError`, `.invalidResponse`)
2. ✅ `.maxRetriesReached` errors do NOT increment `retryCount` (prevents infinite loop)
3. ✅ Multiple `.maxRetriesReached` calls are safe
4. ✅ Regular errors continue to work after `.maxRetriesReached`
5. ✅ Final state verification and consistency checks

**Result:** All tests pass - Bug #001 fix is verified and working correctly

---

## ⚠️ **HIGH PRIORITY BUGS**

### **Bug #002: Race Conditions in Async Loading**
**Status:** ✅ **RESOLVED - FIXED**  
**Reporter:** System Analysis  
**Date Found:** December 2024  
**Date Fixed:** December 2024  
**Priority:** P1 - Potential crashes (WAS HIGH PRIORITY)  

#### **Description:**
Multiple rapid interest selections caused race conditions in async insight loading, leading to potential crashes and inconsistent state.

#### **Root Cause Analysis:**

**🔍 IDENTIFIED ISSUES:**

1. **Sequential Action Dispatch Race:** In `InsightsView.swift:37-41`
   ```swift
   // ❌ BUG: Two separate actions could race
   viewStore.send(.selectInterest(interest))
   viewStore.send(.loadInsight(interest, cards: cards))
   ```

2. **No Task Cancellation:** `loadInsight` effects weren't cancelled when new interests were selected
3. **Concurrent API Calls:** Multiple simultaneous API requests could complete out of order

#### **✅ IMPLEMENTED FIX:**

**1. Combined Atomic Action:**
```swift
// Added new action to prevent race conditions
case selectInterestAndLoad(Interest, cards: [TarotCard])

// Updated UI to use atomic action
viewStore.send(.selectInterestAndLoad(interest, cards: cards))
```

**2. Added Task Cancellation:**
```swift
.cancellable(id: "insight-loading", cancelInFlight: true)
```

**3. Proper Cleanup on State Changes:**
```swift
case .selectInterest(let interest):
    // ... state updates ...
    return .cancel(id: "insight-loading")  // Cancel ongoing loading

case .clearSelection:
    // ... state updates ...
    return .cancel(id: "insight-loading")  // Cancel ongoing loading
```

#### **✅ TESTING IMPLEMENTED:**
**Tests:** `test_selectInterestStateUpdate()` and `test_clearSelectionStateUpdate()` in `TarotAppTests.swift`

**Coverage:**
1. ✅ Interest selection state management
2. ✅ Proper state reset on clear selection
3. ✅ State consistency during rapid interest changes
4. ✅ All cancellation effects work correctly

**Result:** All tests pass - Bug #002 fix is verified and working correctly

---

### **Bug #003: Memory Leaks in Error States**
**Status:** ✅ **RESOLVED - FIXED**  
**Reporter:** System Analysis  
**Date Found:** December 2024  
**Date Fixed:** December 2024  
**Priority:** P1 - Performance degradation (WAS HIGH PRIORITY)  

#### **Description:**
Error states and successful insight loads were not properly cleaning up async resources, leading to potential memory leaks and hanging network requests.

#### **Root Cause Analysis:**

**🔍 IDENTIFIED ISSUES:**

1. **Missing Resource Cleanup:** Error states returned `.none` instead of cancelling ongoing tasks
2. **Hanging Network Requests:** No timeout protection on API calls
3. **Incomplete Task Management:** Successful loads didn't clean up task references
4. **Resource Retention:** Async operations could continue running after state changes

#### **✅ IMPLEMENTED FIX:**

**1. Added Proper Task Cancellation:**
```swift
case .insightFailed(let error):
    // ... state updates ...
    // ✅ Cancel any ongoing tasks to prevent memory leaks
    return .cancel(id: "insight-loading")

case .insightLoaded(let insight):
    // ... state updates ...
    // ✅ Ensure task is properly cleaned up after successful load
    return .cancel(id: "insight-loading")
```

**2. Added Timeout Protection:**
```swift
// ✅ Add timeout protection to prevent hanging requests
try await withTimeout(seconds: 30) {
    // API call logic
}
```

**3. Created Timeout Utility:**
```swift
func withTimeout<T>(seconds: Double, operation: @escaping () async throws -> T) async throws -> T {
    // Implementation with TaskGroup for proper cancellation
}
```

#### **✅ TESTING IMPLEMENTED:**
**Tests:** `test_memoryLeakPrevention()` and `test_timeoutErrorHandling()` in `TarotAppTests.swift`

**Coverage:**
1. ✅ Proper cleanup after network errors
2. ✅ Proper cleanup after successful loads  
3. ✅ MaxRetriesReached error handling
4. ✅ Timeout error conversion to network errors
5. ✅ State consistency during cleanup operations

**Result:** All tests pass - Bug #003 fix is verified and working correctly

---

## 🔵 **MEDIUM PRIORITY BUGS**

### **Bug #004: UI State Inconsistencies**
**Status:** 🔵 **MINOR - LOW IMPACT**  
**Priority:** P2 - UX improvements  

#### **Description:**
UI buttons might show incorrect states during rapid state changes.

#### **Location:** `InsightsView.swift:114-120` - Retry button visibility
**Issue:** `canRetry` logic might not account for all edge cases

---

## ✅ **RESOLVED BUGS**

### **Bug #R001: Interest Enum Duplication**
**Status:** ✅ **RESOLVED**  
**Fixed In:** Phase 1 - Foundation  
**Solution:** Created unified Interest enum

---

## 🧪 **BUG TESTING CHECKLIST**

### **Critical Bug Testing (Bug #001)**
- [ ] Test infinite cycle scenario
- [ ] Verify fix prevents infinite loop
- [ ] Test max retries behavior
- [ ] Verify app remains responsive
- [ ] Test memory usage during retries

### **General Testing**
- [ ] Rapid interest selection testing
- [ ] Network failure simulation
- [ ] Memory leak detection
- [ ] Performance profiling
- [ ] Stress testing with many retries

---

## 🔧 **DEBUGGING TOOLS**

### **Recommended Tools:**
1. **TCA Debugging:** Enable `._printChanges()` on reducers
2. **Memory Profiler:** Xcode Instruments - Leaks
3. **Network Simulation:** Network Link Conditioner
4. **Performance:** Xcode Instruments - Time Profiler

### **Debug Commands:**
```swift
// Add to Insights reducer for debugging:
.forEach(\.insights, action: \.insights) {
    Insights()._printChanges()
}
```

---

## 📊 **BUG STATISTICS**

- **Total Bugs:** 4 (0 Critical, 0 High, 1 Medium)
- **Resolved:** 4 (Bug #001 ✅, Bug #002 ✅, Bug #003 ✅, Bug #R001 ✅)
- **Critical Open:** 0 🎉
- **High Priority Open:** 0 🎉
- **Test Coverage:** ✅ All resolved bugs have comprehensive tests
- **Most Common Category:** State Management & Async Effects

---

## 🚀 **NEXT STEPS**

### **✅ COMPLETED ACTIONS:**
1. **✅ FIXED BUG #001** - Critical infinite cycle (RESOLVED)
2. **✅ FIXED BUG #002** - Race conditions (RESOLVED)
3. **✅ FIXED BUG #003** - Memory leaks (RESOLVED)
4. **✅ Added comprehensive test coverage** for all bug scenarios
5. **✅ Documented all fixes** and prevention strategies

### **Remaining Work:**
1. **🔍 Investigate Bug #004** - UI State Inconsistencies (Medium Priority)
2. **🧪 Add UI consistency tests** if needed

### **Future:**
1. **🛡️ Implement monitoring** for production bug detection
2. **📊 Add analytics** for error rates and patterns
3. **🔄 Regular bug review** sessions

---

*Last Updated: December 2024*  
*Next Review: After Bug #001 fix*  
*Contact: AI Assistant for technical details* 