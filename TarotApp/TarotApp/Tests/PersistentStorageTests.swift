import XCTest
import SwiftData
@testable import Lunalit

final class PersistentStorageTests: XCTestCase {
    var storage: PersistentStorage<Day>!
    
    override func setUp() async throws {
        try await super.setUp()
        
        // Create a completely isolated in-memory database for each test
        let config = ModelConfiguration(
            isStoredInMemoryOnly: true,
            allowsSave: true
        )
        let descriptor = FetchDescriptor<Day>(
            sortBy: [SortDescriptor(\.date, order: .reverse)]
        )
        
        storage = try PersistentStorage(
            for: Day.self,
            descriptor: descriptor,
            configurations: config
        )
        
        // Ensure the storage is completely empty before each test
        try await storage.deleteAll()
    }
    
    override func tearDown() async throws {
        try await storage.deleteAll()
        storage = nil
        try await super.tearDown()
    }
    
    func test_store_shouldSaveItem() async throws {
        // Given
        let day = Day(
            id: UUID(),
            date: Date(),
            card: .major(.theFool),
            advice: "Test advice"
        )
        
        // When
        try await storage.store(day)
        
        // Then
        let stored = try await storage.fetch()
        XCTAssertEqual(stored.count, 1)
        XCTAssertEqual(stored.first?.advice, "Test advice")
        XCTAssertEqual(stored.first?.card, .major(.theFool))
    }
    
    func test_fetch_shouldReturnStoredItems() async throws {
        // Given
        let day1 = Day(
            id: UUID(),
            date: Date().addingTimeInterval(-1000),
            card: .major(.theFool),
            advice: "First advice"
        )
        let day2 = Day(
            id: UUID(),
            date: Date(),
            card: .major(.theMagician),
            advice: "Second advice"
        )
        
        // When
        try await storage.store(day1)
        try await storage.store(day2)
        
        // Then
        let items = try await storage.fetch()
        XCTAssertEqual(items.count, 2)
        // Should be sorted by date in reverse order (most recent first)
        XCTAssertEqual(items.first?.advice, "Second advice")
        XCTAssertEqual(items.last?.advice, "First advice")
    }
    
    func test_fetchOne_shouldReturnMostRecentItem() async throws {
        // Given
        let day1 = Day(
            id: UUID(),
            date: Date().addingTimeInterval(-1000),
            card: .major(.theFool),
            advice: "First advice"
        )
        let day2 = Day(
            id: UUID(),
            date: Date(),
            card: .major(.theMagician),
            advice: "Second advice"
        )
        
        // When
        try await storage.store(day1)
        try await storage.store(day2)
        
        // Then
        let item = try await storage.fetchOne()
        XCTAssertNotNil(item)
        XCTAssertEqual(item?.advice, "Second advice")
    }
    
    func test_delete_shouldRemoveItem() async throws {
        // Given
        let day = Day(
            id: UUID(),
            date: Date(),
            card: .major(.theFool),
            advice: "Test advice"
        )
        try await storage.store(day)
        
        // When
        try await storage.delete(day)
        
        // Then
        let items = try await storage.fetch()
        XCTAssertEqual(items.count, 0)
    }
    
    func test_deleteAll_shouldRemoveAllItems() async throws {
        // Given
        let day1 = Day(
            id: UUID(),
            date: Date().addingTimeInterval(-1000),
            card: .major(.theFool),
            advice: "First advice"
        )
        let day2 = Day(
            id: UUID(),
            date: Date(),
            card: .major(.theMagician),
            advice: "Second advice"
        )
        try await storage.store(day1)
        try await storage.store(day2)
        
        // When
        try await storage.deleteAll()
        
        // Then
        let items = try await storage.fetch()
        XCTAssertEqual(items.count, 0)
    }
} 