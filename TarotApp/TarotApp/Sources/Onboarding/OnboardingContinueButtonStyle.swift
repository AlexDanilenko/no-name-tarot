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
                ? Color("purple_light_2").opacity(0.7)
                : Color("purple_light_2")
            )
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("grape_light_1"))
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
