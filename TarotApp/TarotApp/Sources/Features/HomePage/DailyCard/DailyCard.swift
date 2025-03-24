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
            let date: Date
            let card: TarotCard
            let desciption: String
            let advice: String
        }
        
        case loading
        case loaded(Day)
    }
    
    enum Action {
        case onAppear
        case load
        case loaded(OpenAIDay.Card)
        case error
    }

    @Dependency(\.gptAPIClient)
    var gptAPIClient
    
    @Dependency(\.dailyCardStorage)
    var dayStorage: PersistentStorage<Day>
    
    
    //TODO: - MAP
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { send in
                    let days = try? await dayStorage.fetch()
                    
                    if let day = days?.first {
                        await send(
                            .loaded(
                                OpenAIDay.Card(
                                    description: day.advice,
                                    card: day.card
                                )
                            )
                        )
                    } else {
                        await send(.load)
                    }
                }
            case .load where state == .loading:
                return .run { send in
                    switch await loadCard() {
                    case .success(let card):
                        await send(.loaded(card))
                    case .failure(let error):
                        await send(.error)
                    case .none:
                        await send(.error)
                    }
                }
            case .load:
                return .none
            case .loaded(let response):
                state = .loaded(
                    .init(
                        date: Date(),
                        card: response.card,
                        desciption: response.description,
                        advice: "nil"
                    )
                )
                return .run { send in
                    _ = try await dayStorage.store(
                        .init(
                            id: UUID(),
                            date: .now,
                            card: response.card,
                            advice: response.description
                        )
                    )
                }
            case .error:
                return .none
            }
        }
    }
    
    
    func loadCard() async -> Result<OpenAIDay.Card, Error>? {
        do {
            return try await gptAPIClient
                .getDailyCard(.dailyCard)
                .map(Result.success)
        } catch {
            return .failure(error)
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
