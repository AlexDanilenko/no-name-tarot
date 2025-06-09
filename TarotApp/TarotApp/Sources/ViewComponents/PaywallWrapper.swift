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
            content
                .overlay {
                    if isLocked {
                        Image(systemName: "lock.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .padding(4)
                            .frame(width: 20, height: 20)
                            .background(.thinMaterial)
                            .clipShape(.circle)
                            .frame(maxHeight: .infinity, alignment: .bottom)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(8)
                    }
                }
        }
        .buttonStyle(PlainButtonStyle())
        .animation(.easeInOut(duration: 0.2), value: isLocked)
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
