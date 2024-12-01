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
    struct State: Equatable {
//        @Shared(.appStorage("isOnboardingPassed"))
        var isOnboardingPassed: Bool = false
    }
    
    @CasePathable
    enum Action {
        case skip, finish
    }
    
    var body: some ReducerOf<Onboarding> {
        Reduce { state, action in
            switch action {
            case .finish, .skip:
                state.isOnboardingPassed = true
                return .none
            }
        }
    }
}
