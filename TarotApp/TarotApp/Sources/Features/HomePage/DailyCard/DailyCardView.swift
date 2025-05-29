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
    
    @State var isExpanded: Bool = false
    
    var body: some View {
        
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                switch viewStore.state {
                case .loading:
                    ProgressView()
                        .controlSize(.large)
                        .frame(maxWidth: .infinity, minHeight: 100)
                        .frame(height: 400)
                        .background(.ultraThinMaterial)
                case .loaded(let day):
                    VStack(spacing: 0) {
                        VStack {
                            Spacer()
                            
                            VStack(spacing: 0) {
                                Text(day.card.localizedTitle)
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                                    .bold()
                                    .padding(.top, 48)
                                    .padding(.horizontal, 16)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text(day.desciption)
                                    .foregroundStyle(.white)
                                    .lineLimit(isExpanded ? nil : 2)
                                    .font(.subheadline)
                                    .padding(.top, 8)
                                    .padding(.bottom, 16)
                                    .padding(.horizontal, 16)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .background(
                                EmptyView()
                                    .background(
                                        .ultraThinMaterial
                                    )
                                    .mask {
                                        LinearGradient(
                                            colors: [
                                                Color.white,
                                                Color.white,
                                                Color.white.opacity(0)
                                            ],
                                            startPoint: .bottom,
                                            endPoint: .top
                                        )
                                    }
                            )
                        }
                        .frame(height: isExpanded ? 600 : 400)
                        .background(
                            Image(asset: day.card.asset)
                                .resizable()
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .shadow(radius: 5, x: 0, y: 5)
                                .frame(maxHeight: .infinity)
                        )
                        .clipShape(.rect(cornerRadius: 25))
                        .shadow(radius: 8)
                        
                        if isExpanded {
                            VStack(spacing: 0) {
                                Text(day.adviceTitle)
                                    .foregroundStyle(.white)
                                    .font(.title)
                                    .bold()
                                    .padding(.top, 8)
                                    .padding(.horizontal, 16)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text(day.advice)
                                    .foregroundStyle(.white)
                                    .lineLimit(nil)
                                    .font(.body)
                                    .padding(.top, 8)
                                    .padding(.horizontal, 16)
                                    .padding(.bottom, 48)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                
                            }
                        }
                    }
                case .error(let message):
                    VStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                            .padding()
                        
                        Text("Failed to load daily card")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text(message)
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Button(action: {
                            store.send(.load)
                        }) {
                            Text("Try Again")
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                    }
                    .frame(maxWidth: .infinity, minHeight: 100)
                    .frame(height: 400)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            .overlay(
                Button {
                    isExpanded.toggle()
                } label: {
                    Label(
                        title: {
                            Text(
                                .localizable(
                                    isExpanded
                                    ? .hide_button_title
                                    : .reveal_button_title
                                )
                            )
                        },
                        icon: {
                            Image(systemName: isExpanded ? "arrow.up" :  "arrow.down")
                        }
                    )
                    .font(.body.bold())
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .tint(LunalitAsset.Assets.Yellow.paywall1.swiftUIColor)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .shadow(radius: 4, x: 0, y: 4)
                .padding(8)
            )
            .background(LunalitAsset.Assets.backgroundDarkBlue.swiftUIColor)
            .clipShape(.rect(cornerRadius: 25))
        }
    }
}

#Preview {
    
    ScrollView {
        DailyCardView(
            store: .init(
                initialState: .loaded(
                    DailyCard.State.Day(
                        date: Date(),
                        card: .major(.death),
                        desciption: "Lorem ipsum dolor sit amet asdfasfsdafasdfdafsg sdfgsdfg sdfg dfsg sdf gsdf gsdf asdfasfsdafasdfdafsg sdfgsdfg sdfg dfsg sdf gsdf gsdf asdfasfsdafasdfdafsg sdfgsdfg sdfg dfsg sdf gsdf gsdf",
                        adviceTitle: "Lorem ipsum",
                        advice: "Lorem ipsum dolor sit amet asdfasfsdafasdfdafsg sdfgsdfg sdfg dfsg sdf gsdf gsdf"
                    )
                ),
                reducer: {
            DailyCard()
        }))
        .padding(16)
    }
    .background(LunalitAsset.Assets.backgroundBlack.swiftUIColor)
}
