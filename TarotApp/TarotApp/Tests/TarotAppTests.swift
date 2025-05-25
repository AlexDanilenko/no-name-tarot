import XCTest
import ComposableArchitecture
@testable import Lunalit

final class TarotAppTests: XCTestCase {
    func test_onAppearRandomizesCards() async {
        let store = TestStore(initialState: Spread.State(
            content: .threeMock,
            insight: .finance,
            numberOfTries: 0
        )) {
            Spread()
        }

        let before = store.state.content
        await store.send(.onAppear)
        XCTAssertNotEqual(before, store.state.content)
    }

    func test_selectInterestLoadsInsight() async {
        let expected = Spread.State.Insight(interest: .love, description: "Insight")

        let store = TestStore(initialState: Spread.State(
            content: .threeMock,
            insight: .love,
            numberOfTries: 0
        )) {
            Spread()
        } withDependencies: {
            $0.gptAPIClient.getSpreadInsight = { _ in expected }
        }

        await store.send(.selectInterest(.love)) {
            $0.selectedInterest = .love
            $0.isLoadingInsight = true
        }
        await store.receive(.loadInsight(.love))
        await store.receive(.loadedInsight(expected)) {
            $0.loadedInsight = expected
            $0.isLoadingInsight = false
        }
    }
}
