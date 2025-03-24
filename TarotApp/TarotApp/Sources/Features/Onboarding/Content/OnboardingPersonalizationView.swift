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
        let interests: Set<PersonalInfo.State.Interest>
        let gender: PersonalInfo.State.Gender?
    }
    
    let store: ViewStore<ViewState, PersonalInfo.Action>
    
    init(store: StoreOf<PersonalInfo>) {
        self.store = ViewStore(store, observe: { state in
            ViewState(
                selectedDate: state.dateOfBirth ?? ViewState.dateRange.upperBound,
                interests: state.interests,
                gender: state.gender
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
                .padding(.top, 45)
            
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
                    Spacer(minLength: 32)
                    DatePicker(
                        String(localizable: .onboarding_personalization_date_of_birth),
                        selection: store.binding(
                            get: { $0.selectedDate },
                            send: { .dateSelected($0)}
                        ),
                        displayedComponents: [.date]
                    )
                    .colorScheme(.dark)
                    .foregroundStyle(.white)
                    .padding(.leading, 16)
                    .background(TarotAppAsset.Assets.purpleLight1.swiftUIColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(TarotAppAsset.Assets.purpleLight1.swiftUIColor, lineWidth: 1)
                    )
                    Spacer(minLength: 32)
                }
            }
            .toggleStyle(.onboardingToggle)
            
            Spacer()
            
            TarotAppAsset.Assets.Icons.moon.swiftUIImage
                .resizable()
                .frame(width: 36, height: 36)
                .padding(.vertical, 16)
                .shadow(color: TarotAppAsset.Assets.purpleShadow.swiftUIColor, radius: 16, x: -16, y: 16)
            
            Text(localizable: .onboarding_personalization_subtitle)
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(.white)
                .padding(.horizontal, 32)
                .multilineTextAlignment(.center)
            
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
           
            Button(action: {
                unimplemented()
            }, label: {
                Text(localizable: .onboarding_personalization_button_title)
            })
            .buttonStyle(.onboardingButton)
            
        }
        .background(OnboardingBackgroundView())
        .padding(.horizontal, 16)
        .padding(.bottom, 32)
        .background(
            TarotAppAsset.Assets.backgroundBlack.swiftUIColor
        )
    }
}

#Preview {
    OnboardingPersonalizationView(
        store: .init(initialState: PersonalInfo.State.init(), reducer: {
            PersonalInfo()
        })
    )
}
