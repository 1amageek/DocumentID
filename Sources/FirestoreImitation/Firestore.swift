//
//  Firestore.swift
//  
//
//  Created by nori on 2022/05/16.
//

import Foundation
@_exported import DocumentID

public enum Source: Sendable {
    case `default`
    case server
    case cache
}

public protocol Firestore: Sendable {
    func updates(_ reference: DocumentReference, includeMetadataChanges: Bool) -> AsyncThrowingStream<DocumentSnapshot?, Error>?
    func updates<T: Decodable & Sendable>(_ reference: DocumentReference, includeMetadataChanges: Bool, type: T.Type) -> AsyncThrowingStream<T?, Error>?
    func updates<T: Decodable & Sendable>(_ query: Query, includeMetadataChanges: Bool, type: T.Type) -> AsyncThrowingStream<[T], Error>?
    func changes<T: Decodable & Sendable>(_ query: Query, includeMetadataChanges: Bool, type: T.Type) -> AsyncThrowingStream<(added: [T], modified: [T], removed: [T]), Error>?
    
    func get(_ reference: DocumentReference, source: Source) async throws -> DocumentSnapshot?
    func get<T: Decodable & Sendable>(_ query: Query, source: Source, type: T.Type) async throws -> [T]?
    func get<T: Decodable & Sendable>(_ reference: DocumentReference, source: Source, type: T.Type) async throws -> T?
    func get(_ aggregateQuery: AggregateQuery) async throws -> AggregateQuerySnapshot?
    func set(_ data: [String: Any], merge: Bool, reference: DocumentReference) async throws
    func set<T: Encodable & Sendable>(_ data: T, merge: Bool, reference: DocumentReference) async throws
    func set<T: Encodable & Sendable>(_ data: T, extensionData: [String: Any], merge: Bool, reference: DocumentReference) async throws
    func update(_ data: [String: Any], reference: DocumentReference) async throws
    func update<T: Encodable & Sendable>(_ data: T, reference: DocumentReference) async throws
    func update<T: Encodable & Sendable>(_ data: T, extensionData: [String: Any], reference: DocumentReference) async throws
    func delete(reference: DocumentReference) async throws
    func writeBatch() -> WriteBatch
    func runTransaction(update: @escaping (Transaction, NSErrorPointer) -> Any?, completion: @escaping (Any?, Error?) -> Void)
}

extension Firestore {
    
    public func updates(_ reference: DocumentReference, includeMetadataChanges: Bool = true) -> AsyncThrowingStream<DocumentSnapshot?, Error>? {
        updates(reference, includeMetadataChanges: includeMetadataChanges)
    }
    
    public func updates<T: Decodable & Sendable>(_ reference: DocumentReference, includeMetadataChanges: Bool = true, type: T.Type) -> AsyncThrowingStream<T?, Error>? {
        updates(reference, includeMetadataChanges: includeMetadataChanges, type: type)
    }

    public func updates<T: Decodable & Sendable>(_ reference: CollectionReference, includeMetadataChanges: Bool = true, type: T.Type) -> AsyncThrowingStream<[T], Error>? {
        updates(Query(reference.path), includeMetadataChanges: includeMetadataChanges, type: type)
    }
    
    public func updates<T: Decodable & Sendable>(_ query: Query, includeMetadataChanges: Bool = true, type: T.Type) -> AsyncThrowingStream<[T], Error>? {
        updates(query, includeMetadataChanges: includeMetadataChanges, type: type)
    }

    public func changes<T: Decodable & Sendable>(_ reference: CollectionReference, includeMetadataChanges: Bool = true, type: T.Type) -> AsyncThrowingStream<(added: [T], modified: [T], removed: [T]), Error>? {
        changes(Query(reference.path), includeMetadataChanges: includeMetadataChanges, type: type)
    }
    
    public func changes<T: Decodable & Sendable>(_ query: Query, includeMetadataChanges: Bool = true, type: T.Type) -> AsyncThrowingStream<(added: [T], modified: [T], removed: [T]), Error>? {
        changes(query, includeMetadataChanges: includeMetadataChanges, type: type)
    }

    public func get<T: Decodable & Sendable>(_ query: Query, source: Source = .default, type: T.Type) async throws -> [T]? {
        try await get(query, source: source, type: type)
    }

    public func get<T: Decodable & Sendable>(_ reference: DocumentReference, source: Source = .default, type: T.Type) async throws -> T? {
        try await get(reference, source: source, type: type)
    }

    public func get(_ aggregateQuery: AggregateQuery) async throws -> AggregateQuerySnapshot? {
        try await get(aggregateQuery)
    }
}

extension Firestore {

    public func set<T: Encodable & Sendable>(_ data: T, reference: DocumentReference) async throws {
        try await set(data, merge: true, reference: reference)
    }
}

public protocol Queryable: AnyObject {

    associatedtype DataQuery : Queryable

    func setPredicates(_ predicates: [QueryPredicate]) -> DataQuery
}
