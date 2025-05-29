import XCTest
import SwiftData
@testable import Lunalit

final class PersistentStorageTests: XCTestCase {
    var storage: PersistentStorage<Day>!
    
    override func setUp() async throws {
        try await super.setUp()
        
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let descriptor = FetchDescriptor<Day>(
            sortBy: [SortDescriptor(\.date, order: .reverse)]
        )
        
        storage = try PersistentStorage(
            schema: Day.self,
            descriptor: descriptor,
            configurations: config
        )
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
            date: .now,
            card: .major(.fool),
            advice: "Test advice"
        )
        
        // When
        let stored = try await storage.store(day)
        
        // Then
        XCTAssertEqual(stored.id, day.id)
        XCTAssertEqual(stored.card, day.card)
        XCTAssertEqual(stored.advice, day.advice)
    }
    
    func test_fetch_shouldReturnStoredItems() async throws {
        // Given
        let day1 = Day(
            id: UUID(),
            date: .now,
            card: .major(.fool),
            advice: "Test advice 1"
        )
        let day2 = Day(
            id: UUID(),
            date: .now.addingTimeInterval(-86400), // Yesterday
            card: .major(.death),
            advice: "Test advice 2"
        )
        
        // When
        _ = try await storage.store(day1)
        _ = try await storage.store(day2)
        let items = try await storage.fetch()
        
        // Then
        XCTAssertEqual(items.count, 2)
        XCTAssertEqual(items[0].id, day1.id) // Most recent first
        XCTAssertEqual(items[1].id, day2.id)
    }
    
    func test_fetchOne_shouldReturnMostRecentItem() async throws {
        // Given
        let day1 = Day(
            id: UUID(),
            date: .now,
            card: .major(.fool),
            advice: "Test advice 1"
        )
        let day2 = Day(
            id: UUID(),
            date: .now.addingTimeInterval(-86400), // Yesterday
            card: .major(.death),
            advice: "Test advice 2"
        )
        
        // When
        _ = try await storage.store(day1)
        _ = try await storage.store(day2)
        let item = try await storage.fetchOne()
        
        // Then
        XCTAssertNotNil(item)
        XCTAssertEqual(item?.id, day1.id)
    }
    
    func test_delete_shouldRemoveItem() async throws {
        // Given
        let day = Day(
            id: UUID(),
            date: .now,
            card: .major(.fool),
            advice: "Test advice"
        )
        _ = try await storage.store(day)
        
        // When
        try await storage.delete(day)
        let items = try await storage.fetch()
        
        // Then
        XCTAssertTrue(items.isEmpty)
    }
    
    func test_deleteAll_shouldRemoveAllItems() async throws {
        // Given
        let day1 = Day(
            id: UUID(),
            date: .now,
            card: .major(.fool),
            advice: "Test advice 1"
        )
        let day2 = Day(
            id: UUID(),
            date: .now.addingTimeInterval(-86400),
            card: .major(.death),
            advice: "Test advice 2"
        )
        _ = try await storage.store(day1)
        _ = try await storage.store(day2)
        
        // When
        try await storage.deleteAll()
        let items = try await storage.fetch()
        
        // Then
        XCTAssertTrue(items.isEmpty)
    }
} 