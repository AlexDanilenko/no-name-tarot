//
//  PaywallButtonContent.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 13.04.2025.
//

import SwiftUI

struct PaywallButtonContent: View {
    struct ViewState: Equatable {
        let title: String
        let fullPrice: String
        let fullPriceSubtitle: String?
        let adPrice: String
        let isSelected: Bool
    }
    
    let state: ViewState
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(state.title)
                    .font(.system(size: 16, weight: .semibold))
                
                Text(state.fullPrice)
                    .font(.system(size: 14, weight: .light))
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 8) {
                Text(state.adPrice)
                    .font(.system(size: 16, weight: .semibold))
                if let subtitle = state.fullPriceSubtitle {
                    Text(subtitle)
                        .font(.system(size: 14, weight: .light))
                }
            }
        }
        
    }
}

#Preview {
    PaywallButtonContent(
        state: .init(
            title: "Ежемесячно",
            fullPrice: "1,99 $",
            fullPriceSubtitle: "в месяц",
            adPrice: "1,99 $ / месяц",
            isSelected: true
        )
    )
        .padding()
        .background(Color.yellow)
        .clipShape(Capsule())
}
