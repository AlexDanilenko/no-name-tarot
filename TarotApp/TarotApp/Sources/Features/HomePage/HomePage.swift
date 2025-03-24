//
//  HomePage.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 30.11.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct HomePage {
    @ObservableState
    struct State: Equatable {
        var homeTab: HomeTab.State
    }
    
    enum Action {
        case homeTab(HomeTab.Action)
    }
    
    var body: some ReducerOf<HomePage> {
        Reduce { _, _ in
            .none
        }
        Scope(state: \.homeTab, action: \.homeTab) {
            HomeTab()
        }
    }
}
