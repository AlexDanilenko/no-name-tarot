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
                VStack(spacing: 32) {
                    CardsSpreadView(
                        store: store.scope(state: \.content, action: \.spread)
                    )
                    .padding(.vertical, 32)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(LunalitAsset.Assets.backgroundLightBlue.swiftUIColor, lineWidth: 1)
                    })
                    
                    if store.content.isOpened {
                        if store.loadedInsight != nil || store.isLoadingInsight {
                            InsightView(store: store)
                                .transition(.move(edge: .top).combined(with: .opacity))
                        } else {
                            InterestsListView(store: store)
                                .transition(.move(edge: .bottom).combined(with: .opacity))
                        }
                    } else {
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
                        .transition(.opacity)
                    }
                }
                .padding(16)
                .animation(.spring(), value: store.content.isOpened)
                .animation(.spring(), value: store.loadedInsight)
                .animation(.spring(), value: store.isLoadingInsight)
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
        
}

#Preview {
    SpreadView(
        store: .init(
            initialState: Spread.State(
                content: .threeMock,
                insight: .finance,
                numberOfTries: 3
            ),
            reducer: {
                Spread()
            }
        )
    )
}
