//
//  OnboardingBackgroundView.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 25.02.2025.
//

import SwiftUI

struct OnboardingBackgroundView: View {
    var body: some View {
        Image(asset: LunalitAsset.Assets.onboardingCard)
            .resizable()
            .background()
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .mask {
                LinearGradient(
                    stops: [
                        Gradient.Stop.init(color: .white.opacity(1), location: 0),
                        Gradient.Stop.init(color: .white.opacity(1), location: 0.85),
                        Gradient.Stop.init(color: .white.opacity(0), location: 1)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            }
    }
}

#Preview {
    OnboardingBackgroundView()
}
