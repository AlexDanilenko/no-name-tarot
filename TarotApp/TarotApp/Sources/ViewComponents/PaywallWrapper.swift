//
//  PaywallWrapper.swift
//  Lunalit
//
//  Created by Assistant on 2025.
//

import SwiftUI

/// A reusable wrapper that can style any view as locked/premium content
struct PaywallWrapper<Content: View>: View {
    let content: Content
    let isLocked: Bool
    let onTap: () -> Void
    
    init(
        isLocked: Bool,
        onTap: @escaping () -> Void,
        @ViewBuilder content: () -> Content
    ) {
        self.isLocked = isLocked
        self.onTap = onTap
        self.content = content()
    }
    
    var body: some View {
        Button(action: onTap) {
            ZStack {
                // Original content
                content
                    .blur(radius: isLocked ? 4 : 0)
                    .opacity(isLocked ? 0.6 : 1.0)
                
                // Lock overlay - only show when locked
                if isLocked {
                    lockOverlay
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
        .animation(.easeInOut(duration: 0.2), value: isLocked)
    }
    
    private var lockOverlay: some View {
        Rectangle()
            .fill(Color.black.opacity(0.3))
            .overlay {
                VStack(spacing: 8) {
                    Image(systemName: "lock.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    Text("Premium")
                        .font(.caption.weight(.semibold))
                        .foregroundColor(.white)
                }
            }
    }
}

#Preview {
    VStack(spacing: 20) {
        // Unlocked card example
        PaywallWrapper(isLocked: false, onTap: {}) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.blue)
                .frame(width: 100, height: 150)
                .overlay {
                    Text("Unlocked")
                        .foregroundColor(.white)
                }
        }
        
        // Locked card example
        PaywallWrapper(isLocked: true, onTap: {}) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.blue)
                .frame(width: 100, height: 150)
                .overlay {
                    Text("Locked")
                        .foregroundColor(.white)
                }
        }
    }
    .padding()
} 