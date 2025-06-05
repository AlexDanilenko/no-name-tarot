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
}
