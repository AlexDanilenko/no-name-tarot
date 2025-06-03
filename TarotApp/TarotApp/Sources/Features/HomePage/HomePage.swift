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
            case let .homeTab(action):
                // Handle homeTab actions that might trigger navigation
                switch action {
                case .threeCardSpreadTapped:
                    state.path.append(
                        .spread(
                            Spread.State(
                                content: .three(.init(
                                    card1: .init(card: .major(.theFool)),
                                    card2: .init(card: .major(.theFool)),
                                    card3: .init(card: .major(.theFool))
                                )),
                                insight: .love,
                                numberOfTries: 0
                            )
                        )
                    )
                    return .none
                case .fiveCardSpreadTapped:
                    state.path.append(
                        .spread(
                            Spread.State(
                                content: .five(.init(
                                    card1: .init(card: .major(.theFool)),
                                    card2: .init(card: .major(.theFool)),
                                    card3: .init(card: .major(.theFool)),
                                    card4: .init(card: .major(.theFool)),
                                    card5: .init(card: .major(.theFool))
                                )),
                                insight: .love,
                                numberOfTries: 0
                            )
                        )
                    )
                    return .none
                case .learnCardsTapped:
                    return .none
                default:
                    return .none
                }
            case .path:
                return .none
            }
        }
        Scope(state: \.homeTab, action: \.homeTab) {
            HomeTab()
        }
    }
}
