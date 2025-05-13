//
//  CardType+Codable.swift
//  Lunalit
//
//  Created by Oleksandr Danylenko on 09.05.2025.
//

extension TarotCard: Codable {
    enum CodingKeys: String, CodingKey {
        case type, value
    }
    enum DeckType: String, Codable, CaseIterable {
        case major, wands, swords, pentacles, cups
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .major(let major):
            try container.encode(DeckType.major, forKey: .type)
            try container.encode(major, forKey: .value)
        case .wands(let minor):
            try container.encode(DeckType.wands, forKey: .type)
            try container.encode(minor, forKey: .value)
        case .swords(let minor):
            try container.encode(DeckType.swords, forKey: .type)
            try container.encode(minor, forKey: .value)
        case .pentacles(let minor):
            try container.encode(DeckType.pentacles, forKey: .type)
            try container.encode(minor, forKey: .value)
        case .cups(let minor):
            try container.encode(DeckType.cups, forKey: .type)
            try container.encode(minor, forKey: .value)
        }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(DeckType.self, forKey: .type)

        switch type {
        case .major:
            let major = try container.decode(Major.self, forKey: .value)
            self = .major(major)
        case .wands:
            let minor = try container.decode(Minor.self, forKey: .value)
            self = .wands(minor)
        case .swords:
            let minor = try container.decode(Minor.self, forKey: .value)
            self = .swords(minor)
        case .pentacles:
            let minor = try container.decode(Minor.self, forKey: .value)
            self = .pentacles(minor)
        case .cups:
            let minor = try container.decode(Minor.self, forKey: .value)
            self = .cups(minor)
        }
    }
}

