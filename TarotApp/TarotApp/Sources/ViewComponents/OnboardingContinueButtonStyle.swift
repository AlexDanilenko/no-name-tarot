//
//  OnboardingContinueButtonStyle.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 21.11.2024.
//

import SwiftUI

struct OnboardingContinueButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title3.bold())
            .foregroundStyle(
                configuration.isPressed
                ? TarotAppAsset.Assets.textWhite.swiftUIColor.opacity(0.7)
                : TarotAppAsset.Assets.textWhite.swiftUIColor
            )
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(
                gradient()
            )
            .cornerRadius(16)
            .frame(height: 110)
    }
    
    @ViewBuilder
    private func gradient() -> some View {
        LinearGradient(
            colors: [
                TarotAppAsset.Assets.buttonColorPurpleDark.swiftUIColor,
                TarotAppAsset.Assets.buttonColorPurpleLight.swiftUIColor,
                TarotAppAsset.Assets.buttonColorPurpleLight.swiftUIColor,
            ],
            startPoint: UnitPoint(x: 0.13, y: -1),
            endPoint: UnitPoint(x: 0.87, y: 3)
        )
    }
}


extension ButtonStyle where Self == OnboardingContinueButtonStyle {
    static var onboardingButton: Self {
        OnboardingContinueButtonStyle()
    }
}

#Preview {
    Button("Text") {
        
    }
    .buttonStyle(.onboardingButton)
}
