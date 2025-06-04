# Insights & Interests Refactoring - Product Requirements Document

## 📋 Document Overview

**Project:** Insights & Interests System Refactoring  
**Version:** 1.0  
**Created:** December 2024  
**Status:** Planning Phase  
**Priority:** High  

---

## 🎯 Executive Summary

This PRD outlines the complete refactoring of the Insights and Interests systems within the Tarot app. The project aims to resolve architectural inconsistencies, improve code maintainability, enhance test coverage, and create a scalable foundation for future AI-powered insights features.

### Key Objectives
- ✅ **Unify Interest System** - Consolidate duplicate Interest enums
- ✅ **Extract Insights Architecture** - Create dedicated Insights reducer and view
- ✅ **Complete Test Coverage** - Achieve 100% test coverage for Insights
- ✅ **Fix Critical Bugs** - Resolve the missing `loadInsight` action case
- ✅ **Improve Code Quality** - Follow TCA best practices and clean architecture

---

## 📊 Current State Analysis

### 🔍 Issues Identified

#### 1. **Critical Bug: Missing Action Implementation**
- **Location:** `TarotApp/TarotApp/Sources/Features/HomePage/Spread/Spread.swift:86`
- **Issue:** Missing `case .loadInsight(let interest):` in action switch statement
- **Impact:** Insights cannot be loaded, causing runtime failures
- **Severity:** HIGH 🔴

#### 2. **Architecture Inconsistency: Duplicate Interest Enums**
- **Locations:** 
  - `PersonalInfo.State.Interest` (onboarding)
  - `Spread.State.Interest` (tarot spreads)
- **Issue:** Two different enum definitions with overlapping values
- **Impact:** Data inconsistency, maintenance overhead
- **Severity:** HIGH 🔴

#### 3. **Architecture Violation: Monolithic Spread Reducer**
- **Location:** `Spread.swift`
- **Issue:** Insights logic embedded within Spread reducer
- **Impact:** Poor separation of concerns, reduced testability
- **Severity:** MEDIUM 🟡

#### 4. **Test Coverage Gap**
- **Location:** `TarotAppTests.swift`
- **Issue:** Only one test for entire Insights system
- **Impact:** Reduced confidence in system reliability
- **Severity:** MEDIUM 🟡

### 📈 Current Metrics
- **Test Coverage:** ~5% (1 test out of estimated 20+ needed)
- **Code Duplication:** 2 Interest enum definitions
- **Architecture Compliance:** 60% (mixed concerns in Spread)
- **Bug Count:** 1 critical, 2 medium priority

---

## 🎯 Project Objectives & Success Criteria

### Primary Objectives

#### 1. **System Unification**
- **Goal:** Create single source of truth for Interest definitions
- **Success Criteria:** 
  - ✅ Single unified Interest enum
  - ✅ All references updated to use unified enum
  - ✅ Zero compilation errors
  - ✅ Backward compatibility maintained

#### 2. **Architecture Improvement**
- **Goal:** Extract Insights into dedicated components
- **Success Criteria:**
  - ✅ Separate `InsightsReducer` created
  - ✅ Separate `InsightsView` created
  - ✅ Clean composition with `Spread` reducer
  - ✅ Single responsibility principle followed

#### 3. **Quality Assurance**
- **Goal:** Comprehensive test coverage and bug resolution
- **Success Criteria:**
  - ✅ 100% test coverage for Insights functionality
  - ✅ All critical bugs resolved
  - ✅ All tests passing
  - ✅ Edge cases covered

### Secondary Objectives

#### 4. **Performance Optimization**
- **Goal:** Improve insights loading and caching
- **Success Criteria:**
  - ✅ Insights caching implemented
  - ✅ Loading states properly managed
  - ✅ Error handling improved

#### 5. **Developer Experience**
- **Goal:** Improve code maintainability and documentation
- **Success Criteria:**
  - ✅ Clear code documentation
  - ✅ Consistent naming conventions
  - ✅ Easy to extend for new features

