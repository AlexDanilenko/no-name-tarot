//
//  BigOnboardingButtonStyle.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 17.04.2025.
//

import SwiftUI

struct BigOnboardingButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(
                configuration.isPressed
                ? LunalitAsset.Assets.textWhite.swiftUIColor.opacity(0.7)
                : LunalitAsset.Assets.textWhite.swiftUIColor
            )
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(
                .onboardingGradient
            )
            .cornerRadius(16)
    }
}
