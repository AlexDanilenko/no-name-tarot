//
//  LearnCardSelectorView.swift
//  Lunalit
//
//  Created by Assistant on 2025.
//

import SwiftUI
import ComposableArchitecture

struct LearnCardSelectorView: View {
    @Bindable var store: StoreOf<LearnCardSelector>
    
    var body: some View {
        VStack(spacing: 16) {
            headerView
            cardGridView
        }
        .padding()
        .background(gradientBackground)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .sheet(item: $store.scope(state: \.paywall, action: \.paywall)) { paywallStore in
            PaywallView(store: paywallStore)
        }
        .navigationDestination(item: $store.scope(state: \.destination?.cardDetail, action: \.destination.cardDetail)) { cardDetailStore in
            LearnCardDetailView(store: cardDetailStore)
        }
        .navigationDestination(item: $store.scope(state: \.destination?.fullCardList, action: \.destination.fullCardList)) { fullListStore in
            LearnCardsPageView(store: fullListStore)
        }
    }
    
    private var headerView: some View {
        HStack {
            Text(.localizable(.learn_cards_title))
                .font(.title2.weight(.semibold))
                .foregroundStyle(.white)
            
            Spacer()
            
            Button {
                store.send(.viewAllCardsTapped)
            } label: {
                HStack(spacing: 4) {
                    Text(.localizable(.look_all_cards_button_title))
                    Image(systemName: "arrow.right")
                }
                .font(.caption.weight(.medium))
                .foregroundColor(.white.opacity(0.8))
            }
            .frame(alignment: .top)
        }
    }
    
    private var cardGridView: some View {
        Grid(horizontalSpacing: 8, verticalSpacing: 12) {
            WithViewStore(store) { state in
                let cards: [ViewState.Card] = state.availableCards.map({
                    .init(isPaywalled: false, card: $0)
                }) + state.lockedCards.map({
                    .init(isPaywalled: state.isSubscribed, card: $0)
                })
                
                return ViewState.init(cards: cards)
            } content: { viewStore in
                GridRow {
                    ForEach(viewStore.cards.prefix(3), id: \.card.id) { row in
                        // Available cards - no paywall wrapper needed
                        PaywallWrapper(
                            isLocked: row.isPaywalled,
                            onTap: { store.send(.cardTapped(row.card)) }
                        ) {
                            CardView(store: Store(
                                initialState: SpreadCard.State(card: row.card, isExposed: true),
                                reducer: { SpreadCard() }
                            ))
                        }
                    }
                }
                
                GridRow {
                    ForEach(viewStore.cards.dropFirst(3), id: \.card.id) { row in
                        // Available cards - no paywall wrapper needed
                        PaywallWrapper(
                            isLocked: row.isPaywalled,
                            onTap: { store.send(.cardTapped(row.card)) }
                        ) {
                            CardView(store: Store(
                                initialState: SpreadCard.State(card: row.card, isExposed: true),
                                reducer: { SpreadCard() }
                            ))
                        }
                    }
                }
            }
        }
    }
    
    private var gradientBackground: some View {
        LinearGradient(
            colors: [
                LunalitAsset.Assets.purpleLight1.swiftUIColor,
                LunalitAsset.Assets.purpleDark1.swiftUIColor,
            ],
            startPoint: UnitPoint(x: 0.13, y: 0),
            endPoint: UnitPoint(x: 0.87, y: 1)
        )
    }
}

// MARK: - Placeholder Views (will be implemented in later phases)

struct LearnCardDetailView: View {
    @Bindable var store: StoreOf<LearnCardDetail>
    
    var body: some View {
        VStack {
            Text("Card Detail")
            Text("Card: \(String(localizable: store.card.localizationKey))")
        }
        .navigationTitle("Card Detail")
    }
}

struct LearnCardsPageView: View {
    @Bindable var store: StoreOf<LearnCardsPage>
    
    private let gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
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
        .toolbarColorScheme(.light, for: .navigationBar, .tabBar)
        .background(LunalitAsset.Assets.backgroundBlack.swiftUIColor)
        .sheet(item: $store.scope(state: \.paywall, action: \.paywall)) { paywallStore in
            PaywallView(store: paywallStore)
        }
        .navigationDestination(item: $store.scope(state: \.cardDetail, action: \.cardDetail)) { cardDetailStore in
            LearnCardDetailView(store: cardDetailStore)
        }
    }
}

struct CardGroupSection: View {
    let group: LearnCardsPage.State.CardGroup
    let isSubscribed: Bool
    let onCardTap: (TarotCard) -> Void
    
    private let gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Section Header
            Text(group.title)
                .font(.title2.weight(.bold))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Cards Grid
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
        .padding(.vertical, 8)
    }
}

// MARK: - Card View Components

struct UnlockedCardView: View {
    let card: TarotCard
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            CardView(store: Store(
                initialState: SpreadCard.State(card: card, isExposed: true),
                reducer: { SpreadCard() }
            ))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct LockedCardView: View {
    let card: TarotCard
    let onTap: () -> Void
    
    var body: some View {
        PaywallWrapper(
            isLocked: true,
            onTap: onTap
        ) {
            CardView(store: Store(
                initialState: SpreadCard.State(card: card, isExposed: true),
                reducer: { SpreadCard() }
            ))
            .overlay {
                // Additional visual effect for locked state
                RoundedRectangle(cornerRadius: 12)
                    .fill(.black.opacity(0.4))
                    .blur(radius: 1)
            }
        }
    }
}

#Preview {
    NavigationView {
        LearnCardSelectorView(
            store: Store(
                initialState: LearnCardSelector.State(),
                reducer: { LearnCardSelector() }
            )
        )
        .padding()
    }
} 

extension LearnCardSelectorView {
    struct ViewState: Equatable {
        struct Card: Equatable {
            let isPaywalled: Bool
            let card: TarotCard
        }
        
        let cards: [Card]
    }
}
