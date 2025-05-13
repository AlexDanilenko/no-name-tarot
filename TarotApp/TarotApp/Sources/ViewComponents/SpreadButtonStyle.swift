//
//  SpreadButtonStyle.swift
//  Lunalit
//
//  Created by Oleksandr Danylenko on 13.05.2025.
//

import SwiftUI

struct SpreadButtonStyle: ButtonStyle {
    let numberOfCards: Int
    
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            DeckLayout {
                ForEach(0..<numberOfCards, id: \.self) { idx in
                    let middleIndex = numberOfCards / 2
                    let realIndex = numberOfCards - abs(middleIndex - idx)
                    
                    Image(asset: LunalitAsset.Assets.Icons.card)
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 2)
                        .zIndex(Double(realIndex))
                        .frame(height: 22)
                }
            }
            
            configuration.label
        }
        .font(.caption.bold())
        .foregroundStyle(
            configuration.isPressed
            ? LunalitAsset.Assets.textWhite.swiftUIColor.opacity(0.7)
            : LunalitAsset.Assets.textWhite.swiftUIColor
        )
        .padding(12)
        .frame(maxWidth: .infinity)
        .background(
            .onboardingGradient
        )
        .cornerRadius(16)
    }
}

struct DeckLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout Void) -> CGSize {
        // accept the full proposed space, replacing any nil values with a sensible default
        proposal.replacingUnspecifiedDimensions()
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout Void) {

        for (index, subview) in subviews.enumerated() {
            let middleIndex = subviews.count / 2
            
            let realIndex = middleIndex - index
            
            var xPos: CGFloat = CGFloat(realIndex * 10)
            let yPos: CGFloat = CGFloat(abs(realIndex) * 6)
            
            let offset = (subview.sizeThatFits(.unspecified).height / 2)
            let point = CGPoint(
                x: bounds.midX + xPos,
                y: bounds.minY + offset + yPos
            )
            subview.place(
                at: point,
                anchor: .center,
                proposal: .unspecified
            )
        }
    }
}


#Preview(body: {
    HStack {
        Button {
            
        } label: {
            Text(.localizable(.three_card_spread))
        }
        .buttonStyle(SpreadButtonStyle(numberOfCards: 3))
        .frame(height: 80)
        
        Button {
            
        } label: {
            Text(.localizable(.five_cards_spread))
        }
        .buttonStyle(SpreadButtonStyle(numberOfCards: 5))
        .frame(height: 80)
    }
    
})
