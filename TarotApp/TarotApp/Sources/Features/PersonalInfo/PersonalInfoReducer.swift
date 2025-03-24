//
//  PersonalInfoReducer.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 16.02.2025.
//

import Foundation
import ComposableArchitecture

@Reducer
struct PersonalInfo {
    @ObservableState
    struct State: Equatable {
        enum Gender: String, CaseIterable {
            case male, female
        }
        
        enum Interest: String {
            case love, career, mood, finance, future
        }
        
        var dateOfBirth: Date?
        var gender: Gender?
        var interests: Set<Interest> = []
        var canProceed: Bool = false
    }
    
    enum Action {
        case dateSelected(Date)
        case genderSelected(State.Gender)
        case interestTapped(State.Interest)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .dateSelected(let date):
                state.dateOfBirth = date
            case .genderSelected(let gender):
                state.gender = gender
            case .interestTapped(let interest):
                state.interests.insert(interest)
            }
            
            return .none
        }
        
        Reduce { state, _ in
            guard
                state.dateOfBirth != nil,
                state.gender != nil,
                !state.interests.isEmpty
            else {
                state.canProceed = false
                return .none
            }
                
            state.canProceed = true
            return .none
        }
    }
}
