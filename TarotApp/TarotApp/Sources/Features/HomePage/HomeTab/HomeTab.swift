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
    @ObservableState
    struct State: Equatable {
        var dailyCard: DailyCard.State = .loading
    }
    
    enum Action {
        case dailyCard(DailyCard.Action)
        case threeCardSpreadTapped
        case fiveCardSpreadTapped
        case learnCardsTapped
    }
    
    var body: some ReducerOf<HomeTab> {
        Reduce { state, action in
            switch action {
            case .threeCardSpreadTapped, .fiveCardSpreadTapped, .learnCardsTapped:
                // These actions will be handled by the parent HomePage
                return .none
            case .dailyCard:
                return .none
            }
        }
        Scope(state: \.dailyCard, action: \.dailyCard) {
            DailyCard()
        }
    }
}
