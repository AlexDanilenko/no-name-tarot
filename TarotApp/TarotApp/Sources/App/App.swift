//
//  AppState.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 10.11.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct AppRoot {
    
    @Reducer(state: .equatable)
    enum Path {
        case onboarding(Onboarding)
        case home(HomePage)
    }
    
    @ObservableState
    struct State {
//        @Shared(.appStorage("isOnboardingPassed"))
        var isOnboardingPassed: Bool = false
    
        var path = StackState<Path.State>()
    }
    
    enum Action {
        case loaded
        case path(StackActionOf<Path>)
    }
        
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .loaded where !state.isOnboardingPassed:
                state.path.append(.onboarding(Onboarding.State()))
                return .none
            case .loaded:
                showHomePage(&state)
                return .none
            case .path(.element(id: _, action: .onboarding(.skip))):
                showHomePage(&state)
                return .none
            case .path(.element(id: _, action: .onboarding(.finish))):
                showHomePage(&state)
                return .none
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
    
    func showHomePage(_ state: inout State) {
        state.path.append(
            .home(
                HomePage.State(
                    homeTab: .init(
                        dailyCard: .loading
                    )
                )
            )
        )
    }
}
