//
//  Deck+Description.swift
//  TarotApp
//
//  Created by Assistant on 2025.
//

import Foundation

extension TarotCard {
    /// The card's main description based on upright meaning
    var description: String {
        switch self {
        // MARK: Major Arcana
        case .major(.theFool):          return String(majorArcana: .the_foolUprightMeaning)
        case .major(.theMagician):      return String(majorArcana: .the_magicianUprightMeaning)
        case .major(.theHighPriestess): return String(majorArcana: .the_high_priestessUprightMeaning)
        case .major(.theEmpress):       return String(majorArcana: .the_empressUprightMeaning)
        case .major(.theEmperor):       return String(majorArcana: .the_emperorUprightMeaning)
        case .major(.theHierophant):    return String(majorArcana: .the_hierophantUprightMeaning)
        case .major(.theLovers):        return String(majorArcana: .the_loversUprightMeaning)
        case .major(.theChariot):       return String(majorArcana: .the_chariotUprightMeaning)
        case .major(.strength):         return String(majorArcana: .strengthUprightMeaning)
        case .major(.theHermit):        return String(majorArcana: .the_hermitUprightMeaning)
        case .major(.wheelOfFortune):   return String(majorArcana: .wheel_of_fortuneUprightMeaning)
        case .major(.justice):          return String(majorArcana: .justiceUprightMeaning)
        case .major(.theHangedMan):     return String(majorArcana: .the_hanged_manUprightMeaning)
        case .major(.death):            return String(majorArcana: .deathUprightMeaning)
        case .major(.temperance):       return String(majorArcana: .temperanceUprightMeaning)
        case .major(.theDevil):         return String(majorArcana: .the_devilUprightMeaning)
        case .major(.theTower):         return String(majorArcana: .the_towerUprightMeaning)
        case .major(.theStar):          return String(majorArcana: .the_starUprightMeaning)
        case .major(.theMoon):          return String(majorArcana: .the_moonUprightMeaning)
        case .major(.theSun):           return String(majorArcana: .the_sunUprightMeaning)
        case .major(.judgement):        return String(majorArcana: .judgementUprightMeaning)
        case .major(.theWorld):         return String(majorArcana: .the_worldUprightMeaning)
            
        // MARK: Cups
        case .cups(.ace):    return String(cups: .ace_of_cupsUprightMeaning)
        case .cups(.two):    return String(cups: ._2_of_cupsUprightMeaning)
        case .cups(.three):  return String(cups: ._3_of_cupsUprightMeaning)
        case .cups(.four):   return String(cups: ._4_of_cupsUprightMeaning)
        case .cups(.five):   return String(cups: ._5_of_cupsUprightMeaning)
        case .cups(.six):    return String(cups: ._6_of_cupsUprightMeaning)
        case .cups(.seven):  return String(cups: ._7_of_cupsUprightMeaning)
        case .cups(.eight):  return String(cups: ._8_of_cupsUprightMeaning)
        case .cups(.nine):   return String(cups: ._9_of_cupsUprightMeaning)
        case .cups(.ten):    return String(cups: ._10_of_cupsUprightMeaning)
        case .cups(.page):   return String(cups: .page_of_cupsUprightMeaning)
        case .cups(.knight): return String(cups: .knight_of_cupsUprightMeaning)
        case .cups(.queen):  return String(cups: .queen_of_cupsUprightMeaning)
        case .cups(.king):   return String(cups: .king_of_cupsUprightMeaning)
            
        // MARK: Swords
        case .swords(.ace):    return String(swords: .ace_of_swordsUprightMeaning)
        case .swords(.two):    return String(swords: ._2_of_swordsUprightMeaning)
        case .swords(.three):  return String(swords: ._3_of_swordsUprightMeaning)
        case .swords(.four):   return String(swords: ._4_of_swordsUprightMeaning)
        case .swords(.five):   return String(swords: ._5_of_swordsUprightMeaning)
        case .swords(.six):    return String(swords: ._6_of_swordsUprightMeaning)
        case .swords(.seven):  return String(swords: ._7_of_swordsUprightMeaning)
        case .swords(.eight):  return String(swords: ._8_of_swordsUprightMeaning)
        case .swords(.nine):   return String(swords: ._9_of_swordsUprightMeaning)
        case .swords(.ten):    return String(swords: ._10_of_swordsUprightMeaning)
        case .swords(.page):   return String(swords: .page_of_swordsUprightMeaning)
        case .swords(.knight): return String(swords: .knight_of_swordsUprightMeaning)
        case .swords(.queen):  return String(swords: .queen_of_swordsUprightMeaning)
        case .swords(.king):   return String(swords: .king_of_swordsUprightMeaning)
            
        // MARK: Wands
        case .wands(.ace):    return String(wands: .ace_of_wandsUprightMeaning)
        case .wands(.two):    return String(wands: ._2_of_wandsUprightMeaning)
        case .wands(.three):  return String(wands: ._3_of_wandsUprightMeaning)
        case .wands(.four):   return String(wands: ._4_of_wandsUprightMeaning)
        case .wands(.five):   return String(wands: ._5_of_wandsUprightMeaning)
        case .wands(.six):    return String(wands: ._6_of_wandsUprightMeaning)
        case .wands(.seven):  return String(wands: ._7_of_wandsUprightMeaning)
        case .wands(.eight):  return String(wands: ._8_of_wandsUprightMeaning)
        case .wands(.nine):   return String(wands: ._9_of_wandsUprightMeaning)
        case .wands(.ten):    return String(wands: ._10_of_wandsUprightMeaning)
        case .wands(.page):   return String(wands: .page_of_wandsUprightMeaning)
        case .wands(.knight): return String(wands: .knight_of_wandsUprightMeaning)
        case .wands(.queen):  return String(wands: .queen_of_wandsUprightMeaning)
        case .wands(.king):   return String(wands: .king_of_wandsUprightMeaning)
            
        // MARK: Pentacles
        case .pentacles(.ace):    return String(pentacles: .ace_of_pentaclesUprightMeaning)
        case .pentacles(.two):    return String(pentacles: ._2_of_pentaclesUprightMeaning)
        case .pentacles(.three):  return String(pentacles: ._3_of_pentaclesUprightMeaning)
        case .pentacles(.four):   return String(pentacles: ._4_of_pentaclesUprightMeaning)
        case .pentacles(.five):   return String(pentacles: ._5_of_pentaclesUprightMeaning)
        case .pentacles(.six):    return String(pentacles: ._6_of_pentaclesUprightMeaning)
        case .pentacles(.seven):  return String(pentacles: ._7_of_pentaclesUprightMeaning)
        case .pentacles(.eight):  return String(pentacles: ._8_of_pentaclesUprightMeaning)
        case .pentacles(.nine):   return String(pentacles: ._9_of_pentaclesUprightMeaning)
        case .pentacles(.ten):    return String(pentacles: ._10_of_pentaclesUprightMeaning)
        case .pentacles(.page):   return String(pentacles: .page_of_pentaclesUprightMeaning)
        case .pentacles(.knight): return String(pentacles: .knight_of_pentaclesUprightMeaning)
        case .pentacles(.queen):  return String(pentacles: .queen_of_pentaclesUprightMeaning)
        case .pentacles(.king):   return String(pentacles: .king_of_pentaclesUprightMeaning)
        }
    }
    
