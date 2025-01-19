//
//  GPTApiClient.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 07.12.2024.
//

import Foundation
import LLMChatOpenAI
import Dependencies

struct Prompt: Codable {
    let message: String
}

struct GPTApiClient {
    let getDailyCard: (OpenAIRequest<OpenAIDay.Card>) async throws -> OpenAIDay.Card?
}

extension GPTApiClient {
    static var liveValue: Self {
        let chat = LLMChatOpenAI(apiKey: "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")
        
        let decoder = JSONDecoder()
        
        return GPTApiClient { request in
            async let response = chat.send(
                models: ["gpt-4o-mini"],
                messages: request.messages,
                options: ChatOptions(responseFormat: .init(type: .jsonSchema, jsonSchema: request.schema))
            )
            
            return try await response
                .choices
                .first?
                .message
                .content?
                .data(using: .utf8)
                .flatMap { data in
                    try decoder.decode(OpenAIDay.Card.self, from: data)
                }
        }
    }
}


private enum GPTAPIClientKey: DependencyKey {
    static let liveValue = GPTApiClient.liveValue
}

extension DependencyValues {
    var gptAPIClient: GPTApiClient {
        get { self[GPTAPIClientKey.self] }
        set { self[GPTAPIClientKey.self] = newValue }
    }
}
