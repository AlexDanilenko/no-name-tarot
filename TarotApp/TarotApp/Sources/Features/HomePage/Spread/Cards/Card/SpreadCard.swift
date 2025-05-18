//
//  SpreadCard.swift
//  Lunalit
//
//  Created by Oleksandr Danylenko on 17.05.2025.
//

import ComposableArchitecture

@Reducer
struct SpreadCard {
    @ObservableState
    struct State: Equatable {
        let card: TarotCard
        var isExposed: Bool = false
    }
    
    @CasePathable
    enum Action {
        case cardTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            if action == .cardTapped, !state.isExposed {
                state.isExposed = true
            }
            
            return .none
        }
    }
}
