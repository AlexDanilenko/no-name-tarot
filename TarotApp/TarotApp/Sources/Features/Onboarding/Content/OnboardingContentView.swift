//
//  ZodiacOnboardingView.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 25.02.2025.
//

import SwiftUI

struct OnboardingContentView: View {
    enum Page: CaseIterable {
        case tomorrow
        case zodiac
        case advice
    }
    
    @Binding var state: Page
    
    var body: some View {
        VStack {
            state.image.swiftUIImage.resizable()
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
            
            Spacer()
            
            PageStarComponent(
                pages: Page.allCases.count,
                pageSelected: state.index
            )
        }
    }
}

extension OnboardingContentView.Page {
    
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
        case .tomorrow: .zodiac
        case .zodiac: .advice
        case .advice: nil
        }
    }
    
    var image: TarotAppImages {
        switch self {
        case .tomorrow: TarotAppAsset.Assets.onboardingHands1
        case .advice: TarotAppAsset.Assets.onboardingHands2
        case .zodiac: TarotAppAsset.Assets.onboardingHands3
        }
    }
    
    var index: Int {
        Self.allCases.firstIndex(of: self)!
    }
}

#Preview {
    OnboardingContentView(state: .constant(.zodiac))
}
