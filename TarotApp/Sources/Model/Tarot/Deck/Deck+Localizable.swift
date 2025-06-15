//
//  Deck+Localizable.swift
//  Lunalit
//
//  Created by Oleksandr Danylenko on 09.05.2025.
//

extension TarotCard {
    /// The localization key (matching your asset names) for each card's display name.
    var localizationKey: String.Localizable {
        switch self {
            // MARK: Major Arcana
        case .major(.theFool):          return .the_fool
        case .major(.theMagician):      return .the_magician
        case .major(.theHighPriestess): return .the_high_priestess
        case .major(.theEmpress):       return .the_empress
        case .major(.theEmperor):       return .the_emperor
        case .major(.theHierophant):    return .the_hierophant
        case .major(.theLovers):        return .the_lovers
        case .major(.theChariot):       return .the_chariot
        case .major(.strength):         return .strength
        case .major(.theHermit):        return .the_hermit
        case .major(.wheelOfFortune):   return .wheel_of_fortune
        case .major(.justice):          return .justice
        case .major(.theHangedMan):     return .the_hanged_man
        case .major(.death):            return .death
        case .major(.temperance):       return .temperance
        case .major(.theDevil):         return .the_devil
        case .major(.theTower):         return .the_tower
        case .major(.theStar):          return .the_star
        case .major(.theMoon):          return .the_moon
        case .major(.theSun):           return .the_sun
        case .major(.judgement):        return .judgement
        case .major(.theWorld):         return .the_world
            
            // MARK: Cups
        case .cups(.ace):    return .ace_of_cups
        case .cups(.two):    return ._2_of_cups
        case .cups(.three):  return ._3_of_cups
        case .cups(.four):   return ._4_of_cups
        case .cups(.five):   return ._5_of_cups
        case .cups(.six):    return ._6_of_cups
        case .cups(.seven):  return ._7_of_cups
        case .cups(.eight):  return ._8_of_cups
        case .cups(.nine):   return ._9_of_cups
        case .cups(.ten):    return ._10_of_cups
        case .cups(.page):   return .page_of_cups
        case .cups(.knight): return .knight_of_cups
        case .cups(.queen):  return .queen_of_cups
        case .cups(.king):   return .king_of_cups
            
            // MARK: Swords
        case .swords(.ace):    return .ace_of_swords
        case .swords(.two):    return ._2_of_swords
        case .swords(.three):  return ._3_of_swords
        case .swords(.four):   return ._4_of_swords
        case .swords(.five):   return ._5_of_swords
        case .swords(.six):    return ._6_of_swords
        case .swords(.seven):  return ._7_of_swords
        case .swords(.eight):  return ._8_of_swords
        case .swords(.nine):   return ._9_of_swords
        case .swords(.ten):    return ._10_of_swords
        case .swords(.page):   return .page_of_swords
        case .swords(.knight): return .knight_of_swords
        case .swords(.queen):  return .queen_of_swords
        case .swords(.king):   return .king_of_swords
            
            // MARK: Wands
        case .wands(.ace):    return .ace_of_wands
        case .wands(.two):    return ._2_of_wands
        case .wands(.three):  return ._3_of_wands
        case .wands(.four):   return ._4_of_wands
        case .wands(.five):   return ._5_of_wands
        case .wands(.six):    return ._6_of_wands
        case .wands(.seven):  return ._7_of_wands
        case .wands(.eight):  return ._8_of_wands
        case .wands(.nine):   return ._9_of_wands
        case .wands(.ten):    return ._10_of_wands
        case .wands(.page):   return .page_of_wands
        case .wands(.knight): return .knight_of_wands
        case .wands(.queen):  return .queen_of_wands
        case .wands(.king):   return .king_of_wands
            
            // MARK: Pentacles
        case .pentacles(.ace):    return .ace_of_pentacles
        case .pentacles(.two):    return ._2_of_pentacles
        case .pentacles(.three):  return ._3_of_pentacles
        case .pentacles(.four):   return ._4_of_pentacles
        case .pentacles(.five):   return ._5_of_pentacles
        case .pentacles(.six):    return ._6_of_pentacles
        case .pentacles(.seven):  return ._7_of_pentacles
        case .pentacles(.eight):  return ._8_of_pentacles
        case .pentacles(.nine):   return ._9_of_pentacles
        case .pentacles(.ten):    return ._10_of_pentacles
        case .pentacles(.page):   return .page_of_pentacles
        case .pentacles(.knight): return .knight_of_pentacles
        case .pentacles(.queen):  return .queen_of_pentacles
        case .pentacles(.king):   return .king_of_pentacles
        }
    }

}
