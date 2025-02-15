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
    let card: TarotCard
    let advice: String
    
    init(id: UUID, date: Date, card: TarotCard, advice: String) {
        self.id = id
        self.date = date
        self.card = card
        self.advice = advice
    }
}
