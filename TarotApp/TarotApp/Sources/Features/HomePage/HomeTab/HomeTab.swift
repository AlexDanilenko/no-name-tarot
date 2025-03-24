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
        var dailyCard: DailyCard.State
    }
    
    enum Action {
        case dailyCard(DailyCard.Action)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
        Scope(state: \.dailyCard, action: \.dailyCard) {
            DailyCard()
        }
    }
}
