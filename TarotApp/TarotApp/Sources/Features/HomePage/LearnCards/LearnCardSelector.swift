//
//  LearnCardSelector.swift
//  Lunalit
//
//  Created by Assistant on 2025.
//

import Foundation
import ComposableArchitecture

@Reducer
struct LearnCardSelector {
    @ObservableState
    struct State: Equatable {
        let availableCards: [TarotCard] = TarotCard.Major.allCases.prefix(2).map(TarotCard.major) // First 2 cards free
        let lockedCards: [TarotCard] = TarotCard.Major.allCases.dropFirst(2).prefix(4).map(TarotCard.major) // Next 4 cards locked
        
        @Shared(.appStorage("isSubscribed"))
        var isSubscribed: Bool = false
        
        @Presents var paywall: Paywall.State?
        @Presents var destination: Destination.State?
    }
    
    @CasePathable
    enum Action {
        case cardTapped(TarotCard)
        case viewAllCardsTapped
        case paywall(PresentationAction<Paywall.Action>)
        case destination(PresentationAction<Destination.Action>)
    }
    
    @Reducer(state: .equatable)
    enum Destination {
        case cardDetail(LearnCardDetail)
        case fullCardList(LearnCardsPage)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .cardTapped(let card):
                // Check if card is available or needs subscription
                let isCardLocked = state.lockedCards.contains(card)
                
                if isCardLocked && !state.isSubscribed {
                    // Show paywall for locked cards
                    state.paywall = Paywall.State(
                        subscriptions: .init(
                            first: .weekly1,
                            second: .monthly1,
                            third: .lifetime1
                        )
                    )
                } else {
                    // Navigate to card detail for available cards
                    state.destination = .cardDetail(
                        LearnCardDetail.State(card: card)
                    )
                }
                return .none
                
            case .viewAllCardsTapped:
                state.destination = .fullCardList(
                    LearnCardsPage.State()
                )
                return .none
                
            case .paywall:
                return .none
                
            case .destination:
                return .none
            }
        }
        .ifLet(\.$paywall, action: \.paywall) {
            Paywall()
        }
        .ifLet(\.$destination, action: \.destination)
    }
}

// MARK: - Placeholder Reducers (will be implemented in later phases)

@Reducer
struct LearnCardDetail {
    @ObservableState
    struct State: Equatable {
        let card: TarotCard
    }
    
    @CasePathable
    enum Action {
        case placeholder
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
}

@Reducer
struct LearnCardsPage {
    @ObservableState
    struct State: Equatable {
        // Will be implemented in Phase 2
    }
    
    @CasePathable
    enum Action {
        case placeholder
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
} 