    /// The card's prediction/recommendation based on upright recommendation
    var prediction: String {
        switch self {
        // MARK: Major Arcana
        case .major(.theFool):          return String(majorArcana: .the_foolUprightRecommendation)
        case .major(.theMagician):      return String(majorArcana: .the_magicianUprightRecommendation)
        case .major(.theHighPriestess): return String(majorArcana: .the_high_priestessUprightRecommendation)
        case .major(.theEmpress):       return String(majorArcana: .the_empressUprightRecommendation)
        case .major(.theEmperor):       return String(majorArcana: .the_emperorUprightRecommendation)
        case .major(.theHierophant):    return String(majorArcana: .the_hierophantUprightRecommendation)
        case .major(.theLovers):        return String(majorArcana: .the_loversUprightRecommendation)
        case .major(.theChariot):       return String(majorArcana: .the_chariotUprightRecommendation)
        case .major(.strength):         return String(majorArcana: .strengthUprightRecommendation)
        case .major(.theHermit):        return String(majorArcana: .the_hermitUprightRecommendation)
        case .major(.wheelOfFortune):   return String(majorArcana: .wheel_of_fortuneUprightRecommendation)
        case .major(.justice):          return String(majorArcana: .justiceUprightRecommendation)
        case .major(.theHangedMan):     return String(majorArcana: .the_hanged_manUprightRecommendation)
        case .major(.death):            return String(majorArcana: .deathUprightRecommendation)
        case .major(.temperance):       return String(majorArcana: .temperanceUprightRecommendation)
        case .major(.theDevil):         return String(majorArcana: .the_devilUprightRecommendation)
        case .major(.theTower):         return String(majorArcana: .the_towerUprightRecommendation)
        case .major(.theStar):          return String(majorArcana: .the_starUprightRecommendation)
        case .major(.theMoon):          return String(majorArcana: .the_moonUprightRecommendation)
        case .major(.theSun):           return String(majorArcana: .the_sunUprightRecommendation)
        case .major(.judgement):        return String(majorArcana: .judgementUprightRecommendation)
        case .major(.theWorld):         return String(majorArcana: .the_worldUprightRecommendation)
            
        // MARK: Cups
        case .cups(.ace):    return String(cups: .ace_of_cupsUprightRecommendation)
        case .cups(.two):    return String(cups: ._2_of_cupsUprightRecommendation)
        case .cups(.three):  return String(cups: ._3_of_cupsUprightRecommendation)
        case .cups(.four):   return String(cups: ._4_of_cupsUprightRecommendation)
        case .cups(.five):   return String(cups: ._5_of_cupsUprightRecommendation)
        case .cups(.six):    return String(cups: ._6_of_cupsUprightRecommendation)
        case .cups(.seven):  return String(cups: ._7_of_cupsUprightRecommendation)
        case .cups(.eight):  return String(cups: ._8_of_cupsUprightRecommendation)
        case .cups(.nine):   return String(cups: ._9_of_cupsUprightRecommendation)
        case .cups(.ten):    return String(cups: ._10_of_cupsUprightRecommendation)
        case .cups(.page):   return String(cups: .page_of_cupsUprightRecommendation)
        case .cups(.knight): return String(cups: .knight_of_cupsUprightRecommendation)
        case .cups(.queen):  return String(cups: .queen_of_cupsUprightRecommendation)
        case .cups(.king):   return String(cups: .king_of_cupsUprightRecommendation)
            
        // MARK: Swords
        case .swords(.ace):    return String(swords: .ace_of_swordsUprightRecommendation)
        case .swords(.two):    return String(swords: ._2_of_swordsUprightRecommendation)
        case .swords(.three):  return String(swords: ._3_of_swordsUprightRecommendation)
        case .swords(.four):   return String(swords: ._4_of_swordsUprightRecommendation)
        case .swords(.five):   return String(swords: ._5_of_swordsUprightRecommendation)
        case .swords(.six):    return String(swords: ._6_of_swordsUprightRecommendation)
        case .swords(.seven):  return String(swords: ._7_of_swordsUprightRecommendation)
        case .swords(.eight):  return String(swords: ._8_of_swordsUprightRecommendation)
        case .swords(.nine):   return String(swords: ._9_of_swordsUprightRecommendation)
        case .swords(.ten):    return String(swords: ._10_of_swordsUprightRecommendation)
        case .swords(.page):   return String(swords: .page_of_swordsUprightRecommendation)
        case .swords(.knight): return String(swords: .knight_of_swordsUprightRecommendation)
        case .swords(.queen):  return String(swords: .queen_of_swordsUprightRecommendation)
        case .swords(.king):   return String(swords: .king_of_swordsUprightRecommendation)
            
        // MARK: Wands
        case .wands(.ace):    return String(wands: .ace_of_wandsUprightRecommendation)
        case .wands(.two):    return String(wands: ._2_of_wandsUprightRecommendation)
        case .wands(.three):  return String(wands: ._3_of_wandsUprightRecommendation)
        case .wands(.four):   return String(wands: ._4_of_wandsUprightRecommendation)
        case .wands(.five):   return String(wands: ._5_of_wandsUprightRecommendation)
        case .wands(.six):    return String(wands: ._6_of_wandsUprightRecommendation)
        case .wands(.seven):  return String(wands: ._7_of_wandsUprightRecommendation)
        case .wands(.eight):  return String(wands: ._8_of_wandsUprightRecommendation)
        case .wands(.nine):   return String(wands: ._9_of_wandsUprightRecommendation)
        case .wands(.ten):    return String(wands: ._10_of_wandsUprightRecommendation)
        case .wands(.page):   return String(wands: .page_of_wandsUprightRecommendation)
        case .wands(.knight): return String(wands: .knight_of_wandsUprightRecommendation)
        case .wands(.queen):  return String(wands: .queen_of_wandsUprightRecommendation)
        case .wands(.king):   return String(wands: .king_of_wandsUprightRecommendation)
            
        // MARK: Pentacles
        case .pentacles(.ace):    return String(pentacles: .ace_of_pentaclesUprightRecommendation)
        case .pentacles(.two):    return String(pentacles: ._2_of_pentaclesUprightRecommendation)
        case .pentacles(.three):  return String(pentacles: ._3_of_pentaclesUprightRecommendation)
        case .pentacles(.four):   return String(pentacles: ._4_of_pentaclesUprightRecommendation)
        case .pentacles(.five):   return String(pentacles: ._5_of_pentaclesUprightRecommendation)
        case .pentacles(.six):    return String(pentacles: ._6_of_pentaclesUprightRecommendation)
        case .pentacles(.seven):  return String(pentacles: ._7_of_pentaclesUprightRecommendation)
        case .pentacles(.eight):  return String(pentacles: ._8_of_pentaclesUprightRecommendation)
        case .pentacles(.nine):   return String(pentacles: ._9_of_pentaclesUprightRecommendation)
        case .pentacles(.ten):    return String(pentacles: ._10_of_pentaclesUprightRecommendation)
        case .pentacles(.page):   return String(pentacles: .page_of_pentaclesUprightRecommendation)
        case .pentacles(.knight): return String(pentacles: .knight_of_pentaclesUprightRecommendation)
        case .pentacles(.queen):  return String(pentacles: .queen_of_pentaclesUprightRecommendation)
        case .pentacles(.king):   return String(pentacles: .king_of_pentaclesUprightRecommendation)
        }
    }
} 