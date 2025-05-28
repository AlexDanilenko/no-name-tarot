import SwiftUI
import ComposableArchitecture

struct InterestSelectionView: View {
    let store: StoreOf<InsightReducer>

    var body: some View {
        WithViewStore(store, observe: { _ in }) { viewStore in
            VStack(alignment: .leading, spacing: 12) {
                ForEach(Spread.State.Interest.allCases, id: \.self) { interest in
                    Button {
                        viewStore.send(.selectInterest(interest))
                    } label: {
                        Text(.localizable(interest.localizationKey))
                    }
                    .buttonStyle(.interestButton)
                }
            }
        }
    }
}

extension Spread.State.Interest {
    var localizationKey: LocalizedStringKey {
        switch self {
        case .love: return .spread_interest_love
        case .money: return .spread_interest_money
        case .career: return .spread_interest_career
        case .finance: return .spread_interest_finance
        case .relations: return .spread_interest_relations
        case .situations: return .spread_interest_situations
        case .spiritual: return .spread_interest_spiritual
        }
    }
}

#Preview {
    InterestSelectionView(
        store: .init(
            initialState: .selecting,
            reducer: {
                InsightReducer()
            }
        )
    )
}
