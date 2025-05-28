import ComposableArchitecture
import Foundation

@Reducer
struct InsightReducer {
    @ObservableState
    enum State: Equatable {
        case selecting
        case loading(Spread.State.Interest)
        case loaded(Insight)
    }

    struct Insight: Equatable {
        let interest: Spread.State.Interest
        let description: String
    }

    enum Action: Equatable {
        case selectInterest(Spread.State.Interest)
        case _loaded(TaskResult<Insight>)
    }

    @Dependency(\.continuousClock) var clock

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .selectInterest(let interest):
                state = .loading(interest)
                return .run { send in
                    try await clock.sleep(for: .seconds(1))
                    await send(._loaded(.success(Insight(interest: interest, description: "Insight about \(interest)"))))
                }

            case ._loaded(.success(let insight)):
                state = .loaded(insight)
                return .none

            case ._loaded(.failure):
                state = .selecting
                return .none
            }
        }
    }
}
