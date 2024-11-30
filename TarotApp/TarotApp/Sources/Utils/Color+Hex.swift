//
//  Color+Hex.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 21.11.2024.
//

import SwiftUI

public extension Color {
    // Color from hex value, useful for converting figma inspector colors
    // (change "#FFAABB" -> 0xFFAABB)
    init(hex: UInt, alpha: Double = 1) {
        self.init(.sRGB,
                  red: Double((hex >> 16) & 0xff) / 255,
                  green: Double((hex >> 08) & 0xff) / 255,
                  blue: Double((hex >> 00) & 0xff) / 255,
                  opacity: alpha)
    }

    init(hex: String, alpha: Double = 1) {
        let sanitizedHex = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))

        // Check if the string is a valid hex color code
        guard sanitizedHex.count == 6,
              let hexValue = UInt32(sanitizedHex, radix: 16)
        else {
            self.init(.black)
            return
        }

        self.init(.sRGB,
                  red: Double((hexValue >> 16) & 0xff) / 255,
                  green: Double((hexValue >> 8) & 0xff) / 255,
                  blue: Double(hexValue & 0xff) / 255,
                  opacity: alpha)
    }
}
