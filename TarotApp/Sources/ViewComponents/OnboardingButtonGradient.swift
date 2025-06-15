//
//  OnboardingButtonGradient.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 17.04.2025.
//

import SwiftUI

extension ShapeStyle where Self == LinearGradient {
    
    @ViewBuilder
    static var onboardingGradient: Self {
        LinearGradient(
            colors: [
                LunalitAsset.Assets.buttonColorPurpleDark.swiftUIColor,
                LunalitAsset.Assets.buttonColorPurpleLight.swiftUIColor,
                LunalitAsset.Assets.buttonColorPurpleLight.swiftUIColor,
            ],
            startPoint: UnitPoint(x: 0.13, y: -1),
            endPoint: UnitPoint(x: 0.87, y: 3)
        )
    }
}
