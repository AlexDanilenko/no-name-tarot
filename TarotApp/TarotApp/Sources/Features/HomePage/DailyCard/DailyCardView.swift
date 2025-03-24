//
//  DailyCardView.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 08.12.2024.
//

import SwiftUI
import ComposableArchitecture

struct DailyCardView: View {
    var store: StoreOf<DailyCard>
    
    var body: some View {
        
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(alignment: .leading, spacing: 0) {
                switch viewStore.state {
                case .loading:
                    ProgressView()
                        .controlSize(.large)
                        .frame(maxWidth: .infinity, minHeight: 100)
                        .background(.ultraThinMaterial)
                case .loaded(let day):
                    Text(day.card.rawValue)
                        .foregroundStyle(.white)
                        .font(.title2)
                        .bold()
                        .padding(8)
                        .frame(maxWidth: .infinity)
                    
                    Text(day.desciption)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                        .padding(16)
                        .frame(maxWidth: .infinity)
                        .background(.ultraThinMaterial)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 25))
        }
    }
}
