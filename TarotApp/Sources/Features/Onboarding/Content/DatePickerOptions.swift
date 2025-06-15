//
//  DatePickerOptions.swift
//  TarotApp
//
//  Created by Assistant on December 2024.
//

import SwiftUI
import ComposableArchitecture

/// Collection of different date picker UI options for onboarding
struct DatePickerOptions {
    
    /// Option 1: Enhanced inline DatePicker with visual feedback (Currently Applied)
    static func enhancedInline(
        store: ViewStore<OnboardingPersonalizationView.ViewState, PersonalInfo.Action>
    ) -> some View {
        VStack(spacing: 12) {
            DatePicker(
                selection: store.binding(
                    get: { $0.selectedDate ?? OnboardingPersonalizationView.ViewState.dateRange.upperBound },
                    send: PersonalInfo.Action.dateSelected
                ),
                in: OnboardingPersonalizationView.ViewState.dateRange,
                displayedComponents: .date
            ) {
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(store.selectedDate == nil ? .gray : LunalitAsset.Assets.purpleLight1.swiftUIColor)
                    
                    Text(localizable: .onboarding_personalization_date_of_birth)
                        .font(.system(size: 16))
                        .foregroundColor(store.selectedDate == nil ? .gray : .white)
                    
                    Spacer()
                    
                    if store.selectedDate != nil {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(LunalitAsset.Assets.purpleLight1.swiftUIColor)
                    }
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(
                store.selectedDate != nil
                ? LunalitAsset.Assets.purpleLight1.swiftUIColor.opacity(0.1)
                : Color.clear
            )
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(
                        store.selectedDate != nil 
                        ? LunalitAsset.Assets.purpleLight1.swiftUIColor 
                        : Color.gray.opacity(0.5), 
                        lineWidth: 1
                    )
            )
            
            if let selectedDate = store.selectedDate {
                Text(selectedDate, style: .date)
                    .font(.caption)
                    .foregroundColor(LunalitAsset.Assets.purpleLight1.swiftUIColor)
                    .padding(.horizontal, 20)
            } else {
                Text("Tap to select your birth date")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 20)
            }
        }
    }
    
    /// Option 2: Button-style with sheet presentation (Enhanced)
    static func customButton(
        store: ViewStore<OnboardingPersonalizationView.ViewState, PersonalInfo.Action>
    ) -> some View {
        EnhancedDatePickerButton(
            selectedDate: store.selectedDate,
            dateRange: OnboardingPersonalizationView.ViewState.dateRange,
            onDateSelected: { date in
                store.send(.dateSelected(date))
            }
        )
    }
    
    /// Option 3: Minimal inline with better typography
    static func minimal(
        store: ViewStore<OnboardingPersonalizationView.ViewState, PersonalInfo.Action>
    ) -> some View {
        DatePicker(
            selection: store.binding(
                get: { $0.selectedDate ?? OnboardingPersonalizationView.ViewState.dateRange.upperBound },
                send: PersonalInfo.Action.dateSelected
            ),
            in: OnboardingPersonalizationView.ViewState.dateRange,
            displayedComponents: .date
        ) {
            HStack {
                Text(localizable: .onboarding_personalization_date_of_birth)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(store.selectedDate == nil ? .gray : .white)
                
                Spacer()
                
                if store.selectedDate != nil {
                    Text("✓")
                        .foregroundColor(LunalitAsset.Assets.purpleLight1.swiftUIColor)
                        .font(.title3.bold())
                }
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(
                    store.selectedDate != nil 
                    ? LunalitAsset.Assets.purpleLight1.swiftUIColor 
                    : Color.white.opacity(0.3), 
                    lineWidth: 1
                )
        )
    }
    
    /// Option 4: Card-style with gradient background and rich styling
    static func cardStyle(
        store: ViewStore<OnboardingPersonalizationView.ViewState, PersonalInfo.Action>
    ) -> some View {
        VStack(spacing: 12) {
            DatePicker(
                selection: store.binding(
                    get: { $0.selectedDate ?? OnboardingPersonalizationView.ViewState.dateRange.upperBound },
                    send: PersonalInfo.Action.dateSelected
                ),
                in: OnboardingPersonalizationView.ViewState.dateRange,
                displayedComponents: .date
            ) {
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 12) {
                        Image(systemName: "calendar.badge.clock")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(
                                store.selectedDate != nil 
                                ? LunalitAsset.Assets.Yellow.paywall1.swiftUIColor 
                                : .white
                            )
                        
                        Text(localizable: .onboarding_personalization_date_of_birth)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        if store.selectedDate != nil {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 16))
                                .foregroundColor(LunalitAsset.Assets.Yellow.paywall1.swiftUIColor)
                        }
                    }
                    
                    if let selectedDate = store.selectedDate {
                        Text(selectedDate, style: .date)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(LunalitAsset.Assets.Yellow.paywall1.swiftUIColor)
                    } else {
                        Text("Required for personalized reading")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(.gray.opacity(0.8))
                    }
                }
            }
            // Enhanced styling with rich colors and better contrast
            .accentColor(LunalitAsset.Assets.Yellow.paywall1.swiftUIColor) // Fix tint colors
            .colorScheme(.dark) // Force dark theme for better contrast
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .background(
                Group {
                    if store.selectedDate != nil {
                        // Rich gradient background when selected
                        LinearGradient(
                            colors: [
                                LunalitAsset.Assets.purpleLight1.swiftUIColor.opacity(0.3),
                                LunalitAsset.Assets.buttonColorPurpleDark.swiftUIColor.opacity(0.2),
                                LunalitAsset.Assets.Yellow.paywall1.swiftUIColor.opacity(0.1)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    } else {
                        // Subtle background when unselected
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.05),
                                Color.clear
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    }
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(
                        store.selectedDate != nil 
                        ? LinearGradient(
                            colors: [
                                LunalitAsset.Assets.Yellow.paywall1.swiftUIColor,
                                LunalitAsset.Assets.purpleLight1.swiftUIColor
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        : LinearGradient(
                            colors: [
                                Color.white.opacity(0.3),
                                Color.white.opacity(0.1)
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        ), 
                        lineWidth: store.selectedDate != nil ? 2 : 1
                    )
            )
            .shadow(
                color: store.selectedDate != nil 
                ? LunalitAsset.Assets.purpleLight1.swiftUIColor.opacity(0.3)
                : Color.clear,
                radius: store.selectedDate != nil ? 8 : 0,
                x: 0,
                y: 4
            )
        }
        .padding(.horizontal, 16) // Better outer padding
    }
} 