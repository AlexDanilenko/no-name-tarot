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
    let cards: [TarotCard]
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(spacing: 16) {
                // Interest Selection Section
                interestSelectionSection(viewStore)
                
                // Insight Display Section
                insightDisplaySection(viewStore)
                
                Spacer()
            }
            .padding()
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
                        // ✅ Use combined action to prevent race conditions
                        viewStore.send(.selectInterestAndLoad(interest, cards: cards))
                    }
                }
            }
        }
    }
    
    // MARK: - Insight Display
    
    @ViewBuilder
    private func insightDisplaySection(_ viewStore: ViewStoreOf<Insights>) -> some View {
        VStack(spacing: 16) {
            if viewStore.isLoadingInsight {
                loadingStateView()
            } else if let insight = viewStore.loadedInsight {
                insightContentView(insight: insight, viewStore: viewStore)
            } else if viewStore.selectedInterest != nil {
                emptyStateView(viewStore: viewStore)
            }
        }
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
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThinMaterial)
        )
    }
    
    @ViewBuilder
    private func insightContentView(insight: Insights.Insight, viewStore: ViewStoreOf<Insights>) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(insight.interest.displayName)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button("Clear") {
                    viewStore.send(.clearSelection)
                }
                .font(.caption)
                .foregroundColor(.blue)
            }
            
            Text(insight.description)
                .font(.body)
                .foregroundColor(.white.opacity(0.9))
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
            
            if viewStore.canRetry {
                Button("Get New Insight") {
                    viewStore.send(.retry(cards: cards))
                }
                .font(.caption)
                .foregroundColor(.blue)
                .padding(.top, 4)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThinMaterial)
        )
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
                    viewStore.send(.retry(cards: cards))
                }
                .font(.caption)
                .foregroundColor(.blue)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThinMaterial)
        )
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
                selectedInterest: .love,
                loadedInsight: Insights.Insight(
                    interest: .love,
                    description: "The cards reveal a time of deep emotional connection and romantic possibility. Trust your heart and be open to new experiences in love."
                )
            ),
            reducer: { Insights() }
        ),
        cards: [.major(.theFool), .major(.theLovers), .major(.theSun)]
    )
    .background(Color.black)
} 