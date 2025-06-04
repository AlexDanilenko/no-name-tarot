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
        case personalInfo(PersonalInfo)
        case paywall(Paywall)
        case spread(Spread)
    }
    
    @ObservableState
    struct State {
        @Shared(.appStorage("isOnboardingPassed"))
        var isOnboardingPassed: Bool = false
                
        @Shared(.fileStorage(.personalInfo))
        var personalInfo: PersonalInfo.State?
    
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
            case .path(.element(id: _, action: .onboarding(.finish))):
                showPersonalInfoOnboarding(&state)
                return .none
            case .path(.element(id: _, action: .personalInfo(.save(let info)))):
                state.$personalInfo.withLock {
                    $0 = info
                }
                showPaywall(&state)
                return .none
            case .path(.element(id: _, action: .paywall(.subscriptionFinished))):
                showHomePage(&state)
                return .none
                
            case .path(.element(id: _, action: .home(.homeTab(.threeCardSpreadTapped)))):
                state.path.append(
                    .spread(
                        Spread.State(
                            content: .three(.init(
                                card1: .init(card: .major(.theFool)),
                                card2: .init(card: .major(.theFool)),
                                card3: .init(card: .major(.theFool))
                            )),
                            numberOfTries: 0
                        )
                    )
                )
                return .none
                
            case .path(.element(id: _, action: .home(.homeTab(.fiveCardSpreadTapped)))):
                state.path.append(
                    .spread(
                        Spread.State(
                            content: .five(.init(
                                card1: .init(card: .major(.theFool)),
                                card2: .init(card: .major(.theFool)),
                                card3: .init(card: .major(.theFool)),
                                card4: .init(card: .major(.theFool)),
                                card5: .init(card: .major(.theFool))
                            )),
                            numberOfTries: 0
                        )
                    )
                )
                return .none
                
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: \.path)
        ._printChanges()
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
    
    func showPaywall(_ state: inout State) {
        state.path.append(
            .paywall(
                Paywall.State(
                    subscriptions: .init(
                        first: .weekly1,
                        second: .monthly1,
                        third: .yearly1
                    )
                )
            )
        )
    }
    
    func showPersonalInfoOnboarding(_ state: inout State) {
        state.path.append(
            .personalInfo(
                state.personalInfo ?? .init()
            )
        )
    }
}

extension URL {
  static var personalInfo: Self {
      .documentsDirectory.appending(component: "personal-info.json")
  }
}
