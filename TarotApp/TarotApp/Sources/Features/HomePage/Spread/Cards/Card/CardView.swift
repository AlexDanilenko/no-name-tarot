//
//  CardView.swift
//  Lunalit
//
//  Created by Oleksandr Danylenko on 17.05.2025.
//

import SwiftUI
import ComposableArchitecture

struct CardView: View {
    
    var store: StoreOf<SpreadCard>

    var body: some View {
        WithViewStore(
            store,
            observe: \.self
        ) { viewStore in
            Image(asset: viewStore.card.asset)
                .resizable()
                .scaledToFit()
                .overlay(content: {
                    EmptyView()
                        .background(.ultraThinMaterial)
                        .mask {
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color.white.opacity(0), location: 0),
                                    Gradient.Stop(color: Color.white.opacity(0), location: 0.65),
                                    Gradient.Stop(color: Color.white, location: 0.85),
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        }
                })
                .overlay {
                    Text(.localizable(viewStore.card.localizationKey))
                        .font(.caption2.bold())
                        .foregroundStyle(.white)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .padding(8)
                }
                .overlay {
                    if !viewStore.isExposed {
                        Image(asset: LunalitAsset.Assets.Cards.cardBackSide)
                            .resizable()
                            .scaledToFit()
                            .transition(.blurReplace)
                            .onTapGesture {
                                viewStore.send(.cardTapped, animation: .default)
                            }
                    }
                }
                .clipShape(.rect(cornerRadius: 15))
        }
        
    }
}
