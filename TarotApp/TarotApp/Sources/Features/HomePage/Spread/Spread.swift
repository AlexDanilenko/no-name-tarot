//
//  Spread.swift
//  Lunalit
//
//  Created by Oleksandr Danylenko on 15.05.2025.
//

import ComposableArchitecture

@Reducer
struct Spread {
    @ObservableState
    struct State: Equatable {
        var content: CardsSpread.State
        var insights: Insights.State = Insights.State()
        
        @Shared(.appStorage("isSubscribed"))
        var isSubscribed: Bool = false
        
        var numberOfTries: Int
        
        /// Whether the cards are opened and insights can be accessed
        var areCardsOpened: Bool {
            content.isOpened
        }
        
        static func == (lhs: State, rhs: State) -> Bool {
            lhs.content == rhs.content &&
            lhs.insights == rhs.insights &&
            lhs.numberOfTries == rhs.numberOfTries &&
            lhs.isSubscribed == rhs.isSubscribed
        }
    }
    
    enum Action {
        /// View appeared.
        case onAppear
        case load
        case spread(CardsSpread.Action)
        case insights(Insights.Action)
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                switch state.content {
                case .three:
                    let cards = TarotCard.allCases.shuffled().prefix(3)
                    state.content = .three(
                        .init(
                            card1: .init(card: cards[cards.startIndex]),
                            card2: .init(card: cards[cards.index(cards.startIndex, offsetBy: 1)]),
                            card3: .init(card: cards[cards.index(cards.startIndex, offsetBy: 2)])
                        )
                    )
                case .five:
                    let cards = TarotCard.allCases.shuffled().prefix(5)
                    state.content = .five(
                        .init(
                            card1: .init(card: cards[cards.startIndex]),
                            card2: .init(card: cards[cards.index(cards.startIndex, offsetBy: 1)]),
                            card3: .init(card: cards[cards.index(cards.startIndex, offsetBy: 2)]),
                            card4: .init(card: cards[cards.index(cards.startIndex, offsetBy: 3)]),
                            card5: .init(card: cards[cards.index(cards.startIndex, offsetBy: 4)])
                        )
                    )
                }
                return .none

            case .spread, .load:
                return .none
                
            case .insights:
                return .none
            }
        }

        Scope(state: \.content, action: \.spread) {
            CardsSpread()
        }
        
        Scope(state: \.insights, action: \.insights) {
            Insights()
        }
    }
}
