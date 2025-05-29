//
//  InterestsListView.swift
//  Lunalit
//
//  Created by Oleksandr Danylenko on 15.05.2025.
//

import SwiftUI
import ComposableArchitecture

struct InterestsListView: View {
    let store: StoreOf<Spread>
    
    var body: some View {
        VStack(spacing: 16) {
            Text(.localizable(.spread_ai_tarot))
                .font(.subheadline.bold())
                .foregroundStyle(LunalitAsset.Assets.purpleLight1.swiftUIColor)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(.localizable(.spread_select_interest))
                .foregroundStyle(.white)
                .multilineTextAlignment(.leading)
                .font(.title3.weight(.heavy))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 12) {
                ForEach(Spread.State.Interest.allCases, id: \.self) { interest in
                    Button {
                        store.send(.selectInterest(interest))
                    } label: {
                        InterestCell(interest: interest, isSelected: store.selectedInterest == interest)
                    }
                }
            }
        }
        .padding(16)
    }
}

private struct InterestCell: View {
    let interest: Spread.State.Interest
    let isSelected: Bool
    
    var body: some View {
        HStack {
            Image(asset: interest.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            
            Text(interest.title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
            
            Spacer()
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(isSelected ? LunalitAsset.Assets.purpleLight1.swiftUIColor : LunalitAsset.Assets.backgroundVibrantDarkBlue.swiftUIColor)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

private extension Spread.State.Interest {
    var icon: ImageAsset {
        switch self {
        case .love:
            LunalitAsset.Assets.Interests.love
        case .money:
            LunalitAsset.Assets.Interests.money
        case .career:
            LunalitAsset.Assets.Interests.career
        case .finance:
            LunalitAsset.Assets.Interests.finance
        case .relations:
            LunalitAsset.Assets.Interests.relations
        case .situations:
            LunalitAsset.Assets.Interests.situations
        case .spiritual:
            LunalitAsset.Assets.Interests.spiritual
        }
    }
    
    var title: LocalizedStringKey {
        switch self {
        case .love:
            .localizable(.interest_love)
        case .money:
            .localizable(.interest_money)
        case .career:
            .localizable(.interest_career)
        case .finance:
            .localizable(.interest_finance)
        case .relations:
            .localizable(.interest_relations)
        case .situations:
            .localizable(.interest_situations)
        case .spiritual:
            .localizable(.interest_spiritual)
        }
    }
} 