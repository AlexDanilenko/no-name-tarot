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
        var homeTab: HomeTab.State
        var path = StackState<Path.State>()
    }
    
    enum Action {
        case homeTab(HomeTab.Action)
        case path(StackAction<Path, Path.Action>)
    }
    
    var body: some ReducerOf<HomePage> {
        Reduce { state, action in
            switch action {
            case let .homeTab(.path(action)):
                switch action {
                case let .element(id: _, action: .spread(action)):
                    state.path.append(.spread(action))
                    return .none
                default:
                    return .none
                }
            case .path, .homeTab:
                return .none
            }
        }
        .forEach(\.path, action: \.path) {
            Path()
        }
        Scope(state: \.homeTab, action: \.homeTab) {
            HomeTab()
        }
    }
}

@Reducer(state: .equatable)
enum Path {
    case spread(Spread)
}
