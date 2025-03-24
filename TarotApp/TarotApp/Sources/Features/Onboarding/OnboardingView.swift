//
//  OnboardingView.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 10.11.2024.
//

import SwiftUI
import ComposableArchitecture

struct OnboardingView: View {

    @State var state: OnboardingContentView.Page = .tomorrow
    
    let store: StoreOf<Onboarding>
    
    var body: some View {
        NavigationView(content: {
            page()
                .background(
                    TarotAppAsset.Assets.backgroundBlack.swiftUIColor
                )
        })
    }
    
    @ViewBuilder
    func page() -> some View {
        VStack(spacing: 16, content: {
            OnboardingContentView(state: $state)
                        
            Button(.localizable(.onboarding_button_continue)) {
                if let next = state.next() {
                    withAnimation {
                        state = next
                    }
                } else {
                    store.send(.finish)
                }
            }
            .buttonStyle(.onboardingButton)            
        })
        .background(
            OnboardingBackgroundView()
        )
        .padding([.leading, .trailing, .top], 16)
        .padding(.bottom, 32)
    }
}

#Preview {
    OnboardingView(
        store: .init(
            initialState: Onboarding.State(),
            reducer: {
                Onboarding()
            }
        )
    )
}
