//
//  DocumentID.swift
//  DocumentID
//
//  Created by nori on 2021/09/17.
//

import Foundation

public protocol IDGeneratable: Identifiable where ID == String {

    static func generateID() -> ID

    static func generateID(characters: String, length: Int) -> ID
}

extension IDGeneratable {

    public static func generateID() -> ID { AutoID.generate(characters: AutoID.availableCharacters, length: AutoID.length) }

    public static func generateID(characters: String = AutoID.availableCharacters, length: Int = AutoID.length) -> ID { AutoID.generate(characters: characters, length: length) }
}

@propertyWrapper
public struct DocumentID<Value>: Hashable, Sendable where Value: Hashable & Sendable {

    private var value: Value

    public init(wrappedValue value: Value) {
        self.value = value
    }

    public var wrappedValue: Value {
        get { value }
        set { value = newValue }
    }

    public static func == (lhs: DocumentID<Value>, rhs: DocumentID<Value>) -> Bool {
        return lhs.value == rhs.value
    }
}

public enum DocumentIDDecodingError: Error {
    case decodingIsNotSupported(String)
}

public enum DocumentIDEncodingError: Error {
    case encodingIsNotSupported(String)
}

extension DocumentID: Codable where Value == String {

    // MARK: - `Codable` implementation.

    public init(from decoder: Decoder) throws {
        do {
            let container = try decoder.singleValueContainer()
            let id = try container.decode(String.self)
            self = DocumentID(wrappedValue: id)
        } catch {
            throw DocumentIDDecodingError.decodingIsNotSupported("DocumentID values can only be decoded with Firestore.Decoder")
        }
    }

    public func encode(to encoder: Encoder) throws {
        do {
            var container = encoder.singleValueContainer()
            try container.encode(self.wrappedValue)
        } catch {
            throw DocumentIDEncodingError.encodingIsNotSupported("DocumentID values can only be encoded with Firestore.Encoder")
        }
    }
}
