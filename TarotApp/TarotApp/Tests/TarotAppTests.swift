import XCTest
import ComposableArchitecture
@testable import Lunalit

@MainActor
final class TarotAppTests: XCTestCase {    
    func test_selectInterestLoadsInsight() async {
        let insight = OpenAISpreadInsight(description: "Test Insight")
        let store = TestStore(initialState: Spread.State(
            content: .threeMock,
            insight: .finance,
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

        // Test selecting an interest
        await store.send(.selectInterest(.love)) { state in
            state.selectedInterest = .love
            state.isLoadingInsight = true
        }
        
        await store.receive(\.loadInsight)
        
        // Wait for async effect to complete
        await store.receive(\.loadedInsight) { state in
            state.loadedInsight = Spread.State.Insight(
                interest: .love,
                description: insight.description
            )
            state.isLoadingInsight = false
        }
    }
}
