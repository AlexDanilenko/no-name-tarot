//
//  HomePage.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 30.11.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct HomePage {
    @ObservableState
    struct State: Equatable {
        var homeTab: HomeTab.State = HomeTab.State(dailyCard: .loading)
        var path = StackState<Path.State>()
    }
    
    @Reducer(state: .equatable)
    enum Path {
        case spread(Spread)
    }
    
    enum Action {
        case homeTab(HomeTab.Action)
        case path(StackAction<Path.State, Path.Action>)
    }
    
    var body: some ReducerOf<HomePage> {
        Reduce { state, action in
            switch action {
            case .homeTab:
                // All navigation is now handled by AppRoot
                return .none
            case .path:
                return .none
            }
        }
        Scope(state: \.homeTab, action: \.homeTab) {
            HomeTab()
        }
    }
}
