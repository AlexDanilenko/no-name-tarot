//
//  SubscriptionOptions.swift
//  Lunalit
//
//  Created by Oleksandr Danylenko on 07.05.2025.
//
import Foundation
import StoreKit

extension Paywall.State.Subscriptions.Option {
  /// 1-Week auto-renewing subscription
    static let weekly1: Self = .init(
    productID: "com.odanylenko.lunalit.weekly",
    price: 1.99,
    description: "1 Week",
    adPrice: nil,
    adDescription: nil,
    isTrial: false,
    isSelected: false
  )

  /// 1-Month auto-renewing subscription (7-day free trial)
  /// Marketed at $2.99/week
    static let monthly1: Self = .init(
    productID: "com.odanylenko.lunalit.monthly",
    price: 11.99,
    description: "1 Month",
    adPrice: 2.99,
    adDescription: "weekly",
    isTrial: true,
    isSelected: true
  )

  /// 1-Year auto-renewing subscription (7-day free trial)
  /// Marketed at $2.49/month
  static let yearly1: Self = .init(
    productID: "com.odanylenko.lunalit.yearly",
    price: 29.99,
    description: "1 Year",
    adPrice: 2.49,
    adDescription: "monthly",
    isTrial: true,
    isSelected: false
  )

  /// Lifetime non-consumable unlock
  static let lifetime1: Self = .init(
    productID: "com.odanylenko.lunalit.lifetime",
    price: 59.99,
    description: "Lifetime",
    adPrice: nil,
    adDescription: nil,
    isTrial: false,
    isSelected: false
  )
}
