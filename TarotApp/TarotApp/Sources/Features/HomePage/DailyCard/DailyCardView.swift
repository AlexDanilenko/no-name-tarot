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
            VStack(alignment: .center, spacing: 0) {
                switch viewStore.state {
                case .loading:
                    ProgressView()
                        .controlSize(.large)
                        .frame(maxWidth: .infinity, minHeight: 100)
                        .background(.ultraThinMaterial)
                case .loaded(let day):
                    Image(asset: day.card.asset)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 240)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(.top, 16)
                        .shadow(radius: 5, x: 0, y: 5)
                                        
                    Text(day.card.localizedTitle)
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 12)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(day.desciption)
                        .foregroundStyle(.white)
                        .lineLimit(3)
                        .font(.subheadline)
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity)
                }
            }
            .background(.ultraThinMaterial)
            .background(LunalitAsset.Assets.backgroundDarkBlue.swiftUIColor)
            .clipShape(.rect(cornerRadius: 25))
        }
    }
}

#Preview {
    
    DailyCardView(
        store: .init(
            initialState: .loaded(
                DailyCard.State.Day(
                    date: Date(),
                    card: .major(.death),
                    desciption: "Lorem ipsum dolor sit amet asdfasfsdafasdfdafsg sdfgsdfg sdfg dfsg sdf gsdf gsdf",
                    advice: "Lorem ipsum dolor sit amet asdfasfsdafasdfdafsg sdfgsdfg sdfg dfsg sdf gsdf gsdf"
                )
            ),
            reducer: {
        DailyCard()
    }))
    .padding(16)
    .background(LunalitAsset.Assets.backgroundBlack.swiftUIColor)
}
