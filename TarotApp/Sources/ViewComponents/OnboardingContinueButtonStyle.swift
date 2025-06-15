//
//  OnboardingContinueButtonStyle.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 21.11.2024.
//

import SwiftUI

struct OnboardingContinueButtonStyle: ButtonStyle {
    let isEnabled: Bool
    
    init(isEnabled: Bool = true) {
        self.isEnabled = isEnabled
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title3.bold())
            .foregroundStyle(
                !isEnabled 
                ? Color.gray
                : configuration.isPressed
                ? LunalitAsset.Assets.textWhite.swiftUIColor.opacity(0.8)
                : LunalitAsset.Assets.textWhite.swiftUIColor
            )
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(
                Group {
                    if !isEnabled {
                        // Disabled state - gray gradient
                        LinearGradient(
                            colors: [
                                Color.gray.opacity(0.3),
                                Color.gray.opacity(0.2),
                                Color.gray.opacity(0.2),
                            ],
                            startPoint: UnitPoint(x: 0.13, y: -1),
                            endPoint: UnitPoint(x: 0.87, y: 3)
                        )
                    } else if configuration.isPressed {
                        // Pressed state - darker gradient
                        LinearGradient(
                            colors: [
                                LunalitAsset.Assets.buttonColorPurpleDark.swiftUIColor.opacity(0.8),
                                LunalitAsset.Assets.buttonColorPurpleLight.swiftUIColor.opacity(0.8),
                                LunalitAsset.Assets.buttonColorPurpleLight.swiftUIColor.opacity(0.8),
                            ],
                            startPoint: UnitPoint(x: 0.13, y: -1),
                            endPoint: UnitPoint(x: 0.87, y: 3)
                        )
                    } else {
                        // Normal state - full gradient
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
            )
            .cornerRadius(16)
            .scaleEffect(
                !isEnabled 
                ? 1.0 
                : configuration.isPressed ? 0.98 : 1.0
            )
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
            .opacity(!isEnabled ? 0.6 : 1.0)
            .overlay(
                // Add subtle border for better definition
                RoundedRectangle(cornerRadius: 16)
                    .stroke(
                        !isEnabled 
                        ? Color.clear
                        : LunalitAsset.Assets.purpleLight1.swiftUIColor.opacity(0.3), 
                        lineWidth: 1
                    )
            )
    }
    
}


extension ButtonStyle where Self == OnboardingContinueButtonStyle {
    static var onboardingButton: Self {
        OnboardingContinueButtonStyle()
    }
    
    static func onboardingButton(isEnabled: Bool) -> Self {
        OnboardingContinueButtonStyle(isEnabled: isEnabled)
    }
}

#Preview {
    Button("Text") {
        
    }
    .buttonStyle(.onboardingButton)
}
