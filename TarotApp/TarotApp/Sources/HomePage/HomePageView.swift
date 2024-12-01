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
                Color.red
                    .tabItem {
                        Label {
                            Text("Calendar")
                        } icon: {
                            Image(systemName: "calendar")
                        }
                    }
                    .tint(Color("purple_light_1"))
                    .ignoresSafeArea(.container)
                    

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
                Color("purple_dark_1"),
                for: .tabBar
            )
            .toolbarColorScheme(.dark, for: .tabBar)
        }
        
    }
}

#Preview {
    HomePageView(
        store: .init(
            initialState: HomePage.State(),
            reducer: HomePage.init
        )
    )
}
