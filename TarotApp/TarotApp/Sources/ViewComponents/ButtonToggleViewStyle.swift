//
//  ButtonToggleViewStyle.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 25.02.2025.
//

import SwiftUI

struct ButtonToggleViewStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            configuration.label
                .font(.system(size: 16))
                .foregroundStyle(.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 40)
                .background(
                    configuration.isOn
                    ? TarotAppAsset.Assets.purpleLight1.swiftUIColor
                    : Color.clear
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(TarotAppAsset.Assets.purpleLight1.swiftUIColor, lineWidth: 1)
                )
            
        }
        .tint(.primary)
        .buttonStyle(.borderless)
    }
}

extension ToggleStyle where Self == ButtonToggleViewStyle {
    static var onboardingToggle: Self {
        ButtonToggleViewStyle()
    }
}

#Preview {
    VStack {
        Toggle(isOn: .constant(true), label: { Text("ON") })
            .toggleStyle(.onboardingToggle)
        Toggle(isOn: .constant(false), label: { Text("Off") })
            .toggleStyle(.onboardingToggle)
    }
    .frame(width: 200, height: 150)
    .background(Color.black)
}
