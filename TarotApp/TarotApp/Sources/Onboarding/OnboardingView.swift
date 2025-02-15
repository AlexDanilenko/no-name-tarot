//
//  OnboardingView.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 10.11.2024.
//

import SwiftUI
import ComposableArchitecture

struct OnboardingView: View {
    
    enum Page: CaseIterable {
        case daily
        case three
        case readCards
        
        var title: String.Localizable {
            switch self {
            case .daily: .onboarding_card_of_the_day_title
            case .three: .onboarding_three_card_title
            case .readCards: .onboarding_read_cards_title
            }
        }
        
        var body: String.Localizable {
            switch self {
            case .daily: .onboarding_card_of_the_day_body
            case .three: .onboarding_three_card_body
            case .readCards: .onboarding_read_cards_body
            }
        }
        
        func next() -> Self? {
            switch self {
            case .daily: .three
            case .three: .readCards
            case .readCards: nil
            }
        }
    }
    
    @State var state: Page = .daily
    let store: StoreOf<Onboarding>
    
    var body: some View {
        NavigationView(content: {
            page()
                .toolbar {
                    Button(.localizable(.onboarding_skip)) {
                        store.send(.skip)
                    }
                    .foregroundStyle(Color("purple_light_2"))
                }
        })
    }
    
    
    @ViewBuilder
    func page() -> some View {
        VStack(spacing: 16, content: {
            
            switch state {
            case .daily:
                content(state: state)
                    .transition(.push(from: .trailing))
            case .three:
                content(state: state)
                    .transition(.push(from: .trailing))
            case .readCards:
                content(state: state)
                    .transition(.push(from: .trailing))
            }
            
            Spacer()
                        
            Button(.localizable(.onboarding_button_continue)) {
                if let next = state.next() {
                    withAnimation {
                        state = next
                    }
                } else {
                    store.send(.finish)
                }
            }.buttonStyle(.onboardingButton)
        })
        .background(background())
        .padding(16)
    }
    
    @ViewBuilder
    func background() -> some View {
        Image(asset: TarotAppAsset.Assets.onboardingTarotCard)
            .resizable()
    }
    
    @ViewBuilder
    func content(state: Page) -> some View {
        Text(localizable: state.title)
            .font(.system(.largeTitle, weight: .bold))
            .multilineTextAlignment(.center)
            .foregroundStyle(Color("purple_light_2"))
        
        Text(localizable: state.body)
            .font(.system(.caption, weight: .bold))
            .multilineTextAlignment(.center)
            .foregroundStyle(Color("purple_light_2"))
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
