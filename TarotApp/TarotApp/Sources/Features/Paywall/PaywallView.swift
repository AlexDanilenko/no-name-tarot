//
//  PaywallView.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 29.03.2025.
//

import SwiftUI
import ComposableArchitecture

struct PaywallView: View {
    var store: StoreOf<Paywall>
    
    var body: some View {
        VStack {
            Spacer()
            
//            Button
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(backgroundView)
    }
    
    @ViewBuilder
    var backgroundView: some View {
        TarotAppAsset.Assets.paywallCards.swiftUIImage
            .resizable()
            .aspectRatio(contentMode: .fill)
            .padding(.vertical, 100)
            .mask({
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: .white.opacity(1), location: 0),
                        Gradient.Stop(color: .white.opacity(0), location: 0.75),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            })
            .background(
                LinearGradient(
                    colors: [
                        TarotAppAsset.Assets.backgroundBlack.swiftUIColor,
                        TarotAppAsset.Assets.backgroundBlack.swiftUIColor,
                        TarotAppAsset.Assets.buttonColorPurpleDark.swiftUIColor,
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
    }
}

#Preview {
    PaywallView(
        store: .init(
            initialState: Paywall.State(
                subscriptions: .init(
                    weekly: .init(id: UUID(), price: 0.99, isTrial: true),
                    montly: .init(id: UUID(), price: 1.99, isTrial: false),
                    yearly: .init(id: UUID(), price: 11.99, isTrial: false)
                )
            ),
            reducer: {
        Paywall()
    }))
}
