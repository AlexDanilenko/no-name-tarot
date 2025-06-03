# Lunalit Tarot App - Functionality Documentation

## Project Overview

**Lunalit** is a comprehensive iOS tarot reading application built with SwiftUI and The Composable Architecture (TCA). The app provides daily tarot readings, multi-card spreads, and AI-powered insights to enhance the user's tarot experience.

---

## Architecture

### Core Technologies
- **SwiftUI** - Modern declarative UI framework
- **The Composable Architecture (TCA)** - State management and navigation
- **SwiftData** - Core Data replacement for persistence
- **GPT API Integration** - AI-powered tarot insights
- **Xcode 16** with Swift 6 support

### Navigation Structure
The app uses TCA's navigation system with a hierarchical structure:

```
AppRoot
├── HomePage
│   ├── HomeTab (Daily Card, Spread Selection)
│   └── Navigation Path
│       └── Spread (Three/Five Card Spreads)
├── PersonalInfo
├── Paywall
└── ContentView (Main routing)
```

---

## Features

### 1. Daily Card Feature
- **Location**: `TarotApp/Sources/Features/HomePage/DailyCard/`
- **Functionality**:
  - Fetches a daily tarot card for the user
  - Displays card imagery and basic interpretation
  - Persists daily cards using SwiftData
  - Prevents duplicate daily cards for the same date

**State Management**:
```swift
enum DailyCard.State: Equatable {
    case loading
    case loaded(Day)
    case error(String)
}
```

### 2. Multi-Card Spreads
- **Location**: `TarotApp/Sources/Features/HomePage/Spread/`
- **Types**:
  - **Three Card Spread**: Past, Present, Future reading
  - **Five Card Spread**: More complex relationship/situation analysis

**Content Types**:
```swift
enum Content: Equatable {
    case three(ThreeCardSpread.State)
    case five(FiveCardSpread.State)
}
```

### 3. AI-Powered Insights
- **Location**: `TarotApp/Sources/Features/HomePage/Spread/`
- **Functionality**:
  - GPT integration for personalized tarot interpretations
  - Multiple interest categories for targeted insights
  - Real-time insight generation based on card combinations

**Interest Categories**:
```swift
enum Interest: String, CaseIterable {
    case love = "Love & Relationships"
    case money = "Money & Finance"
    case career = "Career & Work"
    case health = "Health & Wellness"
    case spirituality = "Spirituality & Growth"
    case general = "General Life Guidance"
}
```

### 4. Persistent Storage System
- **Location**: `TarotApp/Sources/Model/Services/PersistentStorage.swift`
- **Functionality**:
  - Generic SwiftData storage wrapper
  - CRUD operations with async/await
  - Automatic sorting and fetching
  - Complete test coverage

**Storage Operations**:
- `store(_:)` - Save entities
- `fetch()` - Retrieve all entities
- `fetchOne()` - Get most recent entity
- `delete(_:)` - Remove specific entity
- `deleteAll()` - Clear all data

---

## Data Models

### Day Entity (SwiftData)
```swift
@Model
final class Day {
    var id: UUID
    var date: Date
    var card: TarotCard
    var advice: String
    
    // Computed property for date components
    var dateComponents: DateComponents { get set }
}
```

### Tarot Card System
```swift
enum TarotCard: Codable, Equatable {
    case major(MajorArcana)
    case minor(MinorArcana)
}

enum MajorArcana: String, CaseIterable {
    case theFool = "The Fool"
    case theMagician = "The Magician"
    case theHighPriestess = "The High Priestess"
    // ... 22 major arcana cards
}
```

### Card Display
- **Location**: `TarotApp/Sources/Features/Card/`
- **Components**:
  - `CardView` - Visual card representation
  - `CardBackView` - Card back design
  - Asset management for card imagery

---

## Navigation & User Flow

### 1. Home Tab Navigation
```swift
// HomePage handles navigation to spreads
case .homeTab(action):
    switch action {
    case .threeCardSpreadTapped:
        state.path.append(.spread(Spread.State(...)))
    case .fiveCardSpreadTapped:
        state.path.append(.spread(Spread.State(...)))
    }
```

### 2. Spread Selection Flow
1. User opens app → Home Tab
2. Selects "Three Card Spread" or "Five Card Spread"
3. Navigates to Spread view
4. Selects interest category for insights
5. Receives AI-generated interpretation

---

## Testing Suite

