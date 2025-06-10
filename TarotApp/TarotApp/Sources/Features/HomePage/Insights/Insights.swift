//
//  Insights.swift
//  TarotApp
//
//  Created by Assistant on December 2024.
//

import ComposableArchitecture
import Foundation

// MARK: - Timeout Utilities

/// Error thrown when an operation times out
struct TimeoutError: Error {}

/// Executes an async operation with a timeout
/// - Parameters:
///   - seconds: Maximum time to wait in seconds
///   - operation: The async operation to execute
/// - Throws: `TimeoutError` if the operation doesn't complete within the timeout
func withTimeout<T>(seconds: Double, operation: @escaping () async throws -> T) async throws -> T {
    try await withThrowingTaskGroup(of: T.self) { group in
        // Add the main operation
        group.addTask {
            try await operation()
        }
        
        // Add the timeout task
        group.addTask {
            try await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
            throw TimeoutError()
        }
        
        // Return the first completed task and cancel the others
        defer { group.cancelAll() }
        return try await group.next()!
    }
}

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
        case selectInterestAndLoad(Interest, cards: [TarotCard])  // ✅ Combined action to prevent race conditions
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
                return .cancel(id: "insight-loading")  // ✅ Cancel any ongoing loading when selecting new interest
                
            case .loadInsight(let interest, let cards):
                state.isLoadingInsight = true
                return .run { send in
                    // ✅ Add timeout protection to prevent hanging requests
                    do {
                        try await withTimeout(seconds: 30) {
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
                        }
                    } catch is TimeoutError {
                        await send(.insightFailed(.networkError))
                    } catch {
                        await send(.insightFailed(.networkError))
                    }
                }
                .cancellable(id: "insight-loading")  // ✅ Add cancellation ID
                
            case .insightLoaded(let insight):
                state.loadedInsight = insight
                state.isLoadingInsight = false
                state.retryCount = 0
                // ✅ Ensure task is properly cleaned up after successful load
                return .cancel(id: "insight-loading")
                
            case .insightFailed(let error):
                state.isLoadingInsight = false
                
<<<<<<< HEAD
                // If we've reached max retries, don't try again
                if state.retryCount >= State.maxRetryCount, error != .maxRetriesReached {
                    return .send(.insightFailed(.maxRetriesReached))
=======
                // Only increment retry count for actual failures, not max retries reached
                if error != .maxRetriesReached {
                    state.retryCount += 1
>>>>>>> origin/develop
                }
                
                // ✅ Cancel any ongoing tasks to prevent memory leaks
                // This ensures proper cleanup on error states
                return .cancel(id: "insight-loading")
                
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
                return .cancel(id: "insight-loading")  // ✅ Cancel any ongoing loading
                
            case .selectInterestAndLoad(let interest, let cards):
                // ✅ Combined atomic action to prevent race conditions
                state.selectedInterest = interest
                state.isLoadingInsight = true
                state.loadedInsight = nil
                state.retryCount = 0
                
                return .run { send in
                    // ✅ Add timeout protection to prevent hanging requests
                    do {
                        try await withTimeout(seconds: 30) {
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
                        }
                    } catch is TimeoutError {
                        await send(.insightFailed(.networkError))
                    } catch {
                        await send(.insightFailed(.networkError))
                    }
                }
                .cancellable(id: "insight-loading", cancelInFlight: true)  // ✅ Cancel previous requests
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
