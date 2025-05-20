//
//  CardsSpreadView.swift
//  Lunalit
//
//  Created by Oleksandr Danylenko on 15.05.2025.
//

import SwiftUI
import ComposableArchitecture

struct CardsSpreadView: View {
    
    let store: StoreOf<CardsSpread>
    
    var body: some View {
        VStack(spacing: 16) {
            switch store.state {
            case .five:
                if let store = store.scope(state: \.five, action: \.five) {
                    VStack {
                        HStack {
                            CardView(store: store.scope(state: \.card1, action: \.card1))
                            CardView(store: store.scope(state: \.card3, action: \.card3))
                            CardView(store: store.scope(state: \.card5, action: \.card5))
                        }
                        
                        HStack {
                            Spacer()
                            CardView(store: store.scope(state: \.card2, action: \.card2))
                            CardView(store: store.scope(state: \.card4, action: \.card4))
                            Spacer()
                        }
                        .frame(maxHeight: 120)
                    }
                    .frame(maxHeight: 240)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    
                }
                
            case .three:
                if let store = store.scope(state: \.three, action: \.three) {
                    HStack {
                        CardView(store: store.scope(state: \.card1, action: \.card1)).padding(.top, 48)
                        CardView(store: store.scope(state: \.card2, action: \.card2)).padding(.bottom, 48)
                        CardView(store: store.scope(state: \.card3, action: \.card3)).padding(.top, 48)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    
                }
            }
            
            if store.state.isOpened {
                Button {
                    store.send(.retry)
                } label: {
                    Label {
                        Text(.localizable(.retry_spread_title))
                    } icon: {
                        Image(systemName: "arrow.trianglehead.counterclockwise")
                    }
                    .bold()
                }
                .foregroundStyle(.white)
                .padding(10)
                .background(.onboardingGradient)
                .clipShape(.capsule)
            } else {
                Text(.localizable(.spread_think_text))
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(
                        .onboardingGradient
                    )
                    .padding(.horizontal, 32)
            }
        }
    }
}

extension CardsSpread.State {
    static var threeMock: Self {
        .three(
            .init(
                card1: SpreadCard.State(
                    card: .major(.death),
                    isExposed: false
                ),
                card2: SpreadCard.State(
                    card: .wands(.ace),
                    isExposed: false
                ),
                card3: SpreadCard.State(
                    card: .swords(.four),
                    isExposed: false
                )
            )
        )
    }
    
    static var fiveMock: Self {
        .five(
            .init(
                card1: SpreadCard.State(
                    card: .major(.death),
                    isExposed: false
                ),
                card2: SpreadCard.State(
                    card: .wands(.ace),
                    isExposed: false
                ),
                card3: SpreadCard.State(
                    card: .swords(.four),
                    isExposed: false
                ),
                card4: SpreadCard.State(
                    card: .swords(.four),
                    isExposed: false
                ),
                card5: SpreadCard.State(
                    card: .swords(.four),
                    isExposed: false
                )
            )
        )
    }
    
}

#Preview {
    VStack {
        CardsSpreadView(
            store: .init(
                initialState: .threeMock,
                reducer: {
                    CardsSpread()
                }
            )
        )
        
        CardsSpreadView(
            store: .init(
                initialState: .fiveMock,
                reducer: {
                    CardsSpread()
                }
            )
        )
    }
    .background(LunalitAsset.Assets.backgroundBlack.swiftUIColor)
}
