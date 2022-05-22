//
//  CollectionReference.swift
//  
//
//  Created by nori on 2022/05/17.
//

import Foundation
import DocumentID

public struct CollectionReference {

    public var collectionID: String { URLComponents(string: path)!.url!.pathComponents.last! }

    public var path: String

    private var predicates: [QueryPredicate]

    public init(_ path: String) {
        self.path = path
        self.predicates = []
    }

    public func document(_ id: String = AutoID.generate()) -> DocumentReference {
        DocumentReference("\(path)/\(id)")
    }

    public var parent: DocumentReference? {
        let pathComponents = URLComponents(string: path)!.url!.pathComponents.filter({ $0 != "/" })
        if pathComponents.count <= 1 {
            return nil
        }
        let path = pathComponents
            .dropLast()
            .joined(separator: "/")
        return DocumentReference(path)
    }
}

extension CollectionReference {

    public func `where`(field: String, isEqualTo value: Any) -> Query {
        var predicates = self.predicates
        predicates.append(.isEqualTo(field, value))
        return .init(path, predicates: predicates)
    }

    public func `where`(field: String, isNotEqualTo value: Any) -> Query {
        var predicates = self.predicates
        predicates.append(.isNotEqualTo(field, value))
        return .init(path, predicates: predicates)
    }

    public func `where`(field: String, isLessThan value: Any) -> Query {
        var predicates = self.predicates
        predicates.append(.isLessThan(field, value))
        return .init(path, predicates: predicates)
    }

    public func `where`(field: String, isLessThanOrEqualTo value: Any) -> Query {
        var predicates = self.predicates
        predicates.append(.isLessThanOrEqualTo(field, value))
        return .init(path, predicates: predicates)
    }

    public func `where`(field: String, isGreaterThan value: Any) -> Query {
        var predicates = self.predicates
        predicates.append(.isGreaterThan(field, value))
        return .init(path, predicates: predicates)
    }

    public func `where`(field: String, isGreaterThanOrEqualTo value: Any) -> Query {
        var predicates = self.predicates
        predicates.append(.isGreaterThanOrEqualTo(field, value))
        return .init(path, predicates: predicates)
    }

    public func `where`(field: String, arrayContains value: Any) -> Query {
        var predicates = self.predicates
        predicates.append(.arrayContains(field, value))
        return .init(path, predicates: predicates)
    }

    public func `where`(field: String, arrayContainsAny value: [Any]) -> Query {
        var predicates = self.predicates
        predicates.append(.arrayContainsAny(field, value))
        return .init(path, predicates: predicates)
    }

    public func `where`(field: String, in value: [Any]) -> Query {
        var predicates = self.predicates
        predicates.append(.isIn(field, value))
        return .init(path, predicates: predicates)
    }

    public func `where`(field: String, notIn value: [Any]) -> Query {
        var predicates = self.predicates
        predicates.append(.isNotIn(field, value))
        return .init(path, predicates: predicates)
    }

    public func limit(to value: Int) -> Query {
        var predicates = self.predicates
        predicates.append(.limitTo(value))
        return .init(path, predicates: predicates)
    }

    public func limit(toLast value: Int) -> Query {
        var predicates = self.predicates
        predicates.append(.limitToLast(value))
        return .init(path, predicates: predicates)
    }

    public func order(by field: String, descending value: Bool) -> Query {
        var predicates = self.predicates
        predicates.append(.orderBy(field, value))
        return .init(path, predicates: predicates)
    }

    // DocumentID

    public func `where`(isEqualTo value: Any) -> Query {
        var predicates = self.predicates
        predicates.append(.isEqualToDocumentID(value))
        return .init(path, predicates: predicates)
    }

    public func `where`(isNotEqualTo value: Any) -> Query {
        var predicates = self.predicates
        predicates.append(.isNotEqualToDocumentID(value))
        return .init(path, predicates: predicates)
    }

    public func `where`(isLessThan value: Any) -> Query {
        var predicates = self.predicates
        predicates.append(.isLessThanDocumentID(value))
        return .init(path, predicates: predicates)
    }

    public func `where`(isLessThanOrEqualTo value: Any) -> Query {
        var predicates = self.predicates
        predicates.append(.isLessThanOrEqualToDocumentID(value))
        return .init(path, predicates: predicates)
    }

    public func `where`(isGreaterThan value: Any) -> Query {
        var predicates = self.predicates
        predicates.append(.isGreaterThanDocumentID(value))
        return .init(path, predicates: predicates)
    }

    public func `where`(isGreaterThanOrEqualTo value: Any) -> Query {
        var predicates = self.predicates
        predicates.append(.isGreaterThanOrEqualToDocumentID(value))
        return .init(path, predicates: predicates)
    }

    public func `where`(arrayContains value: Any) -> Query {
        var predicates = self.predicates
        predicates.append(.arrayContainsDocumentID(value))
        return .init(path, predicates: predicates)
    }

    public func `where`(arrayContainsAny value: [Any]) -> Query {
        var predicates = self.predicates
        predicates.append(.arrayContainsAnyDocumentID(value))
        return .init(path, predicates: predicates)
    }

    public func `where`(in value: [Any]) -> Query {
        var predicates = self.predicates
        predicates.append(.isInDocumentID(value))
        return .init(path, predicates: predicates)
    }

    public func `where`(notIn value: [Any]) -> Query {
        var predicates = self.predicates
        predicates.append(.isNotInDocumentID(value))
        return .init(path, predicates: predicates)
    }
}
