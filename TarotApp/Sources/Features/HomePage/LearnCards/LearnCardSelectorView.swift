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
            WithViewStore(store, observe: { state in
                ViewState(
                    cards: state.availableCards.map { ViewState.Card(isPaywalled: false, card: $0) } +
                           state.lockedCards.map { ViewState.Card(isPaywalled: !state.isSubscribed, card: $0) }
                )
            }) { viewStore in
                GridRow {
                    ForEach(viewStore.cards.prefix(3), id: \.card.id) { row in
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

// MARK: - Navigation Handling

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
