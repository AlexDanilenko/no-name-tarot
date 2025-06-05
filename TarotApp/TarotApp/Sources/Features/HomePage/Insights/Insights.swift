//
//  Insights.swift
//  TarotApp
//
//  Created by Assistant on December 2024.
//

import ComposableArchitecture
import Foundation

@Reducer
struct Insights {
    @ObservableState
    struct State: Equatable {
        /// Currently selected interest for which we load insight.
        var selectedInterest: Interest?
        
        /// Loaded insight returned from GPT API.
        var loadedInsight: Insight?
        
        /// Indicates that insight is loading and should show progress.
        var isLoadingInsight: Bool = false
        
        /// Number of retry attempts for failed insights.
        var retryCount: Int = 0
        
        /// Maximum number of retries allowed.
        static let maxRetryCount = 3
    }
    
    struct Insight: Equatable {
        let interest: Interest
        let description: String
    }
    
    enum Action {
        case selectInterest(Interest)
        case loadInsight(Interest, cards: [TarotCard])
        case insightLoaded(Insight)
        case insightFailed(InsightsError)
        case retry(cards: [TarotCard])
        case clearSelection
    }
    
    enum InsightsError: Error, Equatable {
        case networkError
        case apiError(String)
        case maxRetriesReached
        case invalidResponse
    }
    
    @Dependency(\.gptAPIClient) var gptAPIClient
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .selectInterest(let interest):
                state.selectedInterest = interest
                state.isLoadingInsight = false
                state.loadedInsight = nil
                state.retryCount = 0
                return .none
                
            case .loadInsight(let interest, let cards):
                state.isLoadingInsight = true
                return .run { send in
                    do {
                        if let result = try await gptAPIClient.getSpreadInsight(
                            .insight(for: interest, cards: cards)
                        ) {
                            await send(
                                .insightLoaded(
                                    Insight(interest: interest, description: result.description)
                                )
                            )
                        } else {
                            await send(.insightFailed(.invalidResponse))
                        }
                    } catch {
                        await send(.insightFailed(.networkError))
                    }
                }
                
            case .insightLoaded(let insight):
                state.loadedInsight = insight
                state.isLoadingInsight = false
                state.retryCount = 0
                return .none
                
            case .insightFailed(let error):
                state.isLoadingInsight = false
                
                // Only increment retry count for actual failures, not max retries reached
                if error != .maxRetriesReached {
                    state.retryCount += 1
                }
                
                // Don't send another action when max retries reached - just update state
                // This prevents the infinite cycle
                return .none
                
            case .retry(let cards):
                guard let selectedInterest = state.selectedInterest else {
                    return .none
                }
                
                // Check if we've reached max retries
                if state.retryCount >= State.maxRetryCount {
                    return .send(.insightFailed(.maxRetriesReached))
                }
                
                return .send(.loadInsight(selectedInterest, cards: cards))
                
            case .clearSelection:
                state.selectedInterest = nil
                state.loadedInsight = nil
                state.isLoadingInsight = false
                state.retryCount = 0
                return .none
            }
        }
    }
}

// MARK: - Helper Extensions

extension Insights.State {
    /// Whether we can retry loading an insight
    var canRetry: Bool {
        !isLoadingInsight && retryCount < Self.maxRetryCount
    }
    
    /// Whether we have a valid insight to display
    var hasValidInsight: Bool {
        loadedInsight != nil && !isLoadingInsight
    }
}

extension Insights.InsightsError {
    var localizedDescription: String {
        switch self {
        case .networkError:
            return "Network connection failed. Please check your internet connection."
        case .apiError(let message):
            return "API Error: \(message)"
        case .maxRetriesReached:
            return "Maximum retry attempts reached. Please try again later."
        case .invalidResponse:
            return "Invalid response received. Please try again."
        }
    }
} 