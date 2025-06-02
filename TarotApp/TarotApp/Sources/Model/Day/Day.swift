//
//  File.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 02.02.2025.
//

import Foundation
import SwiftData

@Model
class Day {
    @Attribute(.unique) 
    let id: UUID
    let date: Date
    @Attribute(.externalStorage)
    private var cardData: Data
    let advice: String
    
    // Computed property to access the TarotCard
    var card: TarotCard {
        get {
            do {
                return try JSONDecoder().decode(TarotCard.self, from: cardData)
            } catch {
                // Fallback to a default card if decoding fails
                return .major(.theFool)
            }
        }
    }
    
    init(id: UUID, date: Date, card: TarotCard, advice: String) {
        self.id = id
        self.date = date
        self.advice = advice
        
        // Encode the TarotCard to JSON data
        do {
            self.cardData = try JSONEncoder().encode(card)
        } catch {
            // Fallback to encoding a default card
            self.cardData = try! JSONEncoder().encode(TarotCard.major(.theFool))
        }
    }
}
