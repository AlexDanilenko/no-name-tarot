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
