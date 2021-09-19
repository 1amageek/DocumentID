//
//  ExplicitNull.swift
//  
//
//  Created by nori on 2021/09/19.
//

import Foundation

/// Wraps an `Optional` field in a `Codable` object such that when the field
/// has a `nil` value it will encode to a null value in Firestore. Normally,
/// optional fields are omitted from the encoded document.
///
/// This is useful for ensuring a field is present in a Firestore document,
/// even when there is no associated value.
@propertyWrapper
public struct ExplicitNull<Value> {
    var value: Value?

    public init(wrappedValue value: Value?) {
        self.value = value
    }

    public var wrappedValue: Value? {
        get { value }
        set { value = newValue }
    }
}

extension ExplicitNull: Equatable where Value: Equatable {}

extension ExplicitNull: Hashable where Value: Hashable {}

extension ExplicitNull: Encodable where Value: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        if let value = value {
            try container.encode(value)
        } else {
            try container.encodeNil()
        }
    }
}

extension ExplicitNull: Decodable where Value: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if container.decodeNil() {
            value = nil
        } else {
            value = try container.decode(Value.self)
        }
    }
}
