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
    struct State: Equatable {}
    
    @CasePathable
    enum Action {}
    
    var body: some ReducerOf<HomePage> {
        Reduce { _, _ in
            .none
        }
    }
}
