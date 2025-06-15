//
//  PaywallToggleButtonStyle.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 13.04.2025.
//

import SwiftUI

struct PaywallToggleButtonStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            configuration.label
                .foregroundStyle(
                    configuration.isOn
                    ? .black
                    : .white
                )
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
                .background(
                    configuration.isOn
                    ? LunalitAsset.Assets.Yellow.paywall1.swiftUIColor
                    : Color.clear
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(
                            LunalitAsset.Assets.purpleLight1.swiftUIColor,
                            lineWidth: configuration.isOn ? 0 : 1
                        )
                )
            
        }
        .tint(.primary)
        .buttonStyle(.borderless)
    }
}

extension ToggleStyle where Self == PaywallToggleButtonStyle {
    static var paywallButton: Self {
        PaywallToggleButtonStyle()
    }
}


#Preview {
    
    VStack {
        Toggle(
            isOn: .constant(false)
        ) {
            PaywallButtonContent(
                state: .init(
                    title: "Ежемесячно",
                    fullPrice: "1,99 $",
                    fullPriceSubtitle: "в месяц",
                    adPrice: "1,99 $ / месяц",
                    isSelected: false
                )
            )
        }
        .toggleStyle(PaywallToggleButtonStyle())
        
        Toggle(
            isOn: .constant(true)
        ) {
            PaywallButtonContent(
                state: .init(
                    title: "Ежемесячно",
                    fullPrice: "1,99 $",
                    fullPriceSubtitle: "в месяц",
                    adPrice: "1,99 $ / месяц",
                    isSelected: false
                )
            )
        }
        .toggleStyle(PaywallToggleButtonStyle())
    }
    .padding(.horizontal, 32)
    .background(LunalitAsset.Assets.backgroundBlack.swiftUIColor)
}