---

## 🏗️ Technical Specifications

### 1. **Unified Interest System**

#### New Interest Enum Definition
```swift
enum Interest: String, CaseIterable, Codable {
    case love = "Love & Relationships"
    case career = "Career & Work" 
    case finance = "Money & Finance"
    case mood = "Mood & Energy"
    case future = "Future Insights"
    case spiritual = "Spirituality & Growth"
    case relations = "Relationships"
    case situations = "Life Situations"
    
    var displayName: String { rawValue }
    var iconName: String { "interest_\(self)" }
}
```

#### Migration Strategy
- Create shared Interest enum in `TarotApp/Sources/Model/Interest.swift`
- Update all existing references
- Maintain backward compatibility through computed properties

### 2. **Insights Architecture**

#### New File Structure
```
TarotApp/Sources/Features/HomePage/Insights/
├── InsightsReducer.swift
├── InsightsView.swift
├── InsightsModels.swift
└── Tests/
    ├── InsightsReducerTests.swift
    └── InsightsViewTests.swift
```

#### InsightsReducer Specification
```swift
@Reducer
struct Insights {
    @ObservableState
    struct State: Equatable {
        var selectedInterest: Interest?
        var loadedInsight: Insight?
        var isLoading: Bool = false
        var error: InsightsError?
        var retryCount: Int = 0
    }
    
    enum Action {
        case selectInterest(Interest)
        case loadInsight(Interest, cards: [TarotCard])
        case insightLoaded(Insight)
        case insightFailed(InsightsError)
        case retry
        case clearSelection
    }
}
```

#### InsightsView Specification
```swift
struct InsightsView: View {
    let store: StoreOf<Insights>
    
    var body: some View {
        // Interest selection UI
        // Loading states
        // Insight display
        // Error handling
    }
}
```

### 3. **Testing Strategy**

#### Test Categories
1. **Unit Tests** - Individual function testing
2. **Integration Tests** - Reducer composition testing  
3. **UI Tests** - View interaction testing
4. **API Tests** - GPT integration testing
5. **Edge Case Tests** - Error scenarios and limits

#### Coverage Requirements
- **Minimum:** 95% code coverage
- **Target:** 100% code coverage
- **Critical paths:** 100% coverage mandatory

---

## 📅 Implementation Roadmap

### **Phase 1: Foundation (Week 1)**
**Priority:** Critical 🔴  
**Estimated Effort:** 8 hours

#### Tasks:
1. **Create Unified Interest Enum** (2 hours)
   - [ ] Create `TarotApp/Sources/Model/Interest.swift`
   - [ ] Define unified Interest enum with all cases
   - [ ] Add display properties and utility methods

2. **Fix Critical Bug** (1 hour)
   - [ ] Implement missing `loadInsight` action case in `Spread.swift`
   - [ ] Test basic functionality

3. **Update References** (3 hours)
   - [ ] Replace `PersonalInfo.State.Interest` references
   - [ ] Replace `Spread.State.Interest` references
   - [ ] Update import statements

4. **Verify Compilation** (2 hours)
   - [ ] Ensure zero compilation errors
   - [ ] Run existing tests
   - [ ] Fix any immediate issues

#### Deliverables:
- ✅ Unified Interest system
- ✅ Fixed critical bug
- ✅ Clean compilation
- ✅ Basic functionality working

---

### **Phase 2: Architecture Extraction (Week 2)**
**Priority:** High 🟡  
**Estimated Effort:** 12 hours

#### Tasks:
1. **Create Insights Components** (4 hours)
   - [ ] Create `InsightsReducer.swift`
   - [ ] Create `InsightsView.swift`
   - [ ] Create `InsightsModels.swift`

2. **Extract Logic from Spread** (4 hours)
   - [ ] Move insights state to InsightsReducer
   - [ ] Move insights actions to InsightsReducer
   - [ ] Create composition in Spread reducer

