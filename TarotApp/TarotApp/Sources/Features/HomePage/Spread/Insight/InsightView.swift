//
//  InsightView.swift
//  Lunalit
//
//  Created by Oleksandr Danylenko on 15.05.2025.
//

import SwiftUI
import ComposableArchitecture

struct InsightView: View {
    let store: StoreOf<Spread>
    @State private var isInsightRevealed = false
    
    var body: some View {
        VStack(spacing: 16) {
            if store.isLoadingInsight {
                ProgressView()
                    .tint(.white)
                    .scaleEffect(1.5)
                    .frame(maxWidth: .infinity, minHeight: 120)
            } else if let insight = store.loadedInsight {
                VStack(spacing: 16) {
                    if isInsightRevealed {
                        Text(insight.description)
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.leading)
                            .transition(.move(edge: .top).combined(with: .opacity))
                    } else {
                        Button {
                            withAnimation(.spring()) {
                                isInsightRevealed = true
                            }
                        } label: {
                            Text(.localizable(.reveal_insight))
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(LunalitAsset.Assets.purpleLight1.swiftUIColor)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                    }
                    
                    Button {
                        withAnimation {
                            isInsightRevealed = false
                            store.send(.retryInsight)
                        }
                    } label: {
                        Label {
                            Text(.localizable(.try_another_interest))
                        } icon: {
                            Image(systemName: "arrow.trianglepath")
                        }
                        .font(.subheadline.bold())
                        .foregroundStyle(LunalitAsset.Assets.purpleLight1.swiftUIColor)
                    }
                }
            }
        }
        .padding(16)
    }
} 