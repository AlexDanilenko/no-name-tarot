import XCTest
import ComposableArchitecture
@testable import Lunalit

final class InsightReducerTests: XCTestCase {
    func testSelectInterestLoadsInsight() async {
        let clock = TestClock()
        let store = TestStore(initialState: InsightReducer.State.selecting) {
            InsightReducer()
        } withDependencies: {
            $0.continuousClock = clock
        }

        await store.send(.selectInterest(.career)) {
            $0 = .loading(.career)
        }
        await clock.advance(by: .seconds(1))
        await store.receive(._loaded(.success(InsightReducer.Insight(interest: .career, description: "Insight about career")))) {
            $0 = .loaded(InsightReducer.Insight(interest: .career, description: "Insight about career"))
        }
    }
}
