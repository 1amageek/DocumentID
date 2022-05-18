//
//  Query.swift
//  
//
//  Created by nori on 2022/05/16.
//

import Foundation

public struct Query {

    public var path: String

    public var predicates: [QueryPredicate]

    public init() {
        self.path = ""
        self.predicates = []
    }

    public init(_ path: String) {
        self.path = path
        self.predicates = []
    }

    public init(_ path: String, predicates: [QueryPredicate]) {
        self.path = path
        self.predicates = predicates
    }

    // Field

    public func `where`(field: String, isEqualTo value: Any) -> Self {
        var predicates = self.predicates
        predicates.append(.isEqualTo(field, value))
        return .init(path, predicates: predicates)
    }

    public func `where`(field: String, isNotEqualTo value: Any) -> Self {
        var predicates = self.predicates
        predicates.append(.isNotEqualTo(field, value))
        return .init(path, predicates: predicates)
    }

    public func `where`(field: String, isLessThan value: Any) -> Self {
        var predicates = self.predicates
        predicates.append(.isLessThan(field, value))
        return .init(path, predicates: predicates)
    }

    public func `where`(field: String, isLessThanOrEqualTo value: Any) -> Self {
        var predicates = self.predicates
        predicates.append(.isLessThanOrEqualTo(field, value))
        return .init(path, predicates: predicates)
    }

    public func `where`(field: String, isGreaterThan value: Any) -> Self {
        var predicates = self.predicates
        predicates.append(.isGreaterThan(field, value))
        return .init(path, predicates: predicates)
    }

    public func `where`(field: String, isGreaterThanOrEqualTo value: Any) -> Self {
        var predicates = self.predicates
        predicates.append(.isGreaterThanOrEqualTo(field, value))
        return .init(path, predicates: predicates)
    }

    public func `where`(field: String, arrayContains value: Any) -> Self {
        var predicates = self.predicates
        predicates.append(.arrayContains(field, value))
        return .init(path, predicates: predicates)
    }

    public func `where`(field: String, arrayContainsAny value: [Any]) -> Self {
        var predicates = self.predicates
        predicates.append(.arrayContainsAny(field, value))
        return .init(path, predicates: predicates)
    }

    public func `where`(field: String, in value: [Any]) -> Self {
        var predicates = self.predicates
        predicates.append(.isIn(field, value))
        return .init(path, predicates: predicates)
    }

    public func `where`(field: String, notIn value: [Any]) -> Self {
        var predicates = self.predicates
        predicates.append(.isNotIn(field, value))
        return .init(path, predicates: predicates)
    }

    public func limit(to value: Int) -> Self {
        var predicates = self.predicates
        predicates.append(.limitTo(value))
        return .init(path, predicates: predicates)
    }

    public func limit(toLast value: Int) -> Self {
        var predicates = self.predicates
        predicates.append(.limitToLast(value))
        return .init(path, predicates: predicates)
    }

    public func order(by field: String, descending value: Bool) -> Self {
        var predicates = self.predicates
        predicates.append(.orderBy(field, value))
        return .init(path, predicates: predicates)
    }

    // DocumentID

    public func `where`(isEqualTo value: Any) -> Self {
        var predicates = self.predicates
        predicates.append(.isEqualToDocumentID(value))
        return .init(path, predicates: predicates)
    }

    public func `where`(isNotEqualTo value: Any) -> Self {
        var predicates = self.predicates
        predicates.append(.isNotEqualToDocumentID(value))
        return .init(path, predicates: predicates)
    }

    public func `where`(isLessThan value: Any) -> Self {
        var predicates = self.predicates
        predicates.append(.isLessThanDocumentID(value))
        return .init(path, predicates: predicates)
    }

    public func `where`(isLessThanOrEqualTo value: Any) -> Self {
        var predicates = self.predicates
        predicates.append(.isLessThanOrEqualToDocumentID(value))
        return .init(path, predicates: predicates)
    }

    public func `where`(isGreaterThan value: Any) -> Self {
        var predicates = self.predicates
        predicates.append(.isGreaterThanDocumentID(value))
        return .init(path, predicates: predicates)
    }

