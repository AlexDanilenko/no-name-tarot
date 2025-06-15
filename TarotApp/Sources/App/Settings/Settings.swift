//
//  Settings.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 26.01.2025.
//

import Foundation
import ComposableArchitecture

@Reducer
struct Settings {
    
    @ObservableState
    struct State {
        var dateOfBirth: Date?
        var locale: Locale
        var notificationsEnabled: Bool
        var isPremium: Bool
    }
    
    enum Action {}
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
}

