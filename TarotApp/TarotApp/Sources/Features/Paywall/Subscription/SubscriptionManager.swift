//
//  SubscriptionManager.swift
//  Lunalit
//
//  Created by Oleksandr Danylenko on 07.05.2025.
//

import StoreKit
import Dependencies

/// Errors you might want to handle in your UI / reducer.
public enum SubscriptionError: Error {
    /// You tried to do something before calling `configure(productIDs:)`.
    case notConfigured
    /// The given product identifier wasn’t one of the IDs you passed to `configure(...)`.
    case productNotFound(id: String)
    /// Purchase failed (could be network, userCancelled, pending, etc).
    case purchaseFailed(error: Error)
    /// Verification of a purchase transaction failed.
    case verificationFailed
}

/// A single in-flight or restored transaction you can inspect in your reducer.
public struct SubscriptionTransaction: Equatable {
    public let productID: String
    public let transactionID: UInt64
    public let purchaseDate: Date
}

extension SubscriptionManager: DependencyKey {
    public static let liveValue = SubscriptionManager()
}

/// A manager for all your StoreKit2 flows: loading, caching, purchasing, restoring, and listening
/// for renewal updates.
public actor SubscriptionManager{
    
    // MARK: - State
    
    /// The in-memory cache of SK2 `Product` metadata, populated by `configure(...)`.
    private var products: [Product] = []
    
    // MARK: - Public API
    
    /// Call this once (e.g. at app launch) with the full set of product IDs you’ll ever use.
    /// Caches SK2 products so you never fetch more than once.
    public func configure(productIDs: Set<Product.ID>) async throws {
        let fetched = try await Product.products(for: productIDs)
        self.products = fetched
    }
    
    /// The list of all products you loaded via `configure(...)`.
    public func availableProducts() -> [Product] {
        products
    }
    
    /// Look up a single SK2 product by its raw ID.
    public func product(withID id: Product.ID) -> Product? {
        products.first { $0.id == id }
    }
    
    /// Purchase the given product identifier. On success this will finish the transaction.
    @discardableResult
    public func purchase(productID: String) async throws -> SubscriptionTransaction {
        guard let product = product(withID: productID) else {
            throw SubscriptionError.productNotFound(id: productID)
        }
        
        do {
            let result = try await product.purchase()
            switch result {
            case .success(let verification):
                let transaction = try verification.payloadValue
                // Always finish after unlocking content
                await transaction.finish()
                return SubscriptionTransaction(
                    productID: transaction.productID,
                    transactionID: transaction.id,
                    purchaseDate: transaction.purchaseDate
                )
            case .userCancelled:
                throw SubscriptionError.purchaseFailed(error: URLError(.cancelled))
            case .pending:
                // You might propagate a "pending" state instead of throwing.
                throw SubscriptionError.purchaseFailed(error: URLError(.networkConnectionLost))
            @unknown default:
                throw SubscriptionError.purchaseFailed(error: URLError(.unknown))
            }
        } catch {
            throw SubscriptionError.purchaseFailed(error: error)
        }
    }
    
    /// Restore all past transactions (non-consumables & still-valid subscriptions).
    public func restorePurchases() async throws -> [SubscriptionTransaction] {
        var restored: [SubscriptionTransaction] = []
        for await verification in Transaction.currentEntitlements {
            switch verification {
            case .verified(let transaction):
                restored.append(
                    .init(
                        productID: transaction.productID,
                        transactionID: transaction.id,
                        purchaseDate: transaction.purchaseDate
                    )
                )
            case .unverified:
                // You could throw here or skip
                continue
            }
        }
        return restored
    }
    
    /// Immediately get all live entitlements without waiting on the sequence.
    public func currentEntitlements() async -> [SubscriptionTransaction] {
        var entitlements: [SubscriptionTransaction] = []
        for await verification in Transaction.currentEntitlements {
            if case let .verified(transaction) = verification {
                entitlements.append(
                    .init(
                        productID: transaction.productID,
                        transactionID: transaction.id,
                        purchaseDate: transaction.purchaseDate
                    )
                )
            }
        }
        return entitlements
    }
    
    /// An async‐sequence of all transaction updates (renewals, refunds, new purchases).
    /// You can `for await` these in your app to unlock content as soon as it renews.
    nonisolated public func transactionUpdates() -> AsyncStream<SubscriptionTransaction> {
        AsyncStream { continuation in
            Task {
                for await verification in Transaction.updates {
                    switch verification {
                    case .verified(let tx):
                        // Finish here or let your reducer finish after handling.
                        await tx.finish()
                        continuation.yield(
                            .init(
                                productID: tx.productID,
                                transactionID: tx.id,
                                purchaseDate: tx.purchaseDate
                            )
                        )
                    case .unverified:
                        // Optionally handle failed verifications.
                        continue
                    }
                }
                continuation.finish()
            }
        }
    }
}

// MARK: - Dependency Injection

extension DependencyValues {
    public var subscriptionManager: SubscriptionManager {
        get { self[SubscriptionManager.self] }
        set { self[SubscriptionManager.self] = newValue }
    }
}
