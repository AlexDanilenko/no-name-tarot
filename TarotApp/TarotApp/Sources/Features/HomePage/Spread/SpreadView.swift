//
//  SpreadView.swift
//  Lunalit
//
//  Created by Oleksandr Danylenko on 15.05.2025.
//

import SwiftUI
import ComposableArchitecture

struct SpreadView: View {
    
    var store: StoreOf<Spread>
    
    var body: some View {
        NavigationView {
            ScrollView {
                WithViewStore(store, observe: { $0 }) { viewStore in
                    VStack(spacing: 32) {
                        // Cards Spread Section
                        CardsSpreadView(
                            store: store.scope(state: \.content, action: \.spread)
                        )
                        .padding(.vertical, 32)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(LunalitAsset.Assets.backgroundLightBlue.swiftUIColor, lineWidth: 1)
                        })
                        
                        // Insights Section - Only show when cards are opened
                        if viewStore.areCardsOpened {
                            insightsSection(viewStore)
                        } else {
                            placeholderSection()
                        }
                    }
                    .padding(16)
                }
            }
            .task {
                store.send(.onAppear)
            }
            .background(LunalitAsset.Assets.backgroundBlack.swiftUIColor)
            .navigationTitle("Tarot Spread")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                LunalitAsset.Assets.backgroundVibrantDarkBlue.swiftUIColor,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    
    // MARK: - Insights Section
    
    @ViewBuilder
    private func insightsSection(_ viewStore: ViewStoreOf<Spread>) -> some View {
        VStack(spacing: 16) {
            // Section Header
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(.localizable(.spread_ai_tarot))
                        .font(.subheadline.bold())
                        .foregroundStyle(LunalitAsset.Assets.purpleLight1.swiftUIColor)
                    
                    Text(.localizable(.spread_more_answers))
                        .foregroundStyle(.white)
                        .font(.title3.weight(.heavy))
                }
                
                Spacer()
                
                Image(asset: LunalitAsset.Assets.Interests.genericIllustration)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .mask {
                        RadialGradient(
                            colors: [
                                .white,
                                .white.opacity(0)
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: 30
                        )
                    }
            }
            .padding(.horizontal, 16)
            
            // Insights Component
            InsightsView(
                store: store.scope(state: \.insights, action: \.insights),
                cards: viewStore.content.cards
            )
        }
    }
    
    // MARK: - Placeholder Section
    
    @ViewBuilder
    private func placeholderSection() -> some View {
        HStack {
            VStack {
                Text(.localizable(.spread_ai_tarot))
                    .font(.subheadline.bold())
                    .foregroundStyle(LunalitAsset.Assets.purpleLight1.swiftUIColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(.localizable(.spread_more_answers))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                    .font(.title3.weight(.heavy))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Open the cards to reveal insights")
                    .foregroundStyle(.white.opacity(0.7))
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 4)
            }
            
            Image(asset: LunalitAsset.Assets.Interests.genericIllustration)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .mask {
                    RadialGradient(
                        colors: [
                            .white,
                            .white.opacity(0)
                        ],
                        center: .center,
                        startRadius: 0,
                        endRadius: 90
                    )
                }
        }
        .padding(16)
    }
}

#Preview {
    SpreadView(
        store: .init(
            initialState: Spread.State(
                content: CardsSpread.State.threeMock,
                numberOfTries: 3
            ),
            reducer: {
                Spread()
            }
        )
    )
}
