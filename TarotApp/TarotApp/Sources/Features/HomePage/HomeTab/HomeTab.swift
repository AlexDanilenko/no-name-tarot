//
//  HomeTab.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 08.12.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct HomeTab {
    @Reducer(state: .equatable)
    enum Path {
        case spread(Spread)
    }
    
    @ObservableState
    struct State: Equatable {
        var dailyCard: DailyCard.State
        var path = StackState<Path.State>()
    }
    
    enum Action {
        case dailyCard(DailyCard.Action)
        case path(StackAction<Path, Path.Action>)
        case threeCardSpreadTapped
        case fiveCardSpreadTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .threeCardSpreadTapped:
                state.path.append(
                    .spread(
                        Spread.State(
                            content: .three(.init(
                                card1: .init(card: .major(.fool)),
                                card2: .init(card: .major(.fool)),
                                card3: .init(card: .major(.fool))
                            )),
                            insight: .love,
                            numberOfTries: 3
                        )
                    )
                )
                return .none
                
            case .fiveCardSpreadTapped:
                state.path.append(
                    .spread(
                        Spread.State(
                            content: .five(.init(
                                card1: .init(card: .major(.fool)),
                                card2: .init(card: .major(.fool)),
                                card3: .init(card: .major(.fool)),
                                card4: .init(card: .major(.fool)),
                                card5: .init(card: .major(.fool))
                            )),
                            insight: .love,
                            numberOfTries: 3
                        )
                    )
                )
                return .none
                
            case .path:
                return .none
                
            case .dailyCard:
                return .none
            }
        }
        .forEach(\.path, action: \.path) {
            Path()
        }
        Scope(state: \.dailyCard, action: \.dailyCard) {
            DailyCard()
        }
    }
}
