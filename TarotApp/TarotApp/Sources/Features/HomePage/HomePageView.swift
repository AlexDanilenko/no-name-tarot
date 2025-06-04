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
        TabView {
            HomeTabView(store: store.scope(state: \.homeTab, action: \.homeTab))
                .onAppear {
                    store.send(.homeTab(.dailyCard(.onAppear)))
                }
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                
            Color.blue
                .tabItem {
                    Label("Tarot", systemImage: "lanyardcard")
                }
        }
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarBackground(
            LunalitAsset.Assets.backgroundDarkBlue.swiftUIColor,
            for: .tabBar
        )
        .tint(LunalitAsset.Assets.Yellow.paywall1.swiftUIColor)
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
