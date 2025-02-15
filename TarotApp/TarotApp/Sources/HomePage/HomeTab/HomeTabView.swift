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
            VStack(spacing: 0) {
                Text("Card of the day:" )
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 16)
                
                DailyCardView(
                    store: store.scope(
                        state: \.dailyCard,
                        action: \.dailyCard
                    )
                )
                .task({
                    store.send(.dailyCard(.onAppear))
                })
                
                Spacer()
            }
            .padding(16)
        }
        .background(
            Color.init(hex: 0x221c33)
        )
        .tabItem {
            Label {
                Text("Calendar")
            } icon: {
                Image(systemName: "calendar")
            }
        }
        .tint(Color("purple_light_1"))
    }
}

#Preview {
    HomeTabView(
        store: .init(
            initialState: HomeTab.State(dailyCard: .loading),
            reducer: {
                HomeTab()
            }
        )
    )
}
