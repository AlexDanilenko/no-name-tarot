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
        case .major(.theFool):          return LunalitAsset.Assets._00TheFool
        case .major(.theMagician):      return LunalitAsset.Assets._01TheMagician
        case .major(.theHighPriestess): return LunalitAsset.Assets._02TheHighPriestess
        case .major(.theEmpress):       return LunalitAsset.Assets._03TheEmpress
        case .major(.theEmperor):       return LunalitAsset.Assets._04TheEmperor
        case .major(.theHierophant):    return LunalitAsset.Assets._05TheHierophant
        case .major(.theLovers):        return LunalitAsset.Assets._06TheLovers
        case .major(.theChariot):       return LunalitAsset.Assets._07TheChariot
        case .major(.strength):         return LunalitAsset.Assets._08Strength
        case .major(.theHermit):        return LunalitAsset.Assets._09TheHermit
        case .major(.wheelOfFortune):   return LunalitAsset.Assets._10WheelOfFortune
        case .major(.justice):          return LunalitAsset.Assets._11Justice
        case .major(.theHangedMan):     return LunalitAsset.Assets._12TheHangedMan
        case .major(.death):            return LunalitAsset.Assets._13Death
        case .major(.temperance):       return LunalitAsset.Assets._14Temperance
        case .major(.theDevil):         return LunalitAsset.Assets._15TheDevil
        case .major(.theTower):         return LunalitAsset.Assets._16TheTower
        case .major(.theStar):          return LunalitAsset.Assets._17TheStar
        case .major(.theMoon):          return LunalitAsset.Assets._18TheMoon
        case .major(.theSun):           return LunalitAsset.Assets._19TheSun
        case .major(.judgement):        return LunalitAsset.Assets._20Judgement
        case .major(.theWorld):         return LunalitAsset.Assets._21TheWorld

        // MARK: Cups
        case .cups(.ace):   return LunalitAsset.Assets.aceOfCups
        case .cups(.two):   return LunalitAsset.Assets._2OfCups
        case .cups(.three): return LunalitAsset.Assets._3OfCups
        case .cups(.four):  return LunalitAsset.Assets._4OfCups
        case .cups(.five):  return LunalitAsset.Assets._5OfCups
        case .cups(.six):   return LunalitAsset.Assets._6OfCups
        case .cups(.seven): return LunalitAsset.Assets._7OfCups
        case .cups(.eight): return LunalitAsset.Assets._8OfCups
        case .cups(.nine):  return LunalitAsset.Assets._9OfCups
        case .cups(.ten):   return LunalitAsset.Assets._10OfCups
        case .cups(.page):  return LunalitAsset.Assets.pageOfCups
        case .cups(.knight):return LunalitAsset.Assets.knightOfCups
        case .cups(.queen): return LunalitAsset.Assets.queenOfCups
        case .cups(.king):  return LunalitAsset.Assets.kingOfCups

        // MARK: Swords
        case .swords(.ace):    return LunalitAsset.Assets.aceOfSwords
        case .swords(.two):    return LunalitAsset.Assets._2OfSwords
        case .swords(.three):  return LunalitAsset.Assets._3OfSwords
        case .swords(.four):   return LunalitAsset.Assets._4OfSwords
        case .swords(.five):   return LunalitAsset.Assets._5OfSwords
        case .swords(.six):    return LunalitAsset.Assets._6OfSwords
        case .swords(.seven):  return LunalitAsset.Assets._7OfSwords
        case .swords(.eight):  return LunalitAsset.Assets._8OfSwords
        case .swords(.nine):   return LunalitAsset.Assets._9OfSwords
        case .swords(.ten):    return LunalitAsset.Assets._10OfSwords
        case .swords(.page):   return LunalitAsset.Assets.pageOfSwords
        case .swords(.knight): return LunalitAsset.Assets.knightOfSwords
        case .swords(.queen):  return LunalitAsset.Assets.queenOfSwords
        case .swords(.king):   return LunalitAsset.Assets.kingOfSwords

        // MARK: Wands
        case .wands(.ace):    return LunalitAsset.Assets.aceOfWands
        case .wands(.two):    return LunalitAsset.Assets._2OfWands
        case .wands(.three):  return LunalitAsset.Assets._3OfWands
        case .wands(.four):   return LunalitAsset.Assets._4OfWands
        case .wands(.five):   return LunalitAsset.Assets._5OfWands
        case .wands(.six):    return LunalitAsset.Assets._6OfWands
        case .wands(.seven):  return LunalitAsset.Assets._7OfWands
        case .wands(.eight):  return LunalitAsset.Assets._8OfWands
        case .wands(.nine):   return LunalitAsset.Assets._9OfWands
        case .wands(.ten):    return LunalitAsset.Assets._10OfWands
        case .wands(.page):   return LunalitAsset.Assets.pageOfWands
        case .wands(.knight): return LunalitAsset.Assets.knightOfWands
        case .wands(.queen):  return LunalitAsset.Assets.queenOfWands
        case .wands(.king):   return LunalitAsset.Assets.kingOfWands

        // MARK: Pentacles
        case .pentacles(.ace):    return LunalitAsset.Assets.aceOfPentacles
        case .pentacles(.two):    return LunalitAsset.Assets._2OfPentacles
        case .pentacles(.three):  return LunalitAsset.Assets._3OfPentacles
        case .pentacles(.four):   return LunalitAsset.Assets._4OfPentacles
        case .pentacles(.five):   return LunalitAsset.Assets._5OfPentacles
        case .pentacles(.six):    return LunalitAsset.Assets._6OfPentacles
        case .pentacles(.seven):  return LunalitAsset.Assets._7OfPentacles
        case .pentacles(.eight):  return LunalitAsset.Assets._8OfPentacles
        case .pentacles(.nine):   return LunalitAsset.Assets._9OfPentacles
        case .pentacles(.ten):    return LunalitAsset.Assets._10OfPentacles
        case .pentacles(.page):   return LunalitAsset.Assets.pageOfPentacles
        case .pentacles(.knight): return LunalitAsset.Assets.knightOfPentacles
        case .pentacles(.queen):  return LunalitAsset.Assets.queenOfPentacles
        case .pentacles(.king):   return LunalitAsset.Assets.kingOfPentacles
        }
    }
}