    public func `where`(isGreaterThanOrEqualTo value: Any) -> Self {
        var predicates = self.predicates
        predicates.append(.isGreaterThanOrEqualToDocumentID(value))
        return .init(path, predicates: predicates)
    }

    public func `where`(arrayContains value: Any) -> Self {
        var predicates = self.predicates
        predicates.append(.arrayContainsDocumentID(value))
        return .init(path, predicates: predicates)
    }

    public func `where`(arrayContainsAny value: [Any]) -> Self {
        var predicates = self.predicates
        predicates.append(.arrayContainsAnyDocumentID(value))
        return .init(path, predicates: predicates)
    }

    public func `where`(in value: [Any]) -> Self {
        var predicates = self.predicates
        predicates.append(.isInDocumentID(value))
        return .init(path, predicates: predicates)
    }

    public func `where`(notIn value: [Any]) -> Self {
        var predicates = self.predicates
        predicates.append(.isNotInDocumentID(value))
        return .init(path, predicates: predicates)
    }
}

extension Query: Encodable {

    public func encode() -> [String: Any] {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(dateFormatter)
        let requestData = try! encoder.encode(self)
        let requestObject = try! JSONSerialization.jsonObject(with: requestData, options: .fragmentsAllowed) as! [String: Any]
        return requestObject
    }
}

public enum QueryPredicate {

    // Field
    case isEqualTo(_ field: String, _ value: Any)
    case isNotEqualTo(_ field: String, _ value: Any)
    case isIn(_ field: String, _ values: [Any])
    case isNotIn(_ field: String, _ values: [Any])
    case arrayContains(_ field: String, _ value: Any)
    case arrayContainsAny(_ field: String, _ values: [Any])
    case isLessThan(_ field: String, _ value: Any)
    case isGreaterThan(_ field: String, _ value: Any)
    case isLessThanOrEqualTo(_ field: String, _ value: Any)
    case isGreaterThanOrEqualTo(_ field: String, _ value: Any)
    case orderBy(_ field: String, _ value: Bool)
    case limitTo(_ value: Int)
    case limitToLast(_ value: Int)

    // DocumentID
    case isEqualToDocumentID(_ value: Any)
    case isNotEqualToDocumentID(_ value: Any)
    case isInDocumentID(_ values: [Any])
    case isNotInDocumentID( _ values: [Any])
    case arrayContainsDocumentID(_ value: Any)
    case arrayContainsAnyDocumentID(_ values: [Any])
    case isLessThanDocumentID(_ value: Any)
    case isGreaterThanDocumentID(_ value: Any)
    case isLessThanOrEqualToDocumentID(_ value: Any)
    case isGreaterThanOrEqualToDocumentID(_ value: Any)
}

extension QueryPredicate: Encodable {

