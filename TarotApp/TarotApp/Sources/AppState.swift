//
//  AppState.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 10.11.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct AppState {
    
    @ObservableState
    struct State {
        @Shared(.appStorage("isOnboardingPassed"))
        var isOnboardingPassed: Bool = false
        
        @Presents 
        var onboarding: Onboarding.State?
    }
    
    @CasePathable
    enum Action {
        case loaded
        case onboarding(PresentationAction<Onboarding.Action>)
    }
        
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .loaded:
                if !state.isOnboardingPassed {
                    state.onboarding = Onboarding.State()
                }
                return .none
            case .onboarding(.presented(.finish)), .onboarding(.presented(.skip)):
                state.isOnboardingPassed = true
                return .none
            case .onboarding:
                return .none
            }
            
        }
        .ifLet(\.$onboarding, action: \.onboarding) {
            Onboarding()
        }
    }
}
