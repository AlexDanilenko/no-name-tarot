//
//  Paywall.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 29.03.2025.
//

import Foundation
import ComposableArchitecture

@Reducer
struct Paywall {
    
    @ObservableState
    struct State {
        var subscriptions: Subscriptions
        var selectedOption: Subscriptions.Option?
        
        struct Subscriptions: Equatable {
            struct Option: Equatable, Identifiable {
                let id: UUID
                let price: Decimal
                let isTrial: Bool
            }
            
            var weekly: Option
            var montly: Option
            var yearly: Option
        }
    }
    
    enum Action {}
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
    
}
