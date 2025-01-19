//
//  DailyCard.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 08.12.2024.
//

import Foundation
import ComposableArchitecture
import OpenAI

@Reducer
struct DailyCard {
    @ObservableState
    enum State: Equatable {
        struct Day: Equatable {
            struct Card: Equatable {
                let name: String
                let desciption: String
            }
            struct Advice: Equatable {
                let name: String
                let desciption: String
            }
            
            let date: Date
            let card: Card
            let advice: Advice?
        }
        
        case loading
        case loaded(Day)
    }
    
    enum Action {
        case load
        case loaded(OpenAIDay.Card)
        case error
    }

    @Dependency(\.gptAPIClient)
    var gptAPIClient
    //TODO: - MAP
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .load where state == .loading:
                return .run { send in
                    do {
                        let response = try await gptAPIClient.getDailyCard(.dailyCard)
                        if let response {
                            await send(.loaded(response))
                        } else {
                            await send(.error)
                        }
                    } catch {
                        await send(.error)
                    }
                    
                }
            case .load:
                return .none
            case .loaded(let response):
                state = .loaded(
                    .init(
                        date: Date(),
                        card: .init(
                            name: response.name,
                            desciption: response.description
                        ),
                        advice: nil
                    )
                )
                return .none
            case .error:
                return .none
            }
        }
    }
}
                                          
extension DailyCard {
    static let prompt = "Give me daily card for today"
}

extension OpenAIRequest where Response == OpenAIDay.Card {
    static let dailyCard = Self(
        messages: [
            .init(
                role: .system,
                content: [.text("You're a super tarot master which gives daily card with description")],
                name: "Tarot daily card"
            ),
            .init(
                role: .user,
                content: [.text("Give me a daily card with description, in Russian")],
                name: "Tarot daily card user"
            ),
        ]
    )
}
