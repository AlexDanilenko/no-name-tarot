//
//  HomePageView.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 30.11.2024.
//

import SwiftUI
import ComposableArchitecture

struct HomePageView: View {
    
    @Bindable var store: StoreOf<HomePage>
    
    var body: some View {
        HomeTabView(
            store: store.scope(
                state: \.homeTab,
                action: \.homeTab
            )
        )
        .onAppear {
            store.send(.homeTab(.dailyCard(.onAppear)))
        }
    }
}

#Preview {
    HomePageView(
        store: .init(
            initialState: HomePage.State(
                homeTab: .init(
                    dailyCard: .loading
                )
            ),
            reducer: HomePage.init
        )
    )
}
