# 📱 Tarot App – "Explore All Cards" Feature – Technical Specification

## 🎯 Overview
Implementation of the complete tarot cards exploration feature with premium paywall integration, following The Composable Architecture (TCA) patterns established in the existing codebase.

---

## 🏗️ Architecture Overview

### Core Components
- **LearnCardSelectorView** - Home page teaser block (6 cards preview)
- **LearnCardsPage** - Full card list with arcana grouping  
- **LearnCardDetailView** - Individual card detail screen
- **PaywallModal** - Bottom sheet subscription prompt

### Tech Stack Alignment
- **Architecture**: TCA (The Composable Architecture)
- **UI Framework**: SwiftUI
- **Build System**: Tuist
- **Data Models**: Existing `TarotCard` enum (78 cards total)
- **Paywall Integration**: Existing `Paywall` reducer and subscription system

---

## 📋 Phase 1: Home Screen Block Enhancement

### 🔧 LearnCardSelector (TCA Reducer)
**File**: `TarotApp/Sources/Features/HomePage/LearnCards/LearnCardSelector.swift`

```swift
@Reducer
struct LearnCardSelector {
    @ObservableState
    struct State: Equatable {
        let availableCards: [TarotCard] = Array(TarotCard.allCases.prefix(2)) // Free cards
        let lockedCards: [TarotCard] = Array(TarotCard.allCases.dropFirst(2).prefix(4)) // Locked cards
        
        @Shared(.appStorage("isSubscribed"))
        var isSubscribed: Bool = false
        
        @Presents var paywall: Paywall.State?
        @Presents var destination: Destination.State?
    }
    
    @CasePathable
    enum Action {
        case cardTapped(TarotCard)
        case viewAllCardsTapped
        case paywall(PresentationAction<Paywall.Action>)
        case destination(PresentationAction<Destination.Action>)
    }
    
    @Reducer(state: .equatable)
    enum Destination {
        case cardDetail(LearnCardDetail)
        case fullCardList(LearnCardsPage)
    }
}
```

### 🎨 LearnCardSelectorView (SwiftUI)
**File**: `TarotApp/Sources/Features/HomePage/LearnCards/LearnCardSelectorView.swift`

```swift
struct LearnCardSelectorView: View {
    @Bindable var store: StoreOf<LearnCardSelector>
    
    var body: some View {
        VStack(spacing: 16) {
            headerView
            cardGridView
            viewAllButton
        }
        .padding()
        .background(gradientBackground)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
    
    private var cardGridView: some View {
        Grid(horizontalSpacing: 8, verticalSpacing: 12) {
            GridRow {
                ForEach(store.availableCards.prefix(3), id: \.id) { card in
                    UnlockedCardView(card: card) {
                        store.send(.cardTapped(card))
                    }
                }
            }
            GridRow {
                ForEach(store.lockedCards.prefix(3), id: \.id) { card in
                    LockedCardView(card: card) {
                        store.send(.cardTapped(card))
                    }
                }
            }
        }
    }
}
```

---

## 📋 Phase 2: Full Card List Screen

### 🔧 LearnCardsPage (TCA Reducer)
**File**: `TarotApp/Sources/Features/HomePage/LearnCards/LearnCardsPage.swift`

```swift
@Reducer
struct LearnCardsPage {
    @ObservableState
    struct State: Equatable {
        let cardGroups: [CardGroup] = [
            CardGroup(title: "Major Arcana", cards: TarotCard.Major.allCases.map(TarotCard.major)),
            CardGroup(title: "Cups", cards: TarotCard.Minor.allCases.map(TarotCard.cups)),
            CardGroup(title: "Swords", cards: TarotCard.Minor.allCases.map(TarotCard.swords)),
            CardGroup(title: "Wands", cards: TarotCard.Minor.allCases.map(TarotCard.wands)),
            CardGroup(title: "Pentacles", cards: TarotCard.Minor.allCases.map(TarotCard.pentacles))
        ]
        
        @Shared(.appStorage("isSubscribed"))
        var isSubscribed: Bool = false
        
        @Presents var paywall: Paywall.State?
        @Presents var cardDetail: LearnCardDetail.State?
        
        struct CardGroup: Equatable, Identifiable {
            let id = UUID()
            let title: String
            let cards: [TarotCard]
            
            func unlockedCards() -> [TarotCard] {
                Array(cards.prefix(2))
            }
            
            func lockedCards() -> [TarotCard] {
                Array(cards.dropFirst(2))
            }
        }
    }
    
    @CasePathable
    enum Action {
        case cardTapped(TarotCard)
        case paywall(PresentationAction<Paywall.Action>)
        case cardDetail(PresentationAction<LearnCardDetail.Action>)
    }
}
```

### 🎨 LearnCardsPageView (SwiftUI)
**File**: `TarotApp/Sources/Features/HomePage/LearnCards/LearnCardsPageView.swift`

