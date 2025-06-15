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
        
        static var body: some ReducerOf<Self> {
            Scope(state: \.cardDetail, action: \.cardDetail) {
                LearnCardDetail()
            }
            Scope(state: \.fullCardList, action: \.fullCardList) {
                LearnCardsPage()
            }
        }
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
                
            case .destination(.presented(.cardDetail(.delegate(.dismiss)))):
                state.destination = nil
                return .none
                
            case .destination:
                return .none
            }
        }
        .ifLet(\.$paywall, action: \.paywall) {
            Paywall()
        }
        .ifLet(\.$destination, action: \.destination) {
            Destination.body
        }
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
        case backTapped
        case delegate(Delegate)
        
        @CasePathable
        enum Delegate {
            case dismiss
        }
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .backTapped:
                return .send(.delegate(.dismiss))
            case .delegate:
                return .none
            }
        }
    }
}

@Reducer
struct LearnCardsPage {
    @ObservableState
    struct State: Equatable {
        let cardGroups: [CardGroup] = [
            CardGroup(title: "Major Arcana", cards: TarotCard.Major.allCases.map(TarotCard.major)),
            CardGroup(title: "Cups", cards: TarotCard.Minor.allCases.map(TarotCard.cups)),
            CardGroup(title: "Swords", cards: TarotCard.Minor.allCases.map(TarotCard.swords)), 
            CardGroup(title: "Wands", cards: TarotCard.Minor.allCases.map(TarotCard.wands)),
            CardGroup(title: "Pentacles", cards: TarotCard.Minor.allCases.map(TarotCard.pentacles))
        ]
        
        @Shared(.appStorage("isSubscribed"))
        var isSubscribed: Bool = false
        
        @Presents var paywall: Paywall.State?
        @Presents var cardDetail: LearnCardDetail.State?
        
        struct CardGroup: Equatable, Identifiable {
            let id = UUID()
            let title: String
            let cards: [TarotCard]
            
            func unlockedCards() -> [TarotCard] {
                Array(cards.prefix(2))
            }
            
            func lockedCards() -> [TarotCard] {
                Array(cards.dropFirst(2))
            }
        }
    }
    
    @CasePathable
    enum Action {
        case cardTapped(TarotCard)
        case paywall(PresentationAction<Paywall.Action>)
        case cardDetail(PresentationAction<LearnCardDetail.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .cardTapped(let card):
                // Check if this card is locked (not in the first 2 of any group)
                let isCardUnlocked = state.cardGroups.contains { group in
                    group.unlockedCards().contains(card)
                }
                
                if !isCardUnlocked && !state.isSubscribed {
                    // Show paywall for locked cards
                    state.paywall = Paywall.State(
                        subscriptions: .init(
                            first: .weekly1,
                            second: .monthly1,
                            third: .lifetime1
                        )
                    )
                } else {
                    // Navigate to card detail for unlocked cards
                    state.cardDetail = LearnCardDetail.State(card: card)
                }
                return .none
                
            case .paywall:
                return .none
                
            case .cardDetail(.dismiss):
                state.cardDetail = nil
                return .none
                
            case .cardDetail:
                return .none
            }
        }
        .ifLet(\.$paywall, action: \.paywall) {
            Paywall()
        }
        .ifLet(\.$cardDetail, action: \.cardDetail) {
            LearnCardDetail()
        }
    }
} 
