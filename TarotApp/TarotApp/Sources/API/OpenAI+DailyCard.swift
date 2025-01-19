//
//  OpenAI+DailyCard.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 21.12.2024.
//

import Foundation
import LLMChatOpenAI

struct OpenAIDay: OpenAIResponseSchema {
    struct Card: OpenAIResponseSchema {
        let name: String
        let description: String
        
        static let schema: LLMChatOpenAI.Options.ResponseFormat.Schema = .init(
            name: "advice",
            description: "Daily tarot card advice with title and description",
            schema: .object(
                description: "Container for daily tarot card advice",
                properties: [
                    CodingKeys.name.stringValue : .string(
                        description: "Daily tarot card name"
                    ),
                    CodingKeys.description.stringValue : .string(
                        description: "Daily tarot card description and meaning"
                    ),
                ],
                required: [
                    CodingKeys.name.stringValue,
                    CodingKeys.description.stringValue
                ],
                additionalProperties: .boolean(false)
            ),
            strict: true
            
        )
    }
    struct Advice: OpenAIResponseSchema {
        let title: String
        let description: String
        
        static let schema: LLMChatOpenAI.Options.ResponseFormat.Schema = .init(
            name: "Tarot daily card advice",
            description: "Daily tarot card advice with title and description",
            schema: .object(
                description: "Container for daily tarot card advice",
                properties: [
                    CodingKeys.title.stringValue : .string(
                        description: "Title for daily tarot card advice in affirmation manner"
                    ),
                    CodingKeys.description.stringValue : .string(
                        description: "Content for daily tarot card advice in affirmation manner"
                    )
                ],
                required: [
                    CodingKeys.title.stringValue,
                    CodingKeys.description.stringValue
                ],
                additionalProperties: .boolean(false)
            ),
            strict: true
        )
    }
    
    let card: Card
    let advice:  Advice
    
    static let schema: LLMChatOpenAI.Options.ResponseFormat.Schema = .init(
        name: "Daily tarot card",
        description: "Object to describe daily tarot card and advice based on this card",
        schema: .object(
            description: "Schema to describe json format for daily card",
            properties: [
                CodingKeys.card.stringValue : Card.schema.schema!,
                CodingKeys.advice.stringValue : Advice.schema.schema!,
            ]
        ),
        strict: true
    )

}

