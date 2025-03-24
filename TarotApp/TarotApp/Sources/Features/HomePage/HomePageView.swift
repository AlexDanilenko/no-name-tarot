//
//  HomePageView.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 30.11.2024.
//

import SwiftUI
import ComposableArchitecture

struct HomePageView: View {
    
    let store: StoreOf<HomePage>
    
    var body: some View {
        TabView {
            Group {
                HomeTabView(store: store.scope(state: \.homeTab, action: \.homeTab))
                    
                Color.blue
                    .tabItem {
                        Label {
                            Text("Taro")
                        } icon: {
                            Image(systemName: "lanyardcard")
                        }
                    }
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(
                .ultraThickMaterial,
                for: .tabBar
            )
            .toolbarColorScheme(.dark, for: .tabBar)
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
