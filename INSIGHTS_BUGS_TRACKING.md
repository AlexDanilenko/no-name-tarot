# Insights System - Bug Tracking Document

**Project:** Tarot App - Insights & Interests System  
**Created:** December 2024  
**Status:** Active  
**Priority:** Track all bugs for future resolution  

---

## 🚨 **CRITICAL BUGS**

### **Bug #001: Infinite Cycle on Retry After Error**
**Status:** 🔴 **CRITICAL - REPRODUCIBLE**  
**Reporter:** User  
**Date Found:** December 2024  
**Priority:** P0 - App becomes unusable  

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

#### **Proposed Fix:**
```swift
case .insightFailed(let error):
    state.isLoadingInsight = false
    
    // Only increment retry count for actual failures, not max retries reached
    if error != .maxRetriesReached {
        state.retryCount += 1
    }
    
    // Don't send another action - just update state
    if state.retryCount >= State.maxRetryCount {
        // Set final error state without sending action
        state.loadedInsight = nil
        // Could set an error state property here
    }
    
    return .none
```

#### **Alternative Fix:**
Create separate action for max retries:
```swift
enum Action {
    // ... existing actions
    case maxRetriesReached
}

case .insightFailed(let error):
    state.isLoadingInsight = false
    state.retryCount += 1
    
    if state.retryCount >= State.maxRetryCount {
        return .send(.maxRetriesReached)  // Different action
    }
    
    return .none

case .maxRetriesReached:
    // Handle final error state
    state.loadedInsight = nil
    return .none
```

#### **Testing Strategy:**
1. **Unit Test:** Verify no infinite actions when max retries reached
2. **Integration Test:** Test full retry flow with forced failures  
3. **Manual Test:** Verify app remains responsive after max retries
4. **Performance Test:** Monitor action queue and memory usage

---

## ⚠️ **HIGH PRIORITY BUGS**

### **Bug #002: Potential Race Conditions**
**Status:** 🟡 **SUSPECTED - NEEDS INVESTIGATION**  
**Priority:** P1 - Potential crashes  

#### **Description:**
Multiple rapid interest selections might cause race conditions in async insight loading.

#### **Location:** `Insights.swift:52-67` - `loadInsight` case
**Potential Issue:** No cancellation of previous requests when new interest selected

#### **Proposed Investigation:**
- Add request cancellation when new interest selected
- Test rapid interest switching behavior
- Monitor for completion handler races

---

### **Bug #003: Memory Leaks in Error States**
**Status:** 🟡 **SUSPECTED - NEEDS INVESTIGATION**  
**Priority:** P1 - Performance degradation  

#### **Description:**
Error states might not properly clean up resources, especially with retry logic.

#### **Potential Locations:**
- `Insights.swift:55-66` - Async API calls in run block
- Error handling doesn't cancel ongoing operations

#### **Investigation Steps:**
- Add memory profiling during error scenarios
- Verify proper async task cancellation
- Check for retained closures

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

- **Total Bugs:** 4 (1 Critical, 2 High, 1 Medium)
- **Resolved:** 1
- **Critical Open:** 1
- **Average Resolution Time:** TBD
- **Most Common Category:** State Management

---

## 🚀 **NEXT STEPS**

### **Immediate Actions (Today):**
1. **🔴 FIX BUG #001** - Critical infinite cycle
2. **🧪 Add test coverage** for retry scenarios
3. **📝 Document fix** and prevention strategies

### **This Week:**
1. **🔍 Investigate Bug #002** - Race conditions
2. **🔍 Investigate Bug #003** - Memory leaks  
3. **🧪 Comprehensive testing** of error scenarios

### **Future:**
1. **🛡️ Implement monitoring** for production bug detection
2. **📊 Add analytics** for error rates and patterns
3. **🔄 Regular bug review** sessions

---

*Last Updated: December 2024*  
*Next Review: After Bug #001 fix*  
*Contact: AI Assistant for technical details* 