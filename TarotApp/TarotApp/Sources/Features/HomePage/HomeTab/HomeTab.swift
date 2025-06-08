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
        var learnCardSelector: LearnCardSelector.State = LearnCardSelector.State()
    }
    
    enum Action {
        case dailyCard(DailyCard.Action)
        case learnCardSelector(LearnCardSelector.Action)
        case threeCardSpreadTapped
        case fiveCardSpreadTapped
        case learnCardsTapped // Keep for backward compatibility if needed
    }
    
    var body: some ReducerOf<HomeTab> {
        Reduce { state, action in
            switch action {
            case .threeCardSpreadTapped, .fiveCardSpreadTapped, .learnCardsTapped:
                // These actions will be handled by the parent HomePage
                return .none
            case .dailyCard, .learnCardSelector:
                return .none
            }
        }
        Scope(state: \.dailyCard, action: \.dailyCard) {
            DailyCard()
        }
        Scope(state: \.learnCardSelector, action: \.learnCardSelector) {
            LearnCardSelector()
        }
    }
}
