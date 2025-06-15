//
//  Paywall.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 29.03.2025.
//

import Foundation
import ComposableArchitecture
import Dependencies
import StoreKit

@Reducer
struct Paywall {
    @Dependency(\.subscriptionManager) var subscriptionManager
    
    @ObservableState
    struct State: Equatable {
        @Shared(.appStorage("isSubscribed"))
        var isSubscribed: Bool = false
        
        var subscriptions: Subscriptions
        
        var isLoading: Bool = false
        
        @Presents
        var alert: AlertState<Action.Alert>? = nil
        
        struct Subscriptions: Equatable {
            struct Option: Equatable, Identifiable {
                var id: Product.ID {
                    productID
                }
                let productID: Product.ID
                let price: Decimal
                let description: String
                let adPrice: Decimal?
                let adDescription: String?
                let isTrial: Bool
                var isSelected: Bool
            }
            
            var first: Option
            var second: Option
            var third: Option
            
            var productIDs: [Product.ID] {
                [first, second, third].map(\.productID)
            }
            
            var selected: Option? {
                [first, second, third].first(where: \.isSelected)
            }
        }
    }
    
    @CasePathable
    enum Action {
        enum SubscriptionOption { case first, second, third }
        case start
        case select(option: SubscriptionOption)
        case subscribe
        case subscriptionResponse(TaskResult<SubscriptionTransaction>)
        case restore
        
        case alert(PresentationAction<Alert>)
        
        @CasePathable
        public enum Alert {
            case dismiss
        }
        
        // Legacy stub, no-op
        case subscriptionFinished
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .start:
                return .run { send in
                    for await update in subscriptionManager.transactionUpdates() {
                        print(update)
                    }
                }
            case .select(let option):
                state.subscriptions.first.isSelected  = option == .first
                state.subscriptions.second.isSelected = option == .second
                state.subscriptions.third.isSelected  = option == .third
                return .none
                
            case .subscribe:
                state.isLoading = true
                state.alert = nil
                
                let selected = state.subscriptions.selected!
                let productIDs = state.subscriptions.productIDs
                
                return .run { send in
                    do {
                        try await subscriptionManager.configure(productIDs: Set(productIDs))
                    } catch {
                        print(error)
                    }
                    
                    
                    let result = await TaskResult {
                        try await subscriptionManager.purchase(productID: selected.productID)
                    }
                    print(result)
                    
                    await send(.subscriptionResponse(result))
                }
                
            case .subscriptionResponse(.success):
                state.isLoading = false
                // TODO: Unlock content or navigate to next screen.
                return .send(.subscriptionFinished)
                
            case .subscriptionResponse(.failure(let error)):
                state.isLoading = false
                
                // Populate AlertState with title, message, and a dismiss button
                state.alert = AlertState<Action.Alert> {
                    TextState("Purchase Failed")
                } actions: {
                    // When tapped, this sends .dismissAlert
                    ButtonState(action: .send(.dismiss)) {
                        TextState("OK")
                    }
                } message: {
                    TextState(error.localizedDescription)
                }
                
                return .none
            case .restore:
                let productIDs = state.subscriptions.productIDs
                
                return .run { send in
                    let subscribed = productIDs
                        .contains(
                            await subscriptionManager
                                .currentEntitlements()
                                .map(\.productID)
                        )
                    
                    if subscribed {
                       await send(.subscriptionFinished)
                    }
                }
            case .alert(.presented(.dismiss)):
                state.alert = nil
                return .none
                
            case .alert:
                return .none
                
            case .subscriptionFinished:
                state.$isSubscribed.withLock {
                    $0 = true
                }
                
                return .none
            }
        }
        .ifLet(\.alert, action: \.alert)
    }
}
