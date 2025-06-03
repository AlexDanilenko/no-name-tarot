import Foundation
import LLMChatOpenAI

/// Response schema for insight for a particular interest.
struct OpenAISpreadInsight: OpenAIResponseSchema {
    let description: String

    static let schema: LLMChatOpenAI.Options.ResponseFormat.Schema = .init(
        name: "spread_insight",
        description: "Insight for selected interest",
        schema: .object(
            description: "Insight container",
            properties: [
                CodingKeys.description.stringValue : .string(
                    description: "Insight description" )
            ],
            required: [CodingKeys.description.stringValue],
            additionalProperties: .boolean(false)
        ),
        strict: true
    )
}

extension OpenAIRequest where Response == OpenAISpreadInsight {
    static func insight(
        for interest: Spread.State.Interest,
        cards: [TarotCard]
    ) -> Self {
        let cardsList = cards.map({
            String(localizable: $0.localizationKey)
        }).joined(separator: ", ")
        return Self(
            messages: [
                .init(
                    role: .system,
                    content: [.text("You are an experienced tarot reader.")],
                    name: "Tarot insight"
                ),
                .init(
                    role: .user,
                    content: [
                        .text("Given the tarot spread with cards: \(cardsList), give me a short insight about \(interest).")
                    ],
                    name: "Tarot insight user"
                )
            ]
        )
    }
}
