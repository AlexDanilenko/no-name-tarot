//
//  LearnCardDetailView.swift
//  TarotApp
//
//  Created by Assistant on 2025.
//

import SwiftUI
import ComposableArchitecture

struct LearnCardDetailView: View {
    @Bindable var store: StoreOf<LearnCardDetail>
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Card Image
                Image(asset: store.card.asset)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(radius: 8)
                
                
                VStack(spacing: 16) {
//                    // Card Title
//                    Text(localizable: store.card.localizationKey)
//                        .font(.title.weight(.bold))
//                        .foregroundStyle(.white)
//                        .multilineTextAlignment(.center)
                    
                    // Card Description
                    VStack(alignment: .leading, spacing: 8) {
                        Text(localizable: .card_meaning_title)
                            .font(.headline.weight(.semibold))
                            .foregroundStyle(.white)
                        
                        Text(store.card.description)
                            .font(.body)
                            .foregroundStyle(.white.opacity(0.9))
                            .lineLimit(nil)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Card Prediction/Recommendation
                    VStack(alignment: .leading, spacing: 8) {
                        Text(localizable: .card_guidance_title)
                            .font(.headline.weight(.semibold))
                            .foregroundStyle(.white)
                        
                        Text(store.card.prediction)
                            .font(.body)
                            .foregroundStyle(.white.opacity(0.9))
                            .lineLimit(nil)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 20)
            }
            .padding(.vertical, 20)
        }
        .background(
            LinearGradient(
                colors: [
                    LunalitAsset.Assets.backgroundBlack.swiftUIColor,
                    LunalitAsset.Assets.buttonColorPurpleDark.swiftUIColor,
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(.localizable(store.card.localizationKey))
        .toolbarBackground(LunalitAsset.Assets.buttonColorPurpleDark.swiftUIColor, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    NavigationView {
        LearnCardDetailView(
            store: Store(
                initialState: LearnCardDetail.State(card: .major(.theFool)),
                reducer: { LearnCardDetail() }
            )
        )
    }
} 
