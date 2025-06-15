//
//  PageStarComponent.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 15.02.2025.
//

import SwiftUI

struct PageStarComponent: View, Animatable {
    @State var pages: Int
    var pageSelected: Int
    
    var body: some View {
        HStack(content: {
            ForEach(0..<pages, id: \.self) { idx in
                PageStar(isSelected: idx == pageSelected)
            }
        })
    }
}

struct PageStar: View, Animatable {
    var animatableData: Bool {
        get { isSelected }
        set { isSelected = newValue }
    }
    
    var isSelected: Bool
    
    var body: some View {
        Image(asset: LunalitAsset.Assets.starSmall)
            .resizable()
            .renderingMode(.template)
            .foregroundStyle(
                isSelected 
                ? LunalitAsset.Assets.starSelected.swiftUIColor
                : LunalitAsset.Assets.starDeselected.swiftUIColor
            )
            .scaleEffect(isSelected ? 1.2 : 1)
            .frame(width: 24, height: 24)
    }
}

#Preview {
    PageStarComponent(pages: 3, pageSelected: 2)
}
