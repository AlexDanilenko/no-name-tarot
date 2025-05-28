//
//  PaywallView.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 29.03.2025.
//

import SwiftUI
import ComposableArchitecture

struct PaywallView: View {
    @Bindable var store: StoreOf<Paywall>
    
    struct ViewState: Equatable {
        let first: PaywallButtonContent.ViewState
        let second: PaywallButtonContent.ViewState
        let third: PaywallButtonContent.ViewState
    }
    
    var body: some View {
        VStack {
            HStack {}
                .frame(height: 100)
            
            VStack {
                Text(.localizable(.paywall_header_title))
                    .font(.system(size: 36, weight: .bold))
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Image(asset: LunalitAsset.Assets.Icons.moon)
                        .resizable()
                        .frame(width: 22, height: 22)
                        .shadow(radius: 3)
                        .padding(10)
                        .offset(y: -2)
                        .background(LunalitAsset.Assets.purpleLight3.swiftUIColor)
                        .clipShape(Circle())
                    
                    
                    ZStack {
                        Image(asset: LunalitAsset.Assets.Icons.card)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                            .rotationEffect(.degrees(25))
                            .offset(x: 5, y: 4)
                        Image(asset: LunalitAsset.Assets.Icons.card)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                            .rotationEffect(.degrees(-25))
                            .offset(x: -5, y: 4)
                        Image(asset: LunalitAsset.Assets.Icons.card)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                            .offset(y: -2)
                    }
                    .shadow(radius: 3)
                    .padding(10)
                    .offset(y: -2)
                    .background(LunalitAsset.Assets.purpleLight3.swiftUIColor)
                    .clipShape(Circle())
                    
                    Text("paywall_header_subtitle")
                        .font(.system(size: 12, weight: .semibold))
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
            }
            .padding(.horizontal, 16)
            
            Spacer()
            
            WithViewStore(store) { state in
                PaywallView.ViewState(state: state)
            } content: { viewStore in
                Toggle(
                    isOn: .init(
                        get: {
                            viewStore.first.isSelected
                        },
                        set: { _ in
                            viewStore.send(.select(option: .first))
                        }
                    )
                ) {
                    PaywallButtonContent(state: viewStore.first)
                }
                
                Toggle(
                    isOn: .init(
                        get: {
                            viewStore.second.isSelected
                        },
                        set: { _ in
                            viewStore.send(.select(option: .second))
                        }
                    )
                ) {
                    PaywallButtonContent(state: viewStore.second)
                }

                Toggle(
                    isOn: .init(
                        get: {
                            viewStore.third.isSelected
                        },
                        set: { _ in
                            viewStore.send(.select(option: .third))
                        }
                    )
                ) {
                    PaywallButtonContent(state: viewStore.third)
                }
            }
            .toggleStyle(.paywallButton)
            .padding(.horizontal, 16)
                        
            Button(action: {
                store.send(.subscribe)
            }, label: {
                VStack(spacing: 4) {
                    Text(localizable: .paywall_button_title)
                        .font(.title2.bold())
                    Text(localizable: .paywall_button_subtitle)
                        .font(.caption2)
                        .opacity(0.7)
                        .padding(.bottom, 32)
                }
            })
            .buttonStyle(.onboardingButton)
        }
        
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(backgroundView)
            .ignoresSafeArea(edges: .bottom)
            .alert($store.scope(state: \.alert, action: \.alert))
            .onAppear {
                store.send(.start)
            }
    }
    
    @ViewBuilder
    var backgroundView: some View {
        LunalitAsset.Assets.paywallCards.swiftUIImage
            .resizable()
            .aspectRatio(contentMode: .fill)
            .padding(.vertical, 100)
            .mask({
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: .white.opacity(1), location: 0),
                        Gradient.Stop(color: .white.opacity(0), location: 0.75),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            })
            .background(
                LinearGradient(
                    colors: [
                        LunalitAsset.Assets.backgroundBlack.swiftUIColor,
                        LunalitAsset.Assets.backgroundBlack.swiftUIColor,
                        LunalitAsset.Assets.buttonColorPurpleDark.swiftUIColor,
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
    }
}

#Preview {
    PaywallView(
        store: .init(
            initialState: Paywall.State(
                subscriptions: .init(
                    first: .weekly1,
                    second: .monthly1,
                    third: .yearly1
                )
            ),
            reducer: {
                Paywall()
            }
        )
    )
}

extension Paywall.State.Subscriptions.Option {
  /// Convert our TCA state into the UI’s ViewState
  var viewState: PaywallButtonContent.ViewState {
    .init(
      title: description,
      fullPrice: price.formatted(.currency(code: "USD")),
      fullPriceSubtitle: adDescription,     // String? → String?
      adPrice: adPrice.map { $0.formatted(.currency(code: "USD")) } ?? "",
      isSelected: isSelected
    )
  }
}

// 2) Build the PaywallView.ViewState from the full reducer state
extension PaywallView.ViewState {
  /// Initialize from your Paywall reducer’s State
  init(state: Paywall.State) {
    let subs = state.subscriptions
    self.init(
      first:  subs.first.viewState,
      second: subs.second.viewState,
      third:  subs.third.viewState
    )
  }
}
