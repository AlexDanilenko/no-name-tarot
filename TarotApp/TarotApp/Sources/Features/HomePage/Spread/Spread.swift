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
        struct Insight: Equatable {
            let interest: Interest
            let description: String
        }

        var content: CardsSpread.State
        var insight: Interest

        /// Currently selected interest for which we load insight.
        var selectedInterest: Interest?

        /// Loaded insight returned from GPT API.
        var loadedInsight: Insight?

        /// Indicates that insight is loading and should show progress.
        var isLoadingInsight: Bool = false
        
        @Shared(.appStorage("isSubscribed"))
        var isSubscribed: Bool = false
        
        var numberOfTries: Int
        
        static func == (lhs: State, rhs: State) -> Bool {
            lhs.content == rhs.content &&
            lhs.insight == rhs.insight &&
            lhs.selectedInterest == rhs.selectedInterest &&
            lhs.loadedInsight == rhs.loadedInsight &&
            lhs.isLoadingInsight == rhs.isLoadingInsight &&
            lhs.numberOfTries == rhs.numberOfTries &&
            lhs.isSubscribed == rhs.isSubscribed
        }
    }
    
    enum Action {
        /// View appeared.
        case onAppear
        case load
        case spread(CardsSpread.Action)
        case selectInterest(Interest)
        case loadInsight(Interest)
        case loadedInsight(State.Insight)
        case retryInsight
    }


    @Dependency(\.gptAPIClient) var gptAPIClient

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

            case .selectInterest(let interest):
                state.selectedInterest = interest
                state.isLoadingInsight = true
                return .send(.loadInsight(interest))

            case .loadInsight(let interest):
                let cards = state.content.cards
                return .run { [cards] send in
                    if let result = try await gptAPIClient.getSpreadInsight(
                        .insight(for: interest, cards: cards)
                    ) {
                        await send(
                            .loadedInsight(
                                .init(interest: interest, description: result.description)
                            )
                        )
                    } else {
                        await send(
                            .loadedInsight(
                                .init(interest: interest, description: "")
                            )
                        )
                    }
                }

            case .loadedInsight(let insight):
                state.loadedInsight = insight
                state.isLoadingInsight = false
                return .none

            case .retryInsight:
                state.selectedInterest = nil
                state.loadedInsight = nil
                state.isLoadingInsight = false
                return .none

            case .spread, .load:
                return .none
            }
        }

        Scope(state: \.content, action: \.spread) {
            CardsSpread()
        }
    }
    
}
