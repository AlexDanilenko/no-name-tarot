//
//  RotatingGradientBackground.swift
//  TarotApp
//
//  Created by Assistant on 2025.
//

import SwiftUI

// MARK: - Rotating Gradient Background

struct RotatingGradientBackground: View {
    @State private var animationPhase: CGFloat = 0
    
    let cornerRadius: CGFloat
    let animationSpeed: Double
    let opacity: Double
    
    init(
        cornerRadius: CGFloat = 14,
        animationSpeed: Double = 3.0,
        opacity: Double = 1.0
    ) {
        self.cornerRadius = cornerRadius
        self.animationSpeed = animationSpeed
        self.opacity = opacity
    }
    
    var body: some View {
        ZStack {
            // Base gradient
            
            RadialGradient(
                colors: [
                    LunalitAsset.Assets.Yellow.paywall1.swiftUIColor.opacity(0.8),
                    LunalitAsset.Assets.purpleLight1.swiftUIColor.opacity(0.6),
                    LunalitAsset.Assets.buttonColorPurpleDark.swiftUIColor.opacity(0.4)
                ],
                center: .topLeading,
                startRadius: 0,
                endRadius: 400
            )
            
            // Rotating overlay
            
            LinearGradient(
                colors: [
                    LunalitAsset.Assets.Yellow.paywall1.swiftUIColor.opacity(0.3),
                    Color.clear,
                    LunalitAsset.Assets.purpleLight1.swiftUIColor.opacity(0.3),
                    Color.clear
                ],
                startPoint: UnitPoint(
                    x: 0.5 + 0.5 * cos(animationPhase),
                    y: 0.5 + 0.5 * sin(animationPhase)
                ),
                endPoint: UnitPoint(
                    x: 0.5 - 0.5 * cos(animationPhase),
                    y: 0.5 - 0.5 * sin(animationPhase)
                )
            )
        }
        .opacity(opacity)
        .onAppear {
            withAnimation(
                .linear(duration: animationSpeed)
                .repeatForever(autoreverses: true)
            ) {
                animationPhase = .pi * 2
            }
        }
    }
}

// MARK: - Linear Rotating Gradient Background

struct LinearRotatingGradientBackground: View {
    @State private var animationPhase: CGFloat = 0
    
    let cornerRadius: CGFloat
    let animationSpeed: Double
    let opacity: Double
    
    init(
        cornerRadius: CGFloat = 14,
        animationSpeed: Double = 4.0,
        opacity: Double = 1.0
    ) {
        self.cornerRadius = cornerRadius
        self.animationSpeed = animationSpeed
        self.opacity = opacity
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(
                LinearGradient(
                    colors: [
                        LunalitAsset.Assets.Yellow.paywall1.swiftUIColor,
                        LunalitAsset.Assets.purpleLight1.swiftUIColor,
                        LunalitAsset.Assets.buttonColorPurpleDark.swiftUIColor,
                        LunalitAsset.Assets.Yellow.paywall1.swiftUIColor
                    ],
                    startPoint: UnitPoint(
                        x: 0.5 + 0.5 * cos(animationPhase),
                        y: 0.5 + 0.5 * sin(animationPhase)
                    ),
                    endPoint: UnitPoint(
                        x: 0.5 - 0.5 * cos(animationPhase),
                        y: 0.5 - 0.5 * sin(animationPhase)
                    )
                )
            )
            .opacity(opacity)
            .onAppear {
                withAnimation(
                    .linear(duration: animationSpeed)
                    .repeatForever(autoreverses: false)
                ) {
                    animationPhase = .pi * 2
                }
            }
    }
}

// MARK: - Background Modifier Extensions

extension View {
    func rotatingGradientBackground(
        cornerRadius: CGFloat = 14,
        animationSpeed: Double = 3.0,
        opacity: Double = 1.0
    ) -> some View {
        self.background(
            RotatingGradientBackground(
                cornerRadius: cornerRadius,
                animationSpeed: animationSpeed,
                opacity: opacity
            )
        )
    }
    
    func linearRotatingGradientBackground(
        cornerRadius: CGFloat = 14,
        animationSpeed: Double = 4.0,
        opacity: Double = 1.0
    ) -> some View {
        self.background(
            LinearRotatingGradientBackground(
                cornerRadius: cornerRadius,
                animationSpeed: animationSpeed,
                opacity: opacity
            )
        )
    }
}

#Preview {
    VStack(spacing: 30) {
        // Rotating gradient background (angular)
        Text("Angular Background")
            .font(.title2.bold())
            .foregroundColor(.white)
            .padding(20)
            .rotatingGradientBackground(opacity: 0.8)
        
        // Linear rotating gradient background
        Text("Linear Background")
            .font(.title2.bold())
            .foregroundColor(.white)
            .padding(20)
            .linearRotatingGradientBackground(opacity: 0.7)
        
        // Combination: gradient background + animated border
        Text("Background + Border")
            .font(.title2.bold())
            .foregroundColor(.white)
            .padding(20)
            .rotatingGradientBackground(opacity: 0.3)
            .animatedGradientBorder(lineWidth: 3)
        
        // Different corner radius examples
        HStack(spacing: 20) {
            Text("Square")
                .padding(15)
                .rotatingGradientBackground(cornerRadius: 0)
            
            Text("Rounded")
                .padding(15)
                .rotatingGradientBackground(cornerRadius: 25)
        }
        .foregroundColor(.white)
        .font(.caption.bold())
    }
    .padding()
    .background(Color.black)
}