    enum CodingKeys: CodingKey {
        case `operator`
        case field
        case value
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
            case .isEqualTo(let field, let value):
                try container.encode("isEqualTo", forKey: .operator)
                try container.encode(field, forKey: .field)
                try container.encode(value, forKey: .value)
            case .isNotEqualTo(let field, let value):
                try container.encode("isNotEqualTo", forKey: .operator)
                try container.encode(field, forKey: .field)
                try container.encode(value, forKey: .value)
            case .isIn(let field, let values):
                try container.encode("isIn", forKey: .operator)
                try container.encode(field, forKey: .field)
                try container.encode(values, forKey: .value)
            case .isNotIn(let field, let values):
                try container.encode("isNotIn", forKey: .operator)
                try container.encode(field, forKey: .field)
                try container.encode(values, forKey: .value)
            case .arrayContains(let field, let value):
                try container.encode("arrayContains", forKey: .operator)
                try container.encode(field, forKey: .field)
                try container.encode(value, forKey: .value)
            case .arrayContainsAny(let field, let values):
                try container.encode("arrayContainsAny", forKey: .operator)
                try container.encode(field, forKey: .field)
                try container.encode(values, forKey: .value)
            case .isLessThan(let field, let value):
                try container.encode("isLessThan", forKey: .operator)
                try container.encode(field, forKey: .field)
                try container.encode(value, forKey: .value)
            case .isGreaterThan(let field, let value):
                try container.encode("isGreaterThan", forKey: .operator)
                try container.encode(field, forKey: .field)
                try container.encode(value, forKey: .value)
            case .isLessThanOrEqualTo(let field, let value):
                try container.encode("isLessThanOrEqualTo", forKey: .operator)
                try container.encode(field, forKey: .field)
                try container.encode(value, forKey: .value)
            case .isGreaterThanOrEqualTo(let field, let value):
                try container.encode("isGreaterThanOrEqualTo", forKey: .operator)
                try container.encode(field, forKey: .field)
                try container.encode(value, forKey: .value)
            case .orderBy(let field, let value):
                try container.encode("orderBy", forKey: .operator)
                try container.encode(field, forKey: .field)
                try container.encode(value, forKey: .value)
            case .limitTo(let value):
                try container.encode("limitTo", forKey: .operator)
                try container.encodeNil(forKey: .field)
                try container.encode(value, forKey: .value)
            case .limitToLast(let value):
                try container.encode("limitToLast", forKey: .operator)
                try container.encodeNil(forKey: .field)
                try container.encode(value, forKey: .value)
            case .isEqualToDocumentID(let value):
                try container.encode("isEqualTo", forKey: .operator)
                try container.encode("_documentID", forKey: .field)
                try container.encode(value, forKey: .value)
            case .isNotEqualToDocumentID(let value):
                try container.encode("isNotEqualTo", forKey: .operator)
                try container.encode("_documentID", forKey: .field)
                try container.encode(value, forKey: .value)
            case .isInDocumentID(let values):
                try container.encode("isIn", forKey: .operator)
                try container.encode("_documentID", forKey: .field)
                try container.encode(values, forKey: .value)
            case .isNotInDocumentID(let values):
                try container.encode("isNotIn", forKey: .operator)
                try container.encode("_documentID", forKey: .field)
                try container.encode(values, forKey: .value)
            case .arrayContainsDocumentID(let value):
                try container.encode("arrayContains", forKey: .operator)
                try container.encode("_documentID", forKey: .field)
                try container.encode(value, forKey: .value)
            case .arrayContainsAnyDocumentID(let value):
                try container.encode("arrayContainsAny", forKey: .operator)
                try container.encode("_documentID", forKey: .field)
                try container.encode(value, forKey: .value)
            case .isLessThanDocumentID(let value):
                try container.encode("isLessThan", forKey: .operator)
                try container.encode("_documentID", forKey: .field)
                try container.encode(value, forKey: .value)
            case .isGreaterThanDocumentID(let value):
                try container.encode("isGreaterThan", forKey: .operator)
                try container.encode("_documentID", forKey: .field)
                try container.encode(value, forKey: .value)
            case .isLessThanOrEqualToDocumentID(let value):
                try container.encode("isLessThanOrEqualTo", forKey: .operator)
                try container.encode("_documentID", forKey: .field)
                try container.encode(value, forKey: .value)
            case .isGreaterThanOrEqualToDocumentID(let value):
                try container.encode("isGreaterThanOrEqualTo", forKey: .operator)
                try container.encode("_documentID", forKey: .field)
                try container.encode(value, forKey: .value)
        }
    }
}

extension KeyedEncodingContainer where Key : CodingKey {

    fileprivate mutating func encode(_ value: Any, forKey key: KeyedEncodingContainer<K>.Key) throws {
        if let value = value as? String {
            try encode(value, forKey: key)
        } else if let value = value as? Int {
            try encode(value, forKey: key)
        } else if let value = value as? Double {
            try encode(value, forKey: key)
        }
    }

    fileprivate mutating func encode(_ value: [Any], forKey key: KeyedEncodingContainer<K>.Key) throws {
        if let value = value as? [String] {
            try encode(value, forKey: key)
        } else if let value = value as? [Int] {
            try encode(value, forKey: key)
        } else if let value = value as? [Double] {
            try encode(value, forKey: key)
        }
    }
}
