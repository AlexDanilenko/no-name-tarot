//
//  DatePickerButtonStyle.swift
//  TarotApp
//
//  Created by Assistant on December 2024.
//

import SwiftUI

struct EnhancedDatePickerButton: View {
    let selectedDate: Date?
    let dateRange: PartialRangeThrough<Date>
    let onDateSelected: (Date) -> Void
    
    @State private var showingDatePicker = false
    
    var body: some View {
        Button {
            showingDatePicker = true
        } label: {
            // Card-style button with rich styling
            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 12) {
                    Image(systemName: "calendar.badge.clock")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(
                            selectedDate != nil 
                            ? LunalitAsset.Assets.Yellow.paywall1.swiftUIColor 
                            : .white
                        )
                    
                    if selectedDate != nil {
                        // Show only the selected date when chosen
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Date of Birth")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(.white.opacity(0.8))
                            
                            Text(selectedDate!, style: .date)
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                        }
                    } else {
                        // Show full label when not selected
                        VStack(alignment: .leading, spacing: 4) {
                            Text(localizable: .onboarding_personalization_date_of_birth)
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                            
                            Text("Required for personalized reading")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(.gray.opacity(0.8))
                        }
                    }
                    
                    Spacer()
                    
                    if selectedDate != nil {
                        VStack(spacing: 4) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 16))
                                .foregroundColor(LunalitAsset.Assets.Yellow.paywall1.swiftUIColor)
                            
                            Text("Tap to change")
                                .font(.system(size: 10, weight: .medium))
                                .foregroundColor(.white.opacity(0.6))
                        }
                    } else {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .background(
                Group {
                    if selectedDate != nil {
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
                        selectedDate != nil 
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
                        lineWidth: selectedDate != nil ? 2 : 1
                    )
            )
            .shadow(
                color: selectedDate != nil 
                ? LunalitAsset.Assets.purpleLight1.swiftUIColor.opacity(0.3)
                : Color.clear,
                radius: selectedDate != nil ? 8 : 0,
                x: 0,
                y: 4
            )
        }
        .buttonStyle(.borderless) // Prevent additional button styling
        .sheet(isPresented: $showingDatePicker) {
            NavigationView {
                VStack(spacing: 32) {
                    // Simplified Header - removed redundant title
                    VStack(spacing: 12) {
                        Image(systemName: "calendar.badge.clock")
                            .font(.system(size: 36, weight: .medium))
                            .foregroundColor(LunalitAsset.Assets.Yellow.paywall1.swiftUIColor)
                            .frame(width: 44, height: 44) // Fix icon positioning
                        
                        Text("Select your birth date for personalized readings")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 24)
                    }
                    .padding(.top, 24)
                    
                    // Date Picker - removed label to fix icon issue
                    DatePicker(
                        "",
                        selection: .init(
                            get: { selectedDate ?? dateRange.upperBound },
                            set: onDateSelected
                        ),
                        in: dateRange,
                        displayedComponents: .date
                    )
                    .datePickerStyle(.wheel)
                    .background(Color.clear)
                    .foregroundStyle(.white)
                    .accentColor(LunalitAsset.Assets.Yellow.paywall1.swiftUIColor)
                    .colorScheme(.dark)
                    .labelsHidden() // Hide internal labels that might cause icon issues
                                        
                    // Action Button
                    Button("Confirm Date") {
                        showingDatePicker = false
                    }
                    .buttonStyle(.onboardingButton)
                    .padding(.horizontal, 24)
//                    .padding(.bottom, 32)
                }
                .background(LunalitAsset.Assets.backgroundBlack.swiftUIColor)
                .navigationBarHidden(true)
            }
            .presentationDetents([.medium])
            .presentationDragIndicator(.visible)
        }
    }
}

// Keep the old one for compatibility
struct OnboardingDatePickerStyle: View {
    let selectedDate: Date?
    let dateRange: PartialRangeThrough<Date>
    let onDateSelected: (Date) -> Void
    
    var body: some View {
        EnhancedDatePickerButton(
            selectedDate: selectedDate,
            dateRange: dateRange,
            onDateSelected: onDateSelected
        )
    }
}

#Preview {
    VStack {
        OnboardingDatePickerStyle(
            selectedDate: nil,
            dateRange: ...Calendar.current.date(byAdding: .year, value: -5, to: .now)!,
            onDateSelected: { _ in }
        )
        
        OnboardingDatePickerStyle(
            selectedDate: Date(),
            dateRange: ...Calendar.current.date(byAdding: .year, value: -5, to: .now)!,
            onDateSelected: { _ in }
        )
    }
    .padding()
    .background(Color.black)
} 
