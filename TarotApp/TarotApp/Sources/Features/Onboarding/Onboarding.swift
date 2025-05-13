//
//  Onboarding.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 10.11.2024.
//

import ComposableArchitecture
import Foundation

@Reducer
struct Onboarding {
    @ObservableState
    struct State: Equatable {
        @Shared(.appStorage("isOnboardingPassed"))
        var isOnboardingPassed: Bool = false
        @Shared(.appStorage("notificationsEnabled"))
        var notificationsEnabled: Bool = false
    }
    
    @CasePathable
    enum Action {
        case finish
        case `continue`
        case notifications(result: Result<Bool, Error>)
    }
    
    @Dependency(\.notificationService)
    var notificationService: NotificationsService
    
    var body: some ReducerOf<Onboarding> {
        Reduce { state, action in
            switch action {
            case .continue where !state.notificationsEnabled:
                return .run { send in
                    await send(.notifications(result: notificationService.request()))
                }
            case .continue:
                state.$isOnboardingPassed.withLock({
                    $0 = true
                })
                return .send(.finish)
            case .notifications(let result):
                switch result {
                case .success(let isOn):
                    state.$notificationsEnabled.withLock({
                        $0 = isOn
                    })
                case .failure(let error):
                    state.$notificationsEnabled.withLock({
                        $0 = false
                    })
                }
                
                return .send(.finish)
            case .finish:
                return .none
            }
        }
    }
}
