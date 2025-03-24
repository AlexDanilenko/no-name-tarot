//
//  PersistentService.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 02.02.2025.
//

import Foundation
import SwiftData
import Dependencies

protocol Storage {
    associatedtype T
    func fetch() async throws -> [T]
    
    @discardableResult
    func store(_ value: T) async throws -> Result<T, Error>
}


actor PersistentStorage<T: PersistentModel> : Storage {
    
    private let container: ModelContainer
    private let desctiptor: FetchDescriptor<T>
    
    init(desctiptor: FetchDescriptor<T>) throws {
        self.container = try ModelContainer(for: T.self)
        self.desctiptor = desctiptor
    }
    
    @MainActor
    func fetch() async throws -> [T] {
        let context = container.mainContext
        return try context.fetch(desctiptor)
    }
    
    @MainActor
    func store(_ value: T) async throws -> Result<T, Error> {
        let context = container.mainContext
        do {
            try context.save()
            return .success(value)
        } catch {
            return .failure(error)
        }
        
        
    }
}


extension PersistentStorage: TestDependencyKey where T == Day {
    static var testValue: PersistentStorage<Day> {
        liveValue
    }
}

extension PersistentStorage: DependencyKey where T == Day {
    static var liveValue: PersistentStorage<Day> {
        try! PersistentStorage(desctiptor: .init(sortBy: [ .init(\.date) ]))
    }
}

extension PersistentStorage where T == User {
    static var testValue: PersistentStorage<User> {
        liveValue
    }
}

extension PersistentStorage where T == User {
    static var liveValue: PersistentStorage<User> {
        try! PersistentStorage(desctiptor: .init())
    }
}
//
extension DependencyValues {
    var dailyCardStorage: PersistentStorage<Day> {
        get { self[PersistentStorage<Day>.self] }
        set { self[PersistentStorage<Day>.self] = newValue }
    }
}
//
//    var userStorage: PersistentStorage<User> {
//        get { self[PersistentStorage<User>.self] }
//        set { self[PersistentStorage<User>.self] = newValue }
//    }
//}

