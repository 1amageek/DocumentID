//
//  Firestore.swift
//  
//
//  Created by nori on 2022/05/16.
//

import Foundation
@_exported import DocumentID

public enum Source {
    case `default`
    case server
    case cache
}

public protocol Firestore {
    func updates(_ reference: DocumentReference, includeMetadataChanges: Bool) -> AsyncThrowingStream<DocumentSnapshot?, Error>?
    func updates<T: Decodable>(_ reference: DocumentReference, includeMetadataChanges: Bool, type: T.Type) -> AsyncThrowingStream<T?, Error>?
    func changes<T: Decodable>(_ reference: DocumentReference, includeMetadataChanges: Bool, type: T.Type) -> AsyncThrowingStream<(added: [T], modified: [T], removed: [T]), Error>?
    func updates<T: Decodable>(_ query: Query, includeMetadataChanges: Bool, type: T.Type) -> AsyncThrowingStream<[T], Error>?
    func changes<T: Decodable>(_ query: Query, includeMetadataChanges: Bool, type: T.Type) -> AsyncThrowingStream<(added: [T], modified: [T], removed: [T]), Error>?
    func get<T: Decodable>(_ query: Query, source: Source, type: T.Type) async throws -> [T]?
    func get<T: Decodable>(_ reference: DocumentReference, source: Source, type: T.Type) async throws -> T?
    func set(_ data: [String: Any], merge: Bool, reference: DocumentReference) async throws
    func set<T: Encodable>(_ data: T, merge: Bool, reference: DocumentReference) async throws
    func set<T: Encodable>(_ data: T, extensionData: [String: Any], merge: Bool, reference: DocumentReference) async throws
    func update(_ data: [String: Any], reference: DocumentReference) async throws
    func update<T: Encodable>(_ data: T, reference: DocumentReference) async throws
    func update<T: Encodable>(_ data: T, extensionData: [String: Any], reference: DocumentReference) async throws
    func delete(reference: DocumentReference) async throws
    func writeBatch() -> WriteBatch
    func runTransaction(update: @escaping (Transaction, NSErrorPointer) -> Any?, completion: @escaping (Any?, Error?) -> Void)
}

extension Firestore {

    public func updates<T: Decodable>(_ reference: CollectionReference, type: T.Type) -> AsyncThrowingStream<[T], Error>? {
        updates(Query(reference.path), includeMetadataChanges: true, type: type)
    }
    
    public func updates<T: Decodable>(_ query: Query, type: T.Type) -> AsyncThrowingStream<[T], Error>? {
        updates(query, includeMetadataChanges: true, type: type)
    }

    public func changes<T: Decodable>(_ reference: CollectionReference, type: T.Type) -> AsyncThrowingStream<(added: [T], modified: [T], removed: [T]), Error>? {
        changes(Query(reference.path), includeMetadataChanges: true, type: type)
    }
    
    public func changes<T: Decodable>(_ query: Query, type: T.Type) -> AsyncThrowingStream<(added: [T], modified: [T], removed: [T]), Error>? {
        changes(query, includeMetadataChanges: true, type: type)
    }

    public func get<T: Decodable>(_ query: Query, type: T.Type) async throws -> [T]? {
        try await get(query, source: .default, type: type)
    }

    public func get<T: Decodable>(_ reference: DocumentReference, type: T.Type) async throws -> T? {
        try await get(reference, source: .default, type: type)
    }
}

extension Firestore {

    public func set<T: Encodable>(_ data: T, reference: DocumentReference) async throws {
        try await set(data, merge: true, reference: reference)
    }
}

public protocol Queryable: AnyObject {

    associatedtype DataQuery : Queryable

    func setPredicates(_ predicates: [QueryPredicate]) -> DataQuery
}
