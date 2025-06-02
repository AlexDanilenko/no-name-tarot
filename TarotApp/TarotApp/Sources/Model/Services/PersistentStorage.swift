//
//  PersistentService.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 02.02.2025.
//

import Foundation
import SwiftData
import Dependencies

/// Errors that can occur during storage operations
enum StorageError: Error {
    /// Failed to initialize the storage container
    case failedToInitialize
    /// Failed to save changes to the storage
    case failedToSave(Error)
    /// Failed to fetch data from storage
    case failedToFetch(Error)
    /// Failed to delete data from storage
    case failedToDelete(Error)
    /// Requested item was not found
    case itemNotFound
}

/// Protocol defining the basic storage operations
protocol Storage {
    /// The type of items this storage handles
    associatedtype T
    
    /// Fetches all items from storage
    /// - Returns: Array of stored items
    /// - Throws: `StorageError` if the operation fails
    func fetch() async throws -> [T]
    
    /// Fetches a single item from storage
    /// - Returns: Optional item, nil if not found
    /// - Throws: `StorageError` if the operation fails
    func fetchOne() async throws -> T?
    
    /// Stores a new item
    /// - Parameter value: The item to store
    /// - Returns: The stored item
    /// - Throws: `StorageError` if the operation fails
    func store(_ value: T) async throws -> T
    
    /// Deletes an item from storage
    /// - Parameter value: The item to delete
    /// - Throws: `StorageError` if the operation fails
    func delete(_ value: T) async throws
    
    /// Deletes all items from storage
    /// - Throws: `StorageError` if the operation fails
    func deleteAll() async throws
}

/// A persistent storage implementation using SwiftData
@ModelActor
final class PersistentStorage<T: PersistentModel> {
    private let container: ModelContainer
    private let descriptor: FetchDescriptor<T>
    
    /// Initializes a new storage instance
    /// - Parameters:
    ///   - schema: The SwiftData schema type
    ///   - descriptor: The fetch descriptor for queries
    ///   - configurations: Optional model configuration
    /// - Throws: `StorageError.failedToInitialize` if initialization fails
    init(
        schema: Schema.Type,
        descriptor: FetchDescriptor<T>,
        configurations: ModelConfiguration = ModelConfiguration()
    ) throws {
        do {
            self.container = try ModelContainer(
                for: schema,
                configurations: configurations
            )
            self.descriptor = descriptor
        } catch {
            throw StorageError.failedToInitialize
        }
    }
    
    // MARK: - Private Helpers
    
    private func context() -> ModelContext {
        container.mainContext
    }
    
    private func save() throws {
        do {
            try context().save()
        } catch {
            throw StorageError.failedToSave(error)
        }
    }
}

// MARK: - Storage Protocol Implementation
extension PersistentStorage: Storage {
    func fetch() async throws -> [T] {
        do {
            return try context().fetch(descriptor)
        } catch {
            throw StorageError.failedToFetch(error)
        }
    }
    
    func fetchOne() async throws -> T? {
        do {
            return try context().fetch(descriptor).first
        } catch {
            throw StorageError.failedToFetch(error)
        }
    }
    
    func store(_ value: T) async throws -> T {
        context().insert(value)
        try save()
        return value
    }
    
    func delete(_ value: T) async throws {
        context().delete(value)
        try save()
    }
    
    func deleteAll() async throws {
        do {
            let items = try context().fetch(descriptor)
            items.forEach { context().delete($0) }
            try save()
        } catch {
            throw StorageError.failedToDelete(error)
        }
    }
}

// MARK: - Day Storage
extension PersistentStorage: DependencyKey where T == Day {
    /// Live storage implementation for production
    static var liveValue: PersistentStorage<Day> {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: false)
            let descriptor = FetchDescriptor<Day>(
                sortBy: [SortDescriptor(\.date, order: .reverse)]
            )
            
            return try PersistentStorage(
                schema: Day.self,
                descriptor: descriptor,
                configurations: config
            )
        } catch {
            fatalError("Failed to initialize Day storage: \(error)")
        }
    }
    
    /// Test storage implementation using in-memory storage
    static var testValue: PersistentStorage<Day> {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let descriptor = FetchDescriptor<Day>(
                sortBy: [SortDescriptor(\.date, order: .reverse)]
            )
            
            return try PersistentStorage(
                schema: Day.self,
                descriptor: descriptor,
                configurations: config
            )
        } catch {
            fatalError("Failed to initialize test Day storage: \(error)")
        }
    }
}

// MARK: - Dependencies Registration
extension DependencyValues {
    var dailyCardStorage: PersistentStorage<Day> {
        get { self[PersistentStorage<Day>.self] }
        set { self[PersistentStorage<Day>.self] = newValue }
    }
}