```swift
struct LearnCardsPageView: View {
    @Bindable var store: StoreOf<LearnCardsPage>
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(store.cardGroups) { group in
                        CardGroupSection(
                            group: group,
                            isSubscribed: store.isSubscribed
                        ) { card in
                            store.send(.cardTapped(card))
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("All Tarot Cards")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct CardGroupSection: View {
    let group: LearnCardsPage.State.CardGroup
    let isSubscribed: Bool
    let onCardTap: (TarotCard) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(group.title)
                .font(.title2.weight(.bold))
                .foregroundColor(.primary)
            
            LazyVGrid(columns: gridLayout, spacing: 12) {
                // Unlocked cards (first 2)
                ForEach(group.unlockedCards(), id: \.id) { card in
                    UnlockedCardView(card: card) {
                        onCardTap(card)
                    }
                }
                
                // Locked cards (remaining)
                ForEach(group.lockedCards(), id: \.id) { card in
                    if isSubscribed {
                        UnlockedCardView(card: card) {
                            onCardTap(card)
                        }
                    } else {
                        LockedCardView(card: card) {
                            onCardTap(card)
                        }
                    }
                }
            }
        }
    }
}
```

---

## 📋 Phase 3: Card Detail Screen

### 🔧 LearnCardDetail (TCA Reducer)
**File**: `TarotApp/Sources/Features/HomePage/LearnCards/LearnCardDetail.swift`

```swift
@Reducer
struct LearnCardDetail {
    @ObservableState
    struct State: Equatable {
        let card: TarotCard
        var cardMeaning: String = ""
        var isLoading: Bool = false
        var error: String?
    }
    
    @CasePathable
    enum Action {
        case onAppear
        case meaningLoaded(String)
        case meaningFailed(String)
    }
    
    @Dependency(\.tarotAPIClient) var tarotAPIClient
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.isLoading = true
                return .run { [card = state.card] send in
                    do {
                        let meaning = try await tarotAPIClient.getCardMeaning(card)
                        await send(.meaningLoaded(meaning))
                    } catch {
                        await send(.meaningFailed(error.localizedDescription))
                    }
                }
                
            case .meaningLoaded(let meaning):
                state.isLoading = false
                state.cardMeaning = meaning
                state.error = nil
                return .none
                
            case .meaningFailed(let error):
                state.isLoading = false
                state.error = error
                return .none
            }
        }
    }
}
```

### 🎨 LearnCardDetailView (SwiftUI)
**File**: `TarotApp/Sources/Features/HomePage/LearnCards/LearnCardDetailView.swift`

```swift
struct LearnCardDetailView: View {
    @Bindable var store: StoreOf<LearnCardDetail>
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Card Image
                Image(asset: store.card.asset)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 10)
                
                // Card Name
                Text(String(localizable: store.card.localizationKey))
                    .font(.largeTitle.weight(.bold))
                    .multilineTextAlignment(.center)
                
                // Card Meaning
                Group {
                    if store.isLoading {
                        ProgressView("Loading meaning...")
                            .frame(minHeight: 100)
                    } else if let error = store.error {
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                    } else {
                        Text(store.cardMeaning)
                            .font(.body)
                            .lineLimit(nil)
                            .multilineTextAlignment(.leading)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            store.send(.onAppear)
        }
    }
}
```

---

## 📋 Phase 4: Paywall Modal Integration

### 🔧 Enhanced Paywall Presentation
**File**: `TarotApp/Sources/Features/HomePage/LearnCards/PaywallModalPresentation.swift`

```swift
extension View {
    func paywallBottomSheet<Store: StoreProtocol>(
        store: Store,
        isPresented: Binding<Bool>
    ) -> some View where Store.State == Paywall.State, Store.Action == Paywall.Action {
        self.sheet(isPresented: isPresented) {
            PaywallBottomSheetView(store: store)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
    }
}

struct PaywallBottomSheetView: View {
    @Bindable var store: StoreOf<Paywall>
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Header
                VStack(spacing: 8) {
                    Image(systemName: "lock.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.purple)
                    
                    Text("Unlock All Cards")
                        .font(.title.weight(.bold))
                    
                    Text("Access all 78 tarot cards with Premium")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(.top)
                
                // Existing PaywallView content
                PaywallView(store: store)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Close") {
                        // Handle close action
                    }
                }
            }
        }
    }
}
```

---

## 📋 Phase 5: Shared Components

### 🎨 Card Components
**File**: `TarotApp/Sources/Features/HomePage/LearnCards/Components/CardViews.swift`

```swift
struct UnlockedCardView: View {
    let card: TarotCard
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            Image(asset: card.asset)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct LockedCardView: View {
    let card: TarotCard
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            ZStack {
                Image(asset: card.asset)
                    .resizable()
                    .scaledToFit()
                    .blur(radius: 4)
                    .opacity(0.6)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                // Lock overlay
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.black.opacity(0.3))
                
                VStack(spacing: 8) {
                    Image(systemName: "lock.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    Text("Premium")
                        .font(.caption.weight(.semibold))
                        .foregroundColor(.white)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
```

