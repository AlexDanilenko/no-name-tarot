//
//  CardsSpread.swift
//  Lunalit
//
//  Created by Oleksandr Danylenko on 15.05.2025.
//

import ComposableArchitecture

@Reducer
struct CardsSpread {
    @ObservableState
    enum State: Equatable {
        case three(ThreeCardsSpread.State)
        case five(FiveCardsSpread.State)

        var isOpened: Bool {
            switch self {
            case .three(let state):
                return state.isOpened
            case .five(let state):
                return state.isOpened
            }
        }

        /// Flattened list of cards contained in the spread.
        var cards: [TarotCard] {
            switch self {
            case .three(let state):
                return [state.card1.card, state.card2.card, state.card3.card]
            case .five(let state):
                return [
                    state.card1.card,
                    state.card2.card,
                    state.card3.card,
                    state.card4.card,
                    state.card5.card
                ]
            }
        }
    }
    
    @CasePathable
    enum Action {
        case retry
        case three(ThreeCardsSpread.Action)
        case five(FiveCardsSpread.Action)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .retry:
                switch state {
                case .three:
                    let cards = TarotCard.allCases.shuffled().prefix(3)
                    state = .three(.init(
                        card1: .init(card: cards[0]),
                        card2: .init(card: cards[1]),
                        card3: .init(card: cards[2])
                    ))
                case .five:
                    let cards = TarotCard.allCases.shuffled().prefix(5)
                    state = .five(.init(
                        card1: .init(card: cards[0]),
                        card2: .init(card: cards[1]),
                        card3: .init(card: cards[2]),
                        card4: .init(card: cards[3]),
                        card5: .init(card: cards[4])
                    ))
                }
                return .none
            default: return .none
            }

        }
        .ifCaseLet(\.three, action: \.three) {
            ThreeCardsSpread()
        }
        .ifCaseLet(\.five, action: \.five) {
            FiveCardsSpread()
        }
        
    }
}

@Reducer
struct ThreeCardsSpread {
    @ObservableState
    struct State: Equatable {
        var card1: SpreadCard.State
        var card2: SpreadCard.State
        var card3: SpreadCard.State
        
        var isOpened: Bool {
            [card1, card2, card3].map(\.isExposed).allSatisfy(\.self)
        }
    }
    
    enum Action {
        case card1(SpreadCard.Action)
        case card2(SpreadCard.Action)
        case card3(SpreadCard.Action)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            return .none
        }
        
        Scope(state: \.card1, action: \.card1) {
            SpreadCard()
        }
        Scope(state: \.card2, action: \.card2) {
            SpreadCard()
        }
        Scope(state: \.card3, action: \.card3) {
            SpreadCard()
        }
    }
}

@Reducer
struct FiveCardsSpread {
    @ObservableState
    struct State: Equatable {
        var card1: SpreadCard.State
        var card2: SpreadCard.State
        var card3: SpreadCard.State
        var card4: SpreadCard.State
        var card5: SpreadCard.State
        
        var isOpened: Bool {
            [card1, card2, card3, card4, card5].map(\.isExposed).allSatisfy(\.self)
        }
    }
    
    @CasePathable
    enum Action {
        case card1(SpreadCard.Action)
        case card2(SpreadCard.Action)
        case card3(SpreadCard.Action)
        case card4(SpreadCard.Action)
        case card5(SpreadCard.Action)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            return .none
        }
        
        Scope(state: \.card1, action: \.card1) {
            SpreadCard()
        }
        Scope(state: \.card2, action: \.card2) {
            SpreadCard()
        }
        Scope(state: \.card3, action: \.card3) {
            SpreadCard()
        }
        Scope(state: \.card4, action: \.card4) {
            SpreadCard()
        }
        Scope(state: \.card5, action: \.card5) {
            SpreadCard()
        }
    }
}
