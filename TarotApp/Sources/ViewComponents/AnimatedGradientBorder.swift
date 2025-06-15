//
//  AnimatedGradientBorder.swift
//  TarotApp
//
//  Created by Assistant on 2025.
//

import SwiftUI

struct AnimatedGradientBorder: View {
    @State private var animationPhase: CGFloat = 0
    @State private var opacity: Double = 0.3
    
    let cornerRadius: CGFloat
    let lineWidth: CGFloat
    let animationSpeed: Double
    let isPulsing: Bool
    
    init(
        cornerRadius: CGFloat = 14,
        lineWidth: CGFloat = 2,
        animationSpeed: Double = 2.0,
        isPulsing: Bool = false
    ) {
        self.cornerRadius = cornerRadius
        self.lineWidth = lineWidth
        self.animationSpeed = animationSpeed
        self.isPulsing = isPulsing
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(
                AngularGradient(
                    colors: [
                        LunalitAsset.Assets.Yellow.paywall1.swiftUIColor,
                        LunalitAsset.Assets.purpleLight1.swiftUIColor,
                        LunalitAsset.Assets.Yellow.paywall1.swiftUIColor,
                        LunalitAsset.Assets.purpleLight1.swiftUIColor,
                        LunalitAsset.Assets.Yellow.paywall1.swiftUIColor
                    ],
                    center: .center,
                    startAngle: .degrees(animationPhase),
                    endAngle: .degrees(animationPhase + 360)
                ),
                lineWidth: lineWidth
            )
            .opacity(opacity)
            .onAppear {
                withAnimation(
                    .linear(duration: animationSpeed)
                    .repeatForever(autoreverses: false)
                ) {
                    animationPhase = 360
                }
                if isPulsing {
                    withAnimation(
                        .easeInOut(duration: animationSpeed / 2)
                        .repeatForever(autoreverses: true)
                    ) {
                        opacity = 1.0
                    }
                } else {
                    opacity = 1.0
                }
            }
    }
}

// MARK: - View Modifier Extension

extension View {
    func animatedGradientBorder(
        cornerRadius: CGFloat = 14,
        lineWidth: CGFloat = 2,
        animationSpeed: Double = 2.0,
        isPulsing: Bool = false
    ) -> some View {
        self.overlay(
            AnimatedGradientBorder(
                cornerRadius: cornerRadius,
                lineWidth: lineWidth,
                animationSpeed: animationSpeed,
                isPulsing: isPulsing
            )
        )
    }
}

#Preview {
    VStack(spacing: 30) {
        // Rotating gradient border
        RoundedRectangle(cornerRadius: 14)
            .fill(Color.black.opacity(0.3))
            .frame(width: 200, height: 100)
            .animatedGradientBorder()
        
        // Pulsing gradient border
        RoundedRectangle(cornerRadius: 14)
            .fill(Color.black.opacity(0.3))
            .frame(width: 200, height: 100)
            .animatedGradientBorder(isPulsing: true)
        
        // Usage with text
        Text("Animated Border")
            .font(.title2.bold())
            .foregroundColor(.white)
            .padding(20)
            .background(Color.black.opacity(0.5))
            .animatedGradientBorder(cornerRadius: 12, lineWidth: 3)
    }
    .padding()
    .background(Color.black)
}
