//
//  CardType.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 02.02.2025.
//

import Foundation

enum TarotCard: Equatable {
    case major(Major)
    case wands(Minor)
    case swords(Minor)
    case pentacles(Minor)
    case cups(Minor)
    
    // Major Arcane
    enum Major: String, Codable, CaseIterable {
        case theFool
        case theMagician
        case theHighPriestess
        case theEmpress
        case theEmperor
        case theHierophant
        case theLovers
        case theChariot
        case strength
        case theHermit
        case wheelOfFortune
        case justice
        case theHangedMan
        case death
        case temperance
        case theDevil
        case theTower
        case theStar
        case theMoon
        case theSun
        case judgement
        case theWorld
    }
    
    enum Minor: String, Codable, CaseIterable {
        case ace
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case ten
        case page
        case knight
        case queen
        case king
    }
}

extension TarotCard: CaseIterable {
    static var allCases: [TarotCard] {
        [
            Major.allCases.map { Self.major($0) },
            Minor.allCases.map { Self.wands($0) },
            Minor.allCases.map { Self.cups($0) },
            Minor.allCases.map { Self.pentacles($0) },
            Minor.allCases.map { Self.swords($0) },
        ]
            .flatMap(\.self)
    }
    
    
}
