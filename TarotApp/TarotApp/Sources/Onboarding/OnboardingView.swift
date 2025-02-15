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
        case tomorrow
        case advice
        case zodiac
        
        var title: String.Localizable {
            switch self {
            case .tomorrow: .onboarding_title_what_lies
            case .advice: .onboarding_title_magical_advice
            case .zodiac: .onboarding_title_zodiac_signs
            }
        }
        
        var body: String.Localizable? {
            switch self {
            case .tomorrow, .zodiac: nil
            case .advice: .onboarding_subtitle_notifications
            }
        }
        
        func next() -> Self? {
            switch self {
            case .tomorrow: .advice
            case .advice: .zodiac
            case .zodiac: .tomorrow
            }
        }
        
        var index: Int {
            Self.allCases.firstIndex(of: self)!
        }
    }
    
    @State var state: Page = .tomorrow
    
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
            content(state: state)
                .animation(nil)

            Spacer()
            
            PageStarComponent(
                pages: Page.allCases.count,
                pageSelected: state.index
            )
                        
            Button(.localizable(.onboarding_button_continue)) {
                if let next = state.next() {
                    withAnimation {
                        state = next
                    }
                } else {
//                    store.send(.finish)
                }
            }
            .buttonStyle(.onboardingButton)
            .padding(.horizontal, 16)
            .frame(height: 110)
            
        })
        .background(
            background()
                .padding([.leading, .trailing, .top], 16)
                .padding(.bottom, 32)
        )
        
    }
    
    @ViewBuilder
    func background() -> some View {
        Image(asset: TarotAppAsset.Assets.onboardingCard)
            .resizable()
            .background()
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
    
    @ViewBuilder
    func content(state: Page) -> some View {
        image.resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.vertical, 16)
        
        Spacer()
        
        Text(localizable: state.title)
            .font(.system(size: 24, weight: .semibold))
            .multilineTextAlignment(.center)
            .foregroundStyle(TarotAppAsset.Assets.textWhite.swiftUIColor)

        Text(state.body.map { .localizable($0) } ?? "")
            .font(.system(.caption, weight: .bold))
            .multilineTextAlignment(.center)
            .foregroundStyle(TarotAppAsset.Assets.textWhite.swiftUIColor)
    }
    
    
    var image: Image {
        switch state {
        case .tomorrow: TarotAppAsset.Assets.onboardingHands1.swiftUIImage
        case .advice: TarotAppAsset.Assets.onboardingHands2.swiftUIImage
        case .zodiac: TarotAppAsset.Assets.onboardingHands3.swiftUIImage
        }
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