3. **Update Views** (2 hours)
   - [ ] Integrate InsightsView into SpreadView
   - [ ] Update navigation and state management

4. **Verify Integration** (2 hours)
   - [ ] Test reducer composition
   - [ ] Verify UI integration
   - [ ] Check data flow

#### Deliverables:
- ✅ Separate Insights architecture
- ✅ Clean composition with Spread
- ✅ Working UI integration
- ✅ Maintained functionality

---

### **Phase 3: Comprehensive Testing (Week 3)**
**Priority:** High 🟡  
**Estimated Effort:** 16 hours

#### Tasks:
1. **Create Test Infrastructure** (4 hours)
   - [ ] Set up test files and structure
   - [ ] Create mock dependencies
   - [ ] Set up test utilities

2. **Write Core Tests** (6 hours)
   - [ ] InsightsReducer unit tests
   - [ ] Interest selection tests
   - [ ] Insight loading tests
   - [ ] Error handling tests

3. **Integration Testing** (4 hours)
   - [ ] Spread-Insights composition tests
   - [ ] GPT API integration tests
   - [ ] End-to-end flow tests

4. **Edge Case Testing** (2 hours)
   - [ ] Network failure scenarios
   - [ ] Invalid input handling
   - [ ] Retry mechanism testing

#### Deliverables:
- ✅ 100% test coverage for Insights
- ✅ All tests passing
- ✅ Edge cases covered
- ✅ Robust error handling

---

### **Phase 4: Enhancement & Optimization (Week 4)**
**Priority:** Medium 🟢  
**Estimated Effort:** 8 hours

#### Tasks:
1. **Performance Improvements** (3 hours)
   - [ ] Implement insights caching
   - [ ] Optimize loading states
   - [ ] Add request deduplication

2. **User Experience** (3 hours)
   - [ ] Improve loading animations
   - [ ] Add retry functionality
   - [ ] Enhanced error messages

3. **Documentation** (2 hours)
   - [ ] Code documentation
   - [ ] Update FUNCTIONALITY.md
   - [ ] Create usage examples

#### Deliverables:
- ✅ Optimized performance
- ✅ Enhanced user experience
- ✅ Complete documentation
- ✅ Production-ready code

---

## 🧪 Testing Strategy

### Test Coverage Requirements

#### **Reducer Tests** (Target: 100%)
```swift
// InsightsReducerTests.swift
- test_selectInterest_setsSelectedInterest()
- test_selectInterest_triggersLoading()
- test_loadInsight_callsGPTAPI()
- test_loadInsight_handlesSuccess()
- test_loadInsight_handlesFailure()
- test_retry_resetsState()
- test_retry_incrementsCount()
- test_clearSelection_resetsAll()
```

#### **Integration Tests** (Target: 100%)
```swift
// SpreadInsightsIntegrationTests.swift
- test_cardOpening_enablesInsights()
- test_interestSelection_loadsInsight()
- test_insightLoading_updatesUI()
- test_errorHandling_showsRetry()
```

#### **UI Tests** (Target: 90%)
```swift
// InsightsViewTests.swift
- test_interestButtons_tapSelection()
- test_loadingState_showsProgress()
- test_insightDisplay_showsContent()
- test_errorState_showsRetry()
```

### Quality Gates
- [ ] All tests pass
- [ ] Code coverage > 95%
- [ ] No memory leaks
- [ ] Performance benchmarks met
- [ ] Accessibility compliance

---

## 🚀 Risk Assessment & Mitigation

### **High Risk Items**

#### 1. **Data Migration Risk**
- **Risk:** User data incompatibility after Interest enum changes
- **Impact:** Data loss, user experience degradation
- **Mitigation:** 
  - Comprehensive migration testing
  - Backward compatibility layer
  - Rollback plan prepared

#### 2. **API Integration Risk**
- **Risk:** GPT API changes or failures during refactoring
- **Impact:** Insights functionality broken
- **Mitigation:**
  - Mock API for testing
  - Graceful fallback handling
  - API versioning strategy

