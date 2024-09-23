//
//  FieldValue.swift
//  
//
//  Created by nori on 2022/05/24.
//

import Foundation

public enum FieldValue: @unchecked Sendable {
    case delete
    case serverTimestamp
    case arrayUnion([Any])
    case arrayRemove([Any])
    case increment(Double)
}

extension FieldValue: Encodable {
    public func encode(to encoder: Encoder) throws {
        try FieldValueEncoder.shared.delegate?.encode(self, to: encoder)
    }
}

public class FieldValueEncoder {
    nonisolated(unsafe) public static let shared: FieldValueEncoder = FieldValueEncoder()
    public weak var delegate: FieldValueEncodable?
    public func setDelegate(_ delegate: FieldValueEncodable?) {
        self.delegate = delegate
    }
}

public protocol FieldValueEncodable: AnyObject {
    func encode(_ value: FieldValue, to encoder: Encoder) throws
}
