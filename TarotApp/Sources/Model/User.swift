//
//  User.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 26.01.2025.
//
import Foundation
import SwiftData

@Model
class User: Identifiable {
    enum Gender: Codable {
        case male, female
    }
    
    @Attribute(.unique) var id: UUID
    var gender: Gender
    var date: Date
    var isPremium: Bool
    
    init(id: UUID, gender: Gender, date: Date, isPremium: Bool) {
        self.id = id
        self.gender = gender
        self.date = date
        self.isPremium = isPremium
    }
}
