//
//  LearnCardsView.swift
//  Lunalit
//
//  Created by Oleksandr Danylenko on 13.05.2025.
//

import SwiftUI
import ComposableArchitecture

struct LearnCardsView: View {
    
    var cards = TarotCard.allCases.prefix(8)
    
    var body: some View {
        VStack {
            Text(.localizable(.learn_cards_title))
                .font(.title2.weight(.semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.white)
            
            Grid {
                GridRow {
                    ForEach(cards.prefix(3), id: \.id) { card in
                        Image(asset: card.asset)
                            .resizable()
                            .scaledToFit()
                            .clipShape(
                                RoundedRectangle(cornerRadius: 12)
                            )
                    }
                }
                
                GridRow {
                    ForEach(cards.reversed().prefix(3), id: \.id) { card in
                        Image(asset: card.asset)
                            .resizable()
                            .scaledToFit()
                            .clipShape(
                                RoundedRectangle(cornerRadius: 12)
                            )
                    }
                }
            }
            .padding(.bottom, 8)
        }
        .overlay(
            VStack {
                Spacer()
                
                            NavigationLink(destination: {
                LearnCardSelectorView(
                    store: Store(
                        initialState: LearnCardSelector.State(),
                        reducer: { LearnCardSelector() }
                    )
                )
            }) {
                Text(.localizable(.look_all_cards_button_title))
            }
            .buttonStyle(.onboardingButton)
            }
        )
        .padding()
        .background(
            LinearGradient(
                colors: [
                    LunalitAsset.Assets.purpleLight1.swiftUIColor,
                    LunalitAsset.Assets.purpleDark1.swiftUIColor,
                ],
                startPoint: UnitPoint(x: 0.13, y: 0),
                endPoint: UnitPoint(x: 0.87, y: 1)
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    LearnCardsView()
        .padding()
}
