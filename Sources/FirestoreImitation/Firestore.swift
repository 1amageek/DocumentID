//
//  Firestore.swift
//  
//
//  Created by nori on 2022/05/16.
//

import Foundation

public enum Source {
    case `default`
    case server
    case cache
}

public protocol Firestore {
    func updates<T: Decodable>(_ query: Query, type: T.Type) -> AsyncThrowingStream<[T], Error>?
    func changes<T: Decodable>(_ query: Query, type: T.Type) -> AsyncThrowingStream<(added: [T], modified: [T], removed: [T]), Error>?
    func get<T: Decodable>(_ query: Query, source: Source, type: T.Type) async throws -> [T]?
    func get<T: Decodable>(_ reference: DocumentReference, source: Source, type: T.Type) async throws -> T?
    func create<T: Encodable & Identifiable>(_ data: T, reference: DocumentReference) async throws
    func update<T: Encodable & Identifiable>(before: T?, after: T, reference: DocumentReference) async throws
    func delete<T: Encodable & Identifiable>(_ data: T, reference: DocumentReference) async throws
}

extension Firestore {

    public func get<T: Decodable>(_ query: Query, type: T.Type) async throws -> [T]? {
        try await get(query, source: .default, type: type)
    }

    public func get<T: Decodable>(_ reference: DocumentReference, type: T.Type) async throws -> T? {
        try await get(reference, source: .default, type: type)
    }
}

public protocol Queryable: AnyObject {

    associatedtype DataQuery : Queryable

    func setPredicates(_ predicates: [QueryPredicate]) -> DataQuery
}
