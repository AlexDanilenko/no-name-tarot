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
        let card: TarotCard
        let description: String
        
        
        static let schema: LLMChatOpenAI.Options.ResponseFormat.Schema = .init(
            name: "card",
            description: "Daily tarot card advice with title and description",
            schema: .object(
                description: "A Deck value, represented by its arcana ‘type’ and the card ‘value’ within that arcana",
                properties: [
                    CodingKeys.description.stringValue : .string(
                        description: "Daily tarot card description and meaning"
                    ),
                    CodingKeys.card.stringValue : TarotCard.schema.schema!
                ],
                required: [
                    CodingKeys.description.stringValue,
                    CodingKeys.card.stringValue,
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
            name: "daily_advice",
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
        name: "tarot_day",
        description: "Object to describe daily tarot card and advice based on this card",
        schema: .object(
            description: "Schema to describe json format for daily card",
            properties: [
                CodingKeys.card.stringValue : Card.schema.schema!,
                CodingKeys.advice.stringValue : Advice.schema.schema!,
            ],
            required: [
                CodingKeys.card.stringValue,
                CodingKeys.advice.stringValue
            ],
            additionalProperties: .boolean(false)
        ),
        strict: true
    )
    
}


extension TarotCard: OpenAIResponseSchema {
    static var schema: LLMChatOpenAI.Options.ResponseFormat.Schema {
        return .init(
            name: "Tarot Card",
            description: "Object with corresponding Arcana type and card value",
            schema: .object(
                description: "Schema to describe json format for tarot card",
                properties: [
                    // matches DeckType: major, wands, swords, pentacles, cups
                    CodingKeys.type.stringValue: .enum(
                        description: "Arcana type (major or one of the four suits)",
                        values: TarotCard.DeckType.allCases.map { .string($0.rawValue) }
                    ),
                    // matches all Deck.Major and Deck.Minor cases
                    CodingKeys.value.stringValue: .enum(
                        description: "Specific card within the given arcana",
                        values: [
                            TarotCard.Minor.allCases.map { .string($0.rawValue) },
                            TarotCard.Major.allCases.map { .string($0.rawValue) }
                        ].flatMap(\.self)
                    )
                ],
                
                required: [
                    CodingKeys.type.stringValue,
                    CodingKeys.value.stringValue
                ],
                additionalProperties: .boolean(false)
            ),
            strict: true
        )
    }
}
