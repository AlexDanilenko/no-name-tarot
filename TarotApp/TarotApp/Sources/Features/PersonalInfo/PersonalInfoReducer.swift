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
    struct State: Equatable, Codable {
        enum Gender: String, Codable, CaseIterable {
            case male, female
        }
        
        enum Interest: String, Codable {
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
        case proceedTapped
        
        case save(State)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .dateSelected(let date):
                state.dateOfBirth = date
            case .genderSelected(let gender):
                state.gender = gender
            case .interestTapped(let interest) where state.interests.contains(interest):
                state.interests.remove(interest)
            case .interestTapped(let interest):
                state.interests.insert(interest)
            case .proceedTapped:
                return .send(.save(state))
            case .save:
                return .none
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
