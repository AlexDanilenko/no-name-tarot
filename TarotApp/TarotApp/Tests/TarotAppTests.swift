import XCTest
import ComposableArchitecture
@testable import Lunalit

@MainActor
final class TarotAppTests: XCTestCase {    
    func test_selectInterestLoadsInsight() async {
        let insight = OpenAISpreadInsight(description: "Test Insight")
        let store = TestStore(initialState: Spread.State(
            content: CardsSpread.State.threeMock,
            numberOfTries: 0
        )) {
            Spread()
        } withDependencies: {
            $0.gptAPIClient = GPTApiClient(
                getDailyCard: { _ in fatalError("not implemented")},
                getDay: { _ in fatalError("not implemented") },
                getSpreadInsight: { _ in insight }
            )
        }

        // Test selecting an interest through the insights reducer
        await store.send(.insights(.selectInterest(.love))) { state in
            state.insights.selectedInterest = .love
            state.insights.isLoadingInsight = false
            state.insights.loadedInsight = nil
            state.insights.retryCount = 0
        }
        
        // Test loading insight for the selected interest
        await store.send(.insights(.loadInsight(.love, cards: [.major(.theFool), .major(.theLovers), .major(.theSun)]))) { state in
            state.insights.isLoadingInsight = true
        }
        
        // Wait for async effect to complete
        await store.receive(\.insights.insightLoaded) { state in
            state.insights.loadedInsight = Insights.Insight(
                interest: .love,
                description: insight.description
            )
            state.insights.isLoadingInsight = false
            state.insights.retryCount = 0
        }
    }
    
    /// Test for Bug #001: Verify retryCount increment behavior (prevents infinite cycle)
    func test_retryCountIncrementBehavior() async {
        let store = TestStore(initialState: Insights.State()) {
            Insights()
        }
        
        // Test 1: Regular network error should increment retryCount
        await store.send(.insightFailed(.networkError)) { state in
            state.retryCount = 1
        }
        
        // Test 2: Another regular error should increment again
        await store.send(.insightFailed(.invalidResponse)) { state in
            state.retryCount = 2
        }
        
        // Test 3: ✅ BUG FIX - maxRetriesReached should NOT increment retryCount  
        await store.send(.insightFailed(.maxRetriesReached))
        // No state change block = expecting no state changes (this was the bug!)
        
        // Test 4: Multiple maxRetriesReached should still not increment
        await store.send(.insightFailed(.maxRetriesReached))
        // Still no state changes expected
        
        // Test 5: Regular errors should still increment after maxRetriesReached
        await store.send(.insightFailed(.networkError)) { state in
            state.retryCount = 3
        }
        
        // Final verification: retryCount should be 3 (not higher due to maxRetriesReached)
        XCTAssertEqual(store.state.retryCount, 3)
    }

}