### Test Coverage
- **PersistentStorageTests** (5 tests) - Storage operations
- **TarotAppTests** (1 test) - TCA integration
- **Total**: 6 tests passing ✅

### Test Features
```swift
// Async testing with SwiftData
func test_store_shouldSaveItem() async throws
func test_fetch_shouldReturnStoredItems() async throws
func test_fetchOne_shouldReturnMostRecentItem() async throws
func test_delete_shouldRemoveItem() async throws
func test_deleteAll_shouldRemoveAllItems() async throws

// TCA testing with dependencies
func test_selectInterestLoadsInsight() async
```

---

## Dependencies

### Swift Package Manager Dependencies
```swift
// Package.swift equivalents
- swift-composable-architecture (TCA)
- swift-navigation (Navigation tools)
- swift-dependencies (Dependency injection)
- swift-case-paths (Enum utilities)
- swift-collections (Collection utilities)
- swift-sharing (State sharing)
- swift-perception (Observation tools)
- LLMChatOpenAI (GPT integration)
- JSONSchema (API schemas)
```

---

## Recent Fixes & Improvements

### Compilation Issues Resolution (June 2025)
✅ **Branch**: `fix/compilation-issues`

**TCA Navigation Fixes**:
- Fixed `@Bindable` annotations for store properties
- Resolved TCA navigation type mismatches (`StackAction<Path.State, Path.Action>`)
- Fixed `forEach` reducer configurations
- Added missing `Equatable` conformance to `HomePage.State`

**SwiftData Model Fixes**:
- Fixed SwiftData `Day` model compatibility (`let` → `var` properties)
- Fixed `DailyCard.State` initialization (`.loading` instead of `.init()`)

**Missing Components**:
- Added missing `.spread` case to `ContentView` switch
- Added required `numberOfTries` parameter to `Spread.State`
- Fixed `SpreadButtonStyle` calls with required `numberOfCards`

**Test Fixes**:
- Updated `PersistentStorage` test initialization
- Updated TCA test to use newer API (key paths)

### Git Security Resolution
✅ **Resolved**: GitHub token security issues
- Cleaned git history using `git-filter-repo`
- Replaced hardcoded tokens with environment variables
- Successfully pushed all branches without security warnings

---

## Project Structure

```
TarotApp/
├── Sources/
│   ├── App/                    # App configuration & root
│   │   ├── HomePage/           # Main dashboard
│   │   │   ├── DailyCard/      # Daily card feature
│   │   │   ├── HomeTab/        # Tab navigation
│   │   │   └── Spread/         # Multi-card spreads
│   │   ├── Card/               # Card display components
│   │   └── PersonalInfo/       # User preferences
│   ├── Model/
│   │   ├── Data/              # SwiftData models
│   │   ├── Services/          # Storage & API services
│   │   └── TarotCard/         # Card definitions
│   └── Resources/             # Assets & localization
├── Tests/                     # Test suite
├── Derived/                   # Generated files
└── TarotApp.xcodeproj        # Xcode project
```

---

## Build Status

- ✅ **Build**: Successful
- ✅ **Tests**: 6/6 passing
- ✅ **Warnings**: Only minor Sendable warnings
- ✅ **Platform**: iOS 17.0+ / iPhone Simulator

---

## Future Enhancement Areas

### Potential Features
1. **Card History Tracking** - View past readings
2. **Custom Spreads** - User-defined card layouts  
3. **Social Sharing** - Share readings with friends
4. **Advanced Insights** - More detailed AI interpretations
5. **Card Learning** - Educational card meanings
6. **Premium Features** - Advanced spreads and insights
7. **Notification System** - Daily reading reminders

### Technical Improvements
1. **Performance Optimization** - Lazy loading for large datasets
2. **Offline Support** - Local card definitions and basic insights
3. **UI/UX Enhancements** - Animations and haptic feedback
4. **Accessibility** - VoiceOver and accessibility improvements
5. **Localization** - Multi-language support

---

## Maintenance Notes

### Regular Updates Needed
- Update this document when features are added/modified
- Maintain test coverage above 80%
- Review and update dependencies quarterly
- Monitor GPT API usage and costs
- Update card imagery and descriptions as needed

### Code Quality Standards
- All TCA reducers must have corresponding tests
- SwiftData models require full CRUD test coverage
- UI components should have accessibility labels
- All public APIs must have documentation comments

---

*Last Updated: June 2025*
*Version: 1.0*
*Author: AI Assistant with Human Developer* 