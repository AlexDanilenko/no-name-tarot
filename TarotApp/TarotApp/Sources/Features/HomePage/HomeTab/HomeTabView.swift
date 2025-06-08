//
//  HomeTabView.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 08.12.2024.
//

import SwiftUI
import ComposableArchitecture

struct HomeTabView: View {
    @Bindable var store: StoreOf<HomeTab>
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                DailyCardView(store: store.scope(state: \.dailyCard, action: \.dailyCard))
                    .padding()
                
                VStack(spacing: 16) {
                    HStack {
                        Button("Three Card Spread") {
                            store.send(.threeCardSpreadTapped)
                        }
                        .buttonStyle(SpreadButtonStyle(numberOfCards: 3))
                        .frame(maxWidth: .infinity)
                        
                        Button("Five Card Spread") {
                            store.send(.fiveCardSpreadTapped)
                        }
                        .buttonStyle(SpreadButtonStyle(numberOfCards: 5))
                        .frame(maxWidth: .infinity)
                    }
                    .frame(height: 80)
                    
                    Button("Learn Cards") {
                        store.send(.learnCardsTapped)
                    }
                    .buttonStyle(SpreadButtonStyle(numberOfCards: 9))
                }
                .padding()
            }
        }
        .background(
            LinearGradient(
                colors: [
                    LunalitAsset.Assets.backgroundBlack.swiftUIColor,
                    LunalitAsset.Assets.backgroundBlack.swiftUIColor,
                    LunalitAsset.Assets.backgroundDarkBlue.swiftUIColor,
                    LunalitAsset.Assets.backgroundLightBlue.swiftUIColor,
                ],
                startPoint: UnitPoint(x: 0, y: 0),
                endPoint: UnitPoint(x: 1, y: 1)
            )
        )
    }
}

#Preview {
    HomeTabView(
        store: .init(
            initialState: HomeTab.State(
                dailyCard: .loaded(
                    .init(
                        date: Date(),
                        card: .major(.justice),
                        desciption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        adviceTitle: "Title",
                        advice: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                    )
                )
            ),
            reducer: {
                HomeTab()
            }
        )
    )
    .background(LunalitAsset.Assets.backgroundBlack.swiftUIColor)
}
