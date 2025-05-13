//
//  HomeTabView.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 08.12.2024.
//

import SwiftUI
import ComposableArchitecture

struct HomeTabView: View {
    var store: StoreOf<HomeTab>
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text(.localizable(.today))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                DailyCardView(
                    store: store.scope(
                        state: \.dailyCard,
                        action: \.dailyCard
                    )
                )
                .task({
                    store.send(.dailyCard(.onAppear))
                })
                
                HStack {
                    Button {
                        
                    } label: {
                        Text(.localizable(.three_card_spread))
                    }
                    .buttonStyle(SpreadButtonStyle(numberOfCards: 3))
                    
                    Button {
                        
                    } label: {
                        Text(.localizable(.five_cards_spread))
                    }
                    .buttonStyle(SpreadButtonStyle(numberOfCards: 5))
                }
                .frame(height: 80)
                
                LearnCardsView()
                
                Spacer()
            }
            .padding(16)
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
        .tabItem {
            Label {
                Text("Daily")
            } icon: {
                Image(asset: LunalitAsset.Assets.Icons.tabBarCard)
                    .tint(.white)
            }
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
                        advice: ""
                    )
                )
            ),
            reducer: {
                HomeTab()
            }
        )
    )
}
