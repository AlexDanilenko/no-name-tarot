//
//  LearnCardsPageView.swift
//  TarotApp
//
//  Created by Assistant on 2025.
//

import SwiftUI
import ComposableArchitecture

struct LearnCardsPageView: View {
    @Bindable var store: StoreOf<LearnCardsPage>
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 24) {
                ForEach(store.cardGroups) { group in
                    cardGroupSection(group: group)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 20)
        }
        .background(
            LinearGradient(
                colors: [
                    LunalitAsset.Assets.backgroundBlack.swiftUIColor,
                    LunalitAsset.Assets.buttonColorPurpleDark.swiftUIColor,
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .navigationTitle(String(localizable: .explore_all_cards_title))
        .navigationBarTitleDisplayMode(.inline)
        .sheet(item: $store.scope(state: \.paywall, action: \.paywall)) { paywallStore in
            PaywallView(store: paywallStore)
        }
        .sheet(item: $store.scope(state: \.cardDetail, action: \.cardDetail)) { cardDetailStore in
            LearnCardDetailView(store: cardDetailStore)
        }
    }
    
    @ViewBuilder
    private func cardGroupSection(group: LearnCardsPage.State.CardGroup) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            // Section Header
            Text(group.title)
                .font(.title2.weight(.bold))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Cards Grid
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 12) {
                // Unlocked cards (first 2)
                ForEach(group.unlockedCards(), id: \.id) { card in
                    cardView(card: card, isLocked: false)
                }
                
                // Locked cards (remaining)
                ForEach(group.lockedCards(), id: \.id) { card in
                    cardView(card: card, isLocked: !store.isSubscribed)
                }
            }
        }
    }
    
    @ViewBuilder
    private func cardView(card: TarotCard, isLocked: Bool) -> some View {
        PaywallWrapper(
            isLocked: isLocked,
            onTap: { store.send(.cardTapped(card)) }
        ) {
            VStack(spacing: 8) {
                Image(asset: card.asset)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(radius: 4)
                
                Text(localizable: card.localizationKey)
                    .font(.caption.weight(.medium))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(2, reservesSpace: true)
            }
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.ultraThinMaterial)
                    .opacity(0.3)
            )
        }
    }
}

#Preview {
    NavigationView {
        LearnCardsPageView(
            store: Store(
                initialState: LearnCardsPage.State(),
                reducer: { LearnCardsPage() }
            )
        )
    }
} 
