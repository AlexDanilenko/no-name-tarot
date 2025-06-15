//
//  InsightsView.swift
//  TarotApp
//
//  Created by Assistant on December 2024.
//

import SwiftUI
import ComposableArchitecture

struct InsightsView: View {
    let store: StoreOf<Insights>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            Group {
                if viewStore.isLoadingInsight {
                    loadingStateView()
                } else if let insight = viewStore.loadedInsight {
                    insightContentView(insight: insight, viewStore: viewStore)
                } else if viewStore.selectedInterest != nil {
                    emptyStateView(viewStore: viewStore)
                } else {
                    interestSelectionSection(viewStore)
                }
            }
            .padding()
            .rotatingGradientBackground(opacity: 0.4)
            .cornerRadius(14)
            .animatedGradientBorder(isPulsing: viewStore.isLoadingInsight)
            
        }
    }
    
    // MARK: - Interest Selection
    
    @ViewBuilder
    private func interestSelectionSection(_ viewStore: ViewStoreOf<Insights>) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("What would you like insight about?")
                .font(.headline)
                .foregroundColor(.white)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 8) {
                ForEach(Interest.allCases, id: \.self) { interest in
                    InterestButton(
                        interest: interest,
                        isSelected: viewStore.selectedInterest == interest,
                        isDisabled: viewStore.isLoadingInsight
                    ) {
                        viewStore.send(.selectInterestAndLoad(interest))
                    }
                }
            }
        }
    }
    
    // MARK: - Insight Display
    
    @ViewBuilder
    private func insightDisplaySection(_ viewStore: ViewStoreOf<Insights>) -> some View {
        
    }
    
    @ViewBuilder
    private func loadingStateView() -> some View {
        VStack(spacing: 12) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(1.2)
            
            Text("Consulting the cards...")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    private func insightContentView(insight: Insights.Insight, viewStore: ViewStoreOf<Insights>) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(insight.interest.displayName)
                    .font(.headline)
                
                Spacer()
                
                Image(systemName: insight.interest.systemIconName)
                    .font(.title2)
            }
            
            Text(insight.description)
                .font(.body)
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
        }
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    private func emptyStateView(viewStore: ViewStoreOf<Insights>) -> some View {
        VStack(spacing: 12) {
            Image(systemName: "sparkles")
                .font(.largeTitle)
                .foregroundColor(.white.opacity(0.6))
            
            Text("No insight available")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
            
            if viewStore.canRetry {
                Button("Try Again") {
                    viewStore.send(.retry)
                }
                .font(.caption)
                .foregroundColor(.blue)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Interest Button Component

struct InterestButton: View {
    let interest: Interest
    let isSelected: Bool
    let isDisabled: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: interest.systemIconName)
                    .font(.title2)
                    .foregroundColor(isSelected ? .black : .white)
                
                Text(interest.displayName)
                    .font(.caption)
                    .foregroundColor(isSelected ? .black : .white)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? .white : .white.opacity(0.1))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        isSelected ? .clear : .white.opacity(0.3),
                        lineWidth: 1
                    )
            )
        }
        .disabled(isDisabled)
        .opacity(isDisabled ? 0.6 : 1.0)
        .animation(.easeInOut(duration: 0.2), value: isSelected)
        .animation(.easeInOut(duration: 0.2), value: isDisabled)
    }
}

// MARK: - Preview

#Preview {
    InsightsView(
        store: Store(
            initialState: Insights.State(
                cards: [.major(.theFool), .major(.theLovers), .major(.theSun)],
                selectedInterest: .love,
                loadedInsight: Insights.Insight(
                    interest: .love,
                    description: "The cards reveal a time of deep emotional connection and romantic possibility. Trust your heart and be open to new experiences in love."
                )
            ),
            reducer: { Insights() }
        )
    )
    .background(Color.black)
} 