### **Medium Risk Items**

#### 3. **Performance Regression Risk**
- **Risk:** New architecture introduces performance issues
- **Impact:** Slower user experience
- **Mitigation:**
  - Performance benchmarking
  - Profiling during development
  - Optimization checkpoints

#### 4. **Testing Complexity Risk**
- **Risk:** Complex reducer composition makes testing difficult
- **Impact:** Reduced test quality, longer development time
- **Mitigation:**
  - Test-driven development approach
  - Simple, focused test design
  - Mock strategy for dependencies

---

## 📋 Acceptance Criteria

### **Must Have (P0)**
- [ ] Single unified Interest enum across entire app
- [ ] Separate Insights reducer with clean API
- [ ] Separate Insights view with proper UI
- [ ] 100% test coverage for critical paths
- [ ] Zero critical bugs
- [ ] All existing functionality maintained

### **Should Have (P1)**
- [ ] Insights caching for performance
- [ ] Enhanced error handling with retry
- [ ] Improved loading states and animations
- [ ] Complete test coverage (95%+)
- [ ] Documentation and code comments

### **Could Have (P2)**
- [ ] Analytics tracking for insights usage
- [ ] A/B testing framework for UI
- [ ] Advanced caching strategies
- [ ] Insights history feature
- [ ] Personalization based on user interests

---

## 🔍 Success Metrics

### **Technical Metrics**
- **Test Coverage:** 95%+ (Target: 100%)
- **Build Time:** No increase (maintain < 30s)
- **Code Duplication:** 0% for Interest definitions
- **Cyclomatic Complexity:** < 10 per function
- **Memory Usage:** No increase in baseline

### **Quality Metrics**
- **Bug Count:** 0 critical, < 2 minor
- **Code Review Score:** > 90%
- **Documentation Coverage:** 100% for public APIs
- **Performance:** No regression in loading times

### **User Experience Metrics**
- **Insights Load Time:** < 3 seconds
- **Error Rate:** < 1% for insights requests
- **User Satisfaction:** Maintain current levels
- **Feature Adoption:** Track insights usage

---

## 📚 Dependencies & Constraints

### **Technical Dependencies**
- TCA (The Composable Architecture) framework
- GPT API integration
- SwiftUI framework
- XCTest framework

### **Resource Constraints**
- **Timeline:** 4 weeks maximum
- **Team Size:** 1 developer (with AI assistance)
- **Budget:** Development time only
- **Environment:** iOS 15+ target

### **External Dependencies**
- GPT API availability and stability
- App Store review process (if changes affect user experience)
- CI/CD pipeline capacity

---

## 🎯 Next Steps

### **Immediate Actions (This Week)**
1. **Review and Approve PRD** - Stakeholder sign-off
2. **Set Up Development Environment** - Branch creation, tools setup
3. **Begin Phase 1 Implementation** - Start with unified Interest enum

### **Preparation Tasks**
- [ ] Create feature branch: `feature/insights-refactoring`
- [ ] Set up project tracking (GitHub Issues)
- [ ] Configure CI/CD for new test requirements
- [ ] Prepare rollback strategy

### **Communication Plan**
- **Weekly Status Updates** - Progress against roadmap
- **Blocker Escalation** - Immediate notification of critical issues
- **Demo Sessions** - End of each phase demonstration

---

## 📞 Stakeholders & Contacts

### **Decision Makers**
- **Product Owner:** User (Developer)
- **Technical Lead:** AI Assistant
- **QA Lead:** Automated Testing Suite

### **Reviewers**
- Code Review: AI Assistant + User validation
- Testing Review: Comprehensive test suite
- UX Review: User acceptance testing

---

*This PRD serves as the single source of truth for the Insights & Interests refactoring project. All implementation decisions should reference this document, and any changes should be documented through PRD updates.*

---

**Document Status:** ✅ Ready for Implementation  
**Next Review Date:** End of Phase 1  
**Version Control:** Track in Git alongside codebase 