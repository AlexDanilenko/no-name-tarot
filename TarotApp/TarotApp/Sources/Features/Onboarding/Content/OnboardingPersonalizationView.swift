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
        let selectedDate: Date?
        let interests: Set<Interest>
        let gender: PersonalInfo.State.Gender?
        let canProceed: Bool
    }
    
    let store: ViewStore<ViewState, PersonalInfo.Action>
    
    init(store: StoreOf<PersonalInfo>) {
        self.store = ViewStore(store, observe: { state in
            ViewState(
                selectedDate: state.dateOfBirth,
                interests: state.interests,
                gender: state.gender,
                canProceed: state.canProceed
            )
        })
    }
    
    var body: some View {
        VStack {
            Text(localizable: .onboarding_personalization_title)
                .font(.system(.title, weight: .bold))
                .foregroundStyle(.white)
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
                .padding(.top, 72)
            
            // Enhanced Date Picker Button (Card Style + Sheet Picker)
            DatePickerOptions.customButton(store: store)
                .padding(.horizontal, 44)
            
            HStack(spacing: 12) {
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
            .toggleStyle(.onboardingToggle)
            .padding(.vertical, 20)
            .padding(.horizontal, 16)
            
            Text(localizable: .onboarding_personalization_subtitle)
                .font(.system(.callout, weight: .bold))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
            
            VStack(spacing: 12) {
                
                Toggle(
                    isOn: store.binding(
                        get: { $0.interests.contains(.love) },
                        send: .interestTapped(.love)
                    )
                ) {
                    Label {
                        Text(localizable: .onboarding_personalization_interest_love)
                    } icon: {
                        Image(systemName: Interest.love.systemIconName)
                            .foregroundColor(
                                store.interests.contains(.love)
                                ? LunalitAsset.Assets.Yellow.paywall1.swiftUIColor
                                : .white
                            )
                    }
                }
                
                Toggle(
                    isOn: store.binding(
                        get: { $0.interests.contains(.career) },
                        send: .interestTapped(.career)
                    )
                ) {
                    Label {
                        Text(localizable: .onboarding_personalization_interest_career)
                    } icon: {
                        Image(systemName: Interest.career.systemIconName)
                            .foregroundColor(
                                store.interests.contains(.career)
                                ? LunalitAsset.Assets.Yellow.paywall1.swiftUIColor
                                : .white
                            )
                    }
                }
                
                Toggle(
                    isOn: store.binding(
                        get: { $0.interests.contains(.mood) },
                        send: .interestTapped(.mood)
                    )
                ) {
                    Label {
                        Text(localizable: .onboarding_personalization_interest_moodAndEnergy)
                    } icon: {
                        Image(systemName: Interest.mood.systemIconName)
                            .foregroundColor(
                                store.interests.contains(.mood)
                                ? LunalitAsset.Assets.Yellow.paywall1.swiftUIColor
                                : .white
                            )
                    }
                }
                
                Toggle(
                    isOn: store.binding(
                        get: { $0.interests.contains(.finance) },
                        send: .interestTapped(.finance)
                    )
                ) {
                    Label {
                        Text(localizable: .onboarding_personalization_interest_finance)
                    } icon: {
                        Image(systemName: Interest.finance.systemIconName)
                            .foregroundColor(
                                store.interests.contains(.finance)
                                ? LunalitAsset.Assets.Yellow.paywall1.swiftUIColor
                                : .white
                            )
                    }
                }
                
                Toggle(
                    isOn: store.binding(
                        get: { $0.interests.contains(.future) },
                        send: .interestTapped(.future)
                    )
                ) {
                    Label {
                        Text(localizable: .onboarding_personalization_interest_future)
                    } icon: {
                        Image(systemName: Interest.future.systemIconName)
                            .foregroundColor(
                                store.interests.contains(.future)
                                ? LunalitAsset.Assets.Yellow.paywall1.swiftUIColor
                                : .white
                            )
                    }
                }
            }
            .toggleStyle(.onboardingToggle)
            .padding(.vertical, 20)
            .padding(.horizontal, 16)
            
            Spacer()
            
            Button(
                action: {
                    store.send(.proceedTapped)
                }
            ) {
                Text(localizable: .onboarding_personalization_button_title)
            }
            .buttonStyle(.onboardingButton(isEnabled: store.canProceed))
            .disabled(!store.canProceed)
            .padding(.horizontal, 16)
//            .padding(.bottom, 88)
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
