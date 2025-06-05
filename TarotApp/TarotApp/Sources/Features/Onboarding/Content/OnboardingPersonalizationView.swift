//
//  OnboardingPersonalizationView.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 25.02.2025.
//

import SwiftUI
import ComposableArchitecture

struct OnboardingPersonalizationView: View {
    
    struct ViewState: Equatable {
        static let dateRange = ...Calendar.current.date(byAdding: .year, value: -5, to: .now)!
        let selectedDate: Date
        let interests: Set<Interest>
        let gender: PersonalInfo.State.Gender?
        let canProceed: Bool
    }
    
    let store: ViewStore<ViewState, PersonalInfo.Action>
    
    init(store: StoreOf<PersonalInfo>) {
        self.store = ViewStore(store, observe: { state in
            ViewState(
                selectedDate: state.dateOfBirth ?? ViewState.dateRange.upperBound,
                interests: state.interests,
                gender: state.gender,
                canProceed: state.canProceed
            )
        })
    }
    
    var body: some View {
        VStack {
            
            Text(localizable: .onboarding_personalization_title)
                .font(.system(size: 24, weight: .medium))
                .foregroundStyle(.white)
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
                .padding(.top, 72)
            
            VStack {
                HStack {
                    Toggle(
                        isOn: store.binding(
                            get: { $0.gender == .female },
                            send: .genderSelected(.female)
                        )
                    ) {
                        Text(localizable: .onboarding_personalization_gender_female)
                    }
                    
                    Toggle(
                        isOn: store.binding(
                            get: { $0.gender == .male },
                            send: .genderSelected(.male)
                        )
                    ) {
                        Text(localizable: .onboarding_personalization_gender_male)
                    }
                }
                
                HStack {
                    DatePicker(
                        selection: store.binding(
                            get: \.selectedDate,
                            send: PersonalInfo.Action.dateSelected
                        ),
                        in: ViewState.dateRange,
                        displayedComponents: .date
                    ) {
                        Text(localizable: .onboarding_personalization_date_of_birth)
                    }
                }
            }
            .toggleStyle(.onboardingToggle)
            .padding(.vertical, 16)
            
            Text(localizable: .onboarding_personalization_subtitle)
                .font(.system(.callout, weight: .bold))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
            
            VStack {
                Toggle(
                    isOn: store.binding(
                        get: { $0.interests.contains(.love) },
                        send: .interestTapped(.love)
                    )
                ) {
                    Text(localizable: .onboarding_personalization_interest_love)
                }
                
                Toggle(
                    isOn: store.binding(
                        get: { $0.interests.contains(.career) },
                        send: .interestTapped(.career)
                    )
                ) {
                    Text(localizable: .onboarding_personalization_interest_career)
                }
                
                Toggle(
                    isOn: store.binding(
                        get: { $0.interests.contains(.mood) },
                        send: .interestTapped(.mood)
                    )
                ) {
                    Text(localizable: .onboarding_personalization_interest_moodAndEnergy)
                }
                
                Toggle(
                    isOn: store.binding(
                        get: { $0.interests.contains(.finance) },
                        send: .interestTapped(.finance)
                    )
                ) {
                    Text(localizable: .onboarding_personalization_interest_finance)
                }
                
                Toggle(
                    isOn: store.binding(
                        get: { $0.interests.contains(.future) },
                        send: .interestTapped(.future)
                    )
                ) {
                    Text(localizable: .onboarding_personalization_interest_future)
                }
            }
            .toggleStyle(.onboardingToggle)
            .padding(.vertical, 16)
            
            Spacer()
            
            Button(
                action: {
                    store.send(.proceedTapped)
                }
            ) {
                Text(localizable: .onboarding_personalization_button_title)
            }
            .buttonStyle(.onboardingButton)
            .disabled(!store.canProceed)
            .padding(.horizontal, 16)
            .padding(.bottom, 88)
        }
        .background(OnboardingBackgroundView())
        .padding()
        .background(LunalitAsset.Assets.backgroundBlack.swiftUIColor)
    }
}

#Preview {
    OnboardingPersonalizationView(
        store: .init(
            initialState: .init(),
            reducer: {
                PersonalInfo()
            }
        )
    )
}
