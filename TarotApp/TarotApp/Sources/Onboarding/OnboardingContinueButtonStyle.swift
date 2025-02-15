//
//  OnboardingContinueButtonStyle.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 21.11.2024.
//

import SwiftUI

struct OnboardingContinueButtonStyle: ButtonStyle {
    
    @State var rotationAngle:CGFloat = 200
    
    var startPoint:UnitPoint {
        return unitSquareIntersectionPoint(Angle(degrees: 360.0 * rotationAngle))
    }
    
    var endPoint:UnitPoint {
        return unitSquareIntersectionPoint(Angle(degrees: 360.0 * rotationAngle + 180.0))
    }
    
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
    }
    
    @ViewBuilder
    private func gradient() -> some View {
        LinearGradient(
            colors: [
                TarotAppAsset.Assets.buttonColorPurpleLight.swiftUIColor,
                TarotAppAsset.Assets.buttonColorPurpleDark.swiftUIColor,
            ],
            startPoint: startPoint,
            endPoint: endPoint
        )
    }
}

fileprivate func unitSquareIntersectionPoint(_ angle:Angle) -> UnitPoint {
        var normalizedDegree = angle.degrees
        while normalizedDegree > 360.0 {
            normalizedDegree -= 360.0
        }
        while normalizedDegree < 0.0 {
            normalizedDegree += 360.0
        }
        if normalizedDegree < 45.0 || normalizedDegree >= 315 {
            //Right Edge, x = 1.0
            var degreeToConsider = normalizedDegree
            if degreeToConsider < 45.0 {
                degreeToConsider = normalizedDegree +  360.0
                //angle now between 315 & 405
            }
            let degreeProportion = (degreeToConsider - 315.0) / 90.0
            return UnitPoint(x: 1.0, y: 1.0 - degreeProportion)
        } else if normalizedDegree < 135.0 {
            //Top Edge, y = 0.0
            let degreeProportion = (normalizedDegree - 45.0) / 90.0
            return UnitPoint(x: 1.0 - degreeProportion, y: 0.0)
        } else if normalizedDegree < 225.0 {
            //left Edge, x = 0.0
            let degreeProportion = (normalizedDegree - 135) / 90.0
            return UnitPoint(x: 0.0, y: degreeProportion)
        } else if normalizedDegree < 315.0 {
            //Bottom Edge, y = 1.0
            let degreeProportion = (normalizedDegree - 225) / 90.0
            return UnitPoint(x: degreeProportion, y: 1.0)
        }
        return .zero
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
