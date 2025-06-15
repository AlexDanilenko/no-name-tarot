//
//  CardType+Asset.swift
//  Lunalit
//
//  Created by Oleksandr Danylenko on 09.05.2025.
//

extension TarotCard {
    var asset: LunalitImages {
        switch self {
        // MARK: Major Arcana
        case .major(.theFool):          return LunalitAsset.Assets.Cards._00TheFool
        case .major(.theMagician):      return LunalitAsset.Assets.Cards._01TheMagician
        case .major(.theHighPriestess): return LunalitAsset.Assets.Cards._02TheHighPriestess
        case .major(.theEmpress):       return LunalitAsset.Assets.Cards._03TheEmpress
        case .major(.theEmperor):       return LunalitAsset.Assets.Cards._04TheEmperor
        case .major(.theHierophant):    return LunalitAsset.Assets.Cards._05TheHierophant
        case .major(.theLovers):        return LunalitAsset.Assets.Cards._06TheLovers
        case .major(.theChariot):       return LunalitAsset.Assets.Cards._07TheChariot
        case .major(.strength):         return LunalitAsset.Assets.Cards._08Strength
        case .major(.theHermit):        return LunalitAsset.Assets.Cards._09TheHermit
        case .major(.wheelOfFortune):   return LunalitAsset.Assets.Cards._10WheelOfFortune
        case .major(.justice):          return LunalitAsset.Assets.Cards._11Justice
        case .major(.theHangedMan):     return LunalitAsset.Assets.Cards._12TheHangedMan
        case .major(.death):            return LunalitAsset.Assets.Cards._13Death
        case .major(.temperance):       return LunalitAsset.Assets.Cards._14Temperance
        case .major(.theDevil):         return LunalitAsset.Assets.Cards._15TheDevil
        case .major(.theTower):         return LunalitAsset.Assets.Cards._16TheTower
        case .major(.theStar):          return LunalitAsset.Assets.Cards._17TheStar
        case .major(.theMoon):          return LunalitAsset.Assets.Cards._18TheMoon
        case .major(.theSun):           return LunalitAsset.Assets.Cards._19TheSun
        case .major(.judgement):        return LunalitAsset.Assets.Cards._20Judgement
        case .major(.theWorld):         return LunalitAsset.Assets.Cards._21TheWorld

        // MARK: Cups
        case .cups(.ace):   return LunalitAsset.Assets.Cards.aceOfCups
        case .cups(.two):   return LunalitAsset.Assets.Cards._2OfCups
        case .cups(.three): return LunalitAsset.Assets.Cards._3OfCups
        case .cups(.four):  return LunalitAsset.Assets.Cards._4OfCups
        case .cups(.five):  return LunalitAsset.Assets.Cards._5OfCups
        case .cups(.six):   return LunalitAsset.Assets.Cards._6OfCups
        case .cups(.seven): return LunalitAsset.Assets.Cards._7OfCups
        case .cups(.eight): return LunalitAsset.Assets.Cards._8OfCups
        case .cups(.nine):  return LunalitAsset.Assets.Cards._9OfCups
        case .cups(.ten):   return LunalitAsset.Assets.Cards._10OfCups
        case .cups(.page):  return LunalitAsset.Assets.Cards.pageOfCups
        case .cups(.knight):return LunalitAsset.Assets.Cards.knightOfCups
        case .cups(.queen): return LunalitAsset.Assets.Cards.queenOfCups
        case .cups(.king):  return LunalitAsset.Assets.Cards.kingOfCups

        // MARK: Swords
        case .swords(.ace):    return LunalitAsset.Assets.Cards.aceOfSwords
        case .swords(.two):    return LunalitAsset.Assets.Cards._2OfSwords
        case .swords(.three):  return LunalitAsset.Assets.Cards._3OfSwords
        case .swords(.four):   return LunalitAsset.Assets.Cards._4OfSwords
        case .swords(.five):   return LunalitAsset.Assets.Cards._5OfSwords
        case .swords(.six):    return LunalitAsset.Assets.Cards._6OfSwords
        case .swords(.seven):  return LunalitAsset.Assets.Cards._7OfSwords
        case .swords(.eight):  return LunalitAsset.Assets.Cards._8OfSwords
        case .swords(.nine):   return LunalitAsset.Assets.Cards._9OfSwords
        case .swords(.ten):    return LunalitAsset.Assets.Cards._10OfSwords
        case .swords(.page):   return LunalitAsset.Assets.Cards.pageOfSwords
        case .swords(.knight): return LunalitAsset.Assets.Cards.knightOfSwords
        case .swords(.queen):  return LunalitAsset.Assets.Cards.queenOfSwords
        case .swords(.king):   return LunalitAsset.Assets.Cards.kingOfSwords

        // MARK: Wands
        case .wands(.ace):    return LunalitAsset.Assets.Cards.aceOfWands
        case .wands(.two):    return LunalitAsset.Assets.Cards._2OfWands
        case .wands(.three):  return LunalitAsset.Assets.Cards._3OfWands
        case .wands(.four):   return LunalitAsset.Assets.Cards._4OfWands
        case .wands(.five):   return LunalitAsset.Assets.Cards._5OfWands
        case .wands(.six):    return LunalitAsset.Assets.Cards._6OfWands
        case .wands(.seven):  return LunalitAsset.Assets.Cards._7OfWands
        case .wands(.eight):  return LunalitAsset.Assets.Cards._8OfWands
        case .wands(.nine):   return LunalitAsset.Assets.Cards._9OfWands
        case .wands(.ten):    return LunalitAsset.Assets.Cards._10OfWands
        case .wands(.page):   return LunalitAsset.Assets.Cards.pageOfWands
        case .wands(.knight): return LunalitAsset.Assets.Cards.knightOfWands
        case .wands(.queen):  return LunalitAsset.Assets.Cards.queenOfWands
        case .wands(.king):   return LunalitAsset.Assets.Cards.kingOfWands

        // MARK: Pentacles
        case .pentacles(.ace):    return LunalitAsset.Assets.Cards.aceOfPentacles
        case .pentacles(.two):    return LunalitAsset.Assets.Cards._2OfPentacles
        case .pentacles(.three):  return LunalitAsset.Assets.Cards._3OfPentacles
        case .pentacles(.four):   return LunalitAsset.Assets.Cards._4OfPentacles
        case .pentacles(.five):   return LunalitAsset.Assets.Cards._5OfPentacles
        case .pentacles(.six):    return LunalitAsset.Assets.Cards._6OfPentacles
        case .pentacles(.seven):  return LunalitAsset.Assets.Cards._7OfPentacles
        case .pentacles(.eight):  return LunalitAsset.Assets.Cards._8OfPentacles
        case .pentacles(.nine):   return LunalitAsset.Assets.Cards._9OfPentacles
        case .pentacles(.ten):    return LunalitAsset.Assets.Cards._10OfPentacles
        case .pentacles(.page):   return LunalitAsset.Assets.Cards.pageOfPentacles
        case .pentacles(.knight): return LunalitAsset.Assets.Cards.knightOfPentacles
        case .pentacles(.queen):  return LunalitAsset.Assets.Cards.queenOfPentacles
        case .pentacles(.king):   return LunalitAsset.Assets.Cards.kingOfPentacles
        }
    }
}
