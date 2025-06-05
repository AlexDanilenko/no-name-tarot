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
    let getDay: (OpenAIRequest<OpenAIDay>) async throws -> OpenAIDay?
    let getSpreadInsight: (OpenAIRequest<OpenAISpreadInsight>) async throws -> OpenAISpreadInsight?
}

extension GPTApiClient {
    static var liveValue: Self {
        @Dependency(\.environmentManager.openAIAPIKey) var apiKey

        let chat = LLMChatOpenAI(apiKey: apiKey)
        
        let decoder = JSONDecoder()
        
        return GPTApiClient(
            getDailyCard: { request in
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
            },
            getDay: { request in
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
                        try decoder.decode(OpenAIDay.self, from: data)
                    }
            },
            getSpreadInsight: { request in
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
                        try decoder.decode(OpenAISpreadInsight.self, from: data)
                    }

            })
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
