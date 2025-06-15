//
//  Date+Extensions.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 02.02.2025.
//

import Foundation

extension Date {
    var isFromToday: Bool {
        Calendar.current.isDateInToday(self)
    }
} 