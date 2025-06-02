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
        VStack(spacing: 0) {
            DailyCardView(store: store.scope(state: \.dailyCard, action: \.dailyCard))
            
            VStack(spacing: 16) {
                Button("Three Card Spread") {
                    store.send(.threeCardSpreadTapped)
                }
                .buttonStyle(SpreadButtonStyle(numberOfCards: 3))
                
                Button("Five Card Spread") {
                    store.send(.fiveCardSpreadTapped)
                }
                .buttonStyle(SpreadButtonStyle(numberOfCards: 5))
                
                Button("Learn Cards") {
                    store.send(.learnCardsTapped)
                }
                .buttonStyle(SpreadButtonStyle(numberOfCards: 1))
            }
            .padding()
        }
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
}
