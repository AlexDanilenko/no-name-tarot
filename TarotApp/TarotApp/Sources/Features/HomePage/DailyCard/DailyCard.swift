//
//  DailyCard.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 08.12.2024.
//

import Foundation
import ComposableArchitecture
import LLMChatOpenAI

@Reducer
struct DailyCard {
    @ObservableState
    enum State: Equatable {
        struct Day: Equatable {
            let date: Date
            let card: TarotCard
            let desciption: String
            let adviceTitle: String
            let advice: String
        }
        
        case loading
        case loaded(Day)
        case error(String)
    }
    
    enum Action {
        case onAppear
        case load
        case loaded(OpenAIDay)
        case loadedFromStorage(State.Day)
        case error(StorageError)
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
                state = .loading
                return .run { send in
                    do {
                        // Try to get today's card from storage
                        if let storedDay = try await dayStorage.fetchOne(),
                           storedDay.date.isFromToday {
                            await send(.loadedFromStorage(
                                .init(
                                    date: storedDay.date,
                                    card: storedDay.card,
                                    desciption: storedDay.advice,
                                    adviceTitle: "Today's Advice",
                                    advice: storedDay.advice
                                )
                            ))
                        } else {
                            // No card for today, request new one
                            await send(.load)
                        }
                    } catch {
                        await send(.error(.failedToFetch(error)))
                    }
                }
            case .load where state == .loading:
                return .run { send in
                    switch await loadDay() {
                    case .success(let day):
                        await send(.loaded(day))
                    case .failure(let error):
                        await send(.error(.failedToFetch(error)))
                    case .none:
                        await send(.error(.itemNotFound))
                    }
                }
            case .load:
                return .none
            case .loaded(let response):
                let day = State.Day(
                    date: Date(),
                    card: response.card.card,
                    desciption: response.card.description,
                    adviceTitle: response.advice.title,
                    advice: response.advice.description
                )
                state = .loaded(day)
                
                // Store the card
                return .run { _ in
                    do {
                        try await dayStorage.store(
                            Day(
                                id: UUID(),
                                date: .now,
                                card: response.card.card,
                                advice: response.advice.description
                            )
                        )
                    } catch {
                        // We don't update the UI state here as the card is already loaded
                        // Just log the error for debugging
                        print("Failed to store card: \(error)")
                    }
                }
            case .loadedFromStorage(let day):
                state = .loaded(day)
                return .none
            case .error(let error):
                state = .error(error.localizedDescription)
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
    
    func loadDay() async -> Result<OpenAIDay, Error>? {
        do {
            return try await gptAPIClient
                .getDay(.day)
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

extension OpenAIRequest where Response == OpenAIDay {
    static let day = Self(
        messages: [
            .init(
                role: .system,
                content: [.text("You're a tarot cards master. You know everything about tarot. but you're a friendly, wise and funny.")],
                name: "Tarot daily card"
            ),
            .init(
                role: .user,
                content: [.text("Give me a daily card with explanation what it will mean for me today. Also please give me a friendly advice how to behave on this day with some affirmations based on daily tarot card.")],
                name: "Tarot daily card user"
            ),
        ]
    )
}
