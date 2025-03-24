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
//        @Shared(.appStorage("notificationsEnabled"))
        var notificationsEnabled: Bool = false
//        @Shared(.appStorage("personalInfo"))
        var personalInfo: PersonalInfo.State
    }
    
    @CasePathable
    enum Action {
        case finish
        case notifications(result: Result<Bool, Error>)
        case showInterests
        case showHomePage
        
    }
    
    @Dependency(\.notificationService)
    var notificationService: NotificationsService
    
    var body: some ReducerOf<Onboarding> {
        Reduce { state, action in
            switch action {
            case .finish where !state.notificationsEnabled:
                return .run { send in
                    await send(.notifications(result: notificationService.request()))
                }
            case .finish:
                return .send(.showHomePage)
            case .notifications(let result):
                switch result {
                case .success(let isOn):
                    state.notificationsEnabled = isOn
                case .failure(let error):
                    state.notificationsEnabled = false
                }
                
                return .send(.showHomePage)
            case .showHomePage:
                state.isOnboardingPassed = true
                return .none
            }
        }
    }
}
