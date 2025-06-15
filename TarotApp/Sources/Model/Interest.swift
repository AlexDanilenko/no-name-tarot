//
//  Interest.swift
//  TarotApp
//
//  Created by Assistant on December 2024.
//

import Foundation

/// Unified Interest enum that serves as the single source of truth for all interest categories
/// throughout the app. Replaces both PersonalInfo.State.Interest and Spread.State.Interest.
enum Interest: String, CaseIterable, Codable {
    // Core interests from PersonalInfo (onboarding)
    case love = "Love & Relationships"
    case career = "Career & Work"
    case mood = "Mood & Energy" 
    case finance = "Money & Finance"
    case future = "Future Insights"
    
    // Additional interests from Spread (tarot readings)
    case spiritual = "Spirituality & Growth"
    case relations = "Relationships"
    case situations = "Life Situations"
    
    /// Human-readable display name for UI presentation
    var displayName: String {
        return self.rawValue
    }
    
    /// System icon name for UI representation
    var systemIconName: String {
        switch self {
        case .love:
            return "heart.fill"
        case .career:
            return "briefcase.fill"
        case .mood:
            return "sun.max.fill"
        case .finance:
            return "dollarsign.circle.fill"
        case .future:
            return "eye.fill"
        case .spiritual:
            return "sparkles"
        case .relations:
            return "person.2.fill"
        case .situations:
            return "questionmark.circle.fill"
        }
    }
    
    /// Color associated with each interest category
    var colorHex: String {
        switch self {
        case .love:
            return "#FF69B4"
        case .career:
            return "#4169E1"
        case .mood:
            return "#FFD700"
        case .finance:
            return "#228B22"
        case .future:
            return "#9932CC"
        case .spiritual:
            return "#20B2AA"
        case .relations:
            return "#FF6347"
        case .situations:
            return "#708090"
        }
    }
    
    /// Icon name for asset lookup
    var iconName: String { "interest_\(self.rawValue.lowercased().replacingOccurrences(of: " ", with: "_"))" }
    
    /// Short identifier for API calls and analytics
    var identifier: String { self.rawValue.lowercased().replacingOccurrences(of: " ", with: "_") }
}

// MARK: - Compatibility Extensions

extension Interest {
    /// Maps from old PersonalInfo.State.Interest values for backward compatibility
    static func fromPersonalInfo(_ personalInfoInterest: String) -> Interest? {
        switch personalInfoInterest {
        case "love": return .love
        case "career": return .career
        case "mood": return .mood
        case "finance": return .finance
        case "future": return .future
        default: return nil
        }
    }
    
    /// Maps from old Spread.State.Interest values for backward compatibility
    static func fromSpread(_ spreadInterest: String) -> Interest? {
        switch spreadInterest {
        case "love": return .love
        case "money": return .finance // Map money to finance
        case "career": return .career
        case "finance": return .finance
        case "relations": return .relations
        case "situations": return .situations
        case "spiritual": return .spiritual
        default: return nil
        }
    }
}

// MARK: - Localization Support

extension Interest {
    /// Localization key for the interest display name
    var localizationKey: String {
        "interest_\(identifier)"
    }
}

// MARK: - UI Helpers

extension Interest {
    /// Color associated with each interest for UI theming
    var themeColor: String {
        switch self {
        case .love, .relations: return "love_color"
        case .career: return "career_color"
        case .mood: return "mood_color"
        case .finance: return "finance_color"
        case .future: return "future_color"
        case .spiritual: return "spiritual_color"
        case .situations: return "situations_color"
        }
    }
} 