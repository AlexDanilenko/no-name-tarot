//
//  Spread.swift
//  Lunalit
//
//  Created by Oleksandr Danylenko on 15.05.2025.
//

import ComposableArchitecture


@Reducer
struct Spread {
    @ObservableState
    struct State {
        enum Interest: CaseIterable {
            case love, money, career, finance, relations, situations, spiritual
        }
        
        struct Insight {
            let interest: Interest, description: String
        }
        
        var content: CardsSpread.State
        var insight: Interest
        
        @Shared(.appStorage("isSubscribed"))
        var isSubscribed: Bool = false
        
        var numberOfTries: Int
    }
    
    enum Action {
        case load
        case spread(CardsSpread.Action)
        case loadInsight(State.Interest)
        case loadedInsight(State.Insight)
        case retryInsight
    }
    
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            return .none
        }

        Scope(state: \.content, action: \.spread) {
            CardsSpread()
        }
    }
    
}