---

## 📋 Phase 6: Data Layer Enhancement

### 🔧 Tarot API Client Extension
**File**: `TarotApp/Sources/API/Tarot/TarotAPIClient+CardMeaning.swift`

```swift
extension TarotAPIClient {
    func getCardMeaning(_ card: TarotCard) async throws -> String {
        // Implementation for fetching card meanings from OpenAI
        let request = OpenAIRequest<OpenAICardMeaning>.cardMeaning(for: card)
        let response = try await openAIClient.send(request)
        return response.meaning
    }
}

struct OpenAICardMeaning: OpenAIResponseSchema {
    let meaning: String
    
    static let schema: LLMChatOpenAI.Options.ResponseFormat.Schema = .init(
        name: "card_meaning",
        description: "Tarot card meaning and interpretation",
        schema: .object(
            description: "Card meaning container",
            properties: [
                CodingKeys.meaning.stringValue: .string(
                    description: "Detailed meaning and interpretation of the tarot card"
                )
            ],
            required: [CodingKeys.meaning.stringValue],
            additionalProperties: .boolean(false)
        ),
        strict: true
    )
}
```

---

## 🔄 Integration Points

### 1. Update HomePage Integration
**File**: `TarotApp/Sources/Features/HomePage/HomePage.swift`

```swift
// Replace existing LearnCardsView with LearnCardSelectorView
// Add navigation handling for LearnCardsPage
```

### 2. Navigation Flow
```
HomePageView 
  → LearnCardSelectorView (6 cards preview)
    → [Card Tap] → LearnCardDetailView | PaywallModal
    → [View All] → LearnCardsPageView
      → [Card Tap] → LearnCardDetailView | PaywallModal
```

### 3. Subscription State Management
- Leverage existing `@Shared(.appStorage("isSubscribed"))` from `Paywall.State`
- Cards unlock automatically when `isSubscribed = true`

---

## 📱 UI/UX Specifications

### Visual Design
- **Card Aspect Ratio**: 2:3 (standard tarot proportions)
- **Grid Layout**: 3 columns on iPhone, adaptive on iPad
- **Blur Effect**: `blur(radius: 4)` + `opacity(0.6)` for locked cards
- **Lock Icon**: SF Symbol `lock.fill` with white color
- **Corner Radius**: 12pt for cards, 25pt for containers

### Animations
- **Card Tap**: Scale animation (0.95 → 1.0)
- **Unlock Transition**: Fade in + scale for newly unlocked cards
- **Loading States**: SwiftUI `ProgressView` with custom styling

### Accessibility
- **VoiceOver Labels**: Card names + "Premium required" for locked cards
- **Dynamic Type**: Support for all accessibility font sizes
- **High Contrast**: Maintain visual hierarchy in high contrast mode

---

## 🧪 Testing Strategy

### 1. Unit Tests
- `LearnCardSelector` reducer logic
- `LearnCardsPage` card grouping
- `LearnCardDetail` meaning loading
- Subscription state changes

### 2. UI Tests
- Card selection flow
- Paywall presentation
- Navigation between screens
- Accessibility compliance

### 3. Integration Tests
- End-to-end card exploration flow
- Subscription unlock behavior
- API integration for card meanings

---

## 📊 Success Metrics

### Technical Metrics
- **Performance**: <200ms for screen transitions
- **Memory**: <50MB additional memory usage
- **Crash Rate**: <0.1% for card-related features

### Business Metrics
- **Engagement**: Time spent on card exploration screens
- **Conversion**: Paywall presentation → subscription rate
- **Retention**: User return rate after exploring cards

---

## 🚀 Implementation Timeline

### Week 1: Foundation
- [ ] Update `LearnCardSelector` with TCA pattern
- [ ] Implement basic `LearnCardSelectorView`
- [ ] Set up navigation structure

### Week 2: Full Card List
- [ ] Implement `LearnCardsPage` reducer
- [ ] Create `LearnCardsPageView` with arcana grouping
- [ ] Add card grid components

### Week 3: Details & Paywall
- [ ] Implement `LearnCardDetail` screen
- [ ] Integrate paywall bottom sheet
- [ ] Add card meaning API integration

### Week 4: Polish & Testing
- [ ] UI/UX refinements
- [ ] Accessibility improvements
- [ ] Unit and integration tests
- [ ] Performance optimization

---

## 🔒 Security Considerations

### Subscription Validation
- Server-side subscription verification
- Local state protection against tampering
- Graceful handling of subscription expiry

### API Security
- Rate limiting for card meaning requests
- Secure OpenAI API key management
- Error handling for API failures

---

This technical specification provides a comprehensive foundation for implementing the "Explore All Cards" feature while maintaining consistency with the existing TCA architecture and design patterns in the tarot app. 