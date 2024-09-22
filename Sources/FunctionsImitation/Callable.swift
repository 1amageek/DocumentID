//
//  Callable.swift
//  
//
//  Created by nori on 2022/05/18.
//

import Foundation
import Shared
@_exported import DocumentID

@propertyWrapper
public struct ExplicitNull<Value>: Sendable where Value: Sendable {
    private var value: Value?

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

extension ExplicitNull: Encodable where Value: Encodable & Sendable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        if let value = value {
            try container.encode(value)
        } else {
            try container.encodeNil()
        }
    }
}

extension ExplicitNull: Decodable where Value: Decodable & Sendable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if container.decodeNil() {
            value = nil
        } else {
            value = try container.decode(Value.self)
        }
    }
}
