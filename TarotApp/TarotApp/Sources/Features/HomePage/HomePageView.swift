//
//  HomePageView.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 30.11.2024.
//

import SwiftUI
import ComposableArchitecture
import SwiftUINavigation

struct HomePageView: View {
    
    @Bindable var store: StoreOf<HomePage>
    
    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            TabView {
                Group {
                    HomeTabView(store: store.scope(state: \.homeTab, action: \.homeTab))
                        
                    Color.blue
                        .tabItem {
                            Label {
                                Text("tarot_tab")
                            } icon: {
                                Image(systemName: "lanyardcard")
                            }
                        }
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(
                    LunalitAsset.Assets.backgroundDarkBlue.swiftUIColor,
                    for: .tabBar
                )
            }
            .tint(LunalitAsset.Assets.Yellow.paywall1.swiftUIColor)
        } destination: { store in
            switch store.case {
            case let .spread(store):
                SpreadView(store: store)
            }
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
