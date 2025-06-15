//
//  OpenAIRequest.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 21.12.2024.
//

import Foundation
import LLMChatOpenAI

protocol OpenAIResponseSchema: Decodable {
    static var schema: LLMChatOpenAI.Options.ResponseFormat.Schema { get }
}

struct OpenAIRequest<Response: OpenAIResponseSchema> {
    let messages: [ChatMessage]
    let schema = Response.schema
}
