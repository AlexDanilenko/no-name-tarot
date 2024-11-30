//
//  Onboarding.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 10.11.2024.
//

import ComposableArchitecture

@Reducer
struct Onboarding {
    @ObservableState
    struct State { }
    
    @CasePathable
    enum Action {
        case skip, finish
    }
    
    var body: some ReducerOf<Onboarding> {
        Reduce { _, _ in
            .none
        }
    }
}
