//
//  Transaction.swift
//  
//
//  Created by nori on 2022/05/26.
//

import Foundation

public struct Transaction {

    public var delegate: TransactionDelegate?

    public init(delegate: TransactionDelegate) {
        self.delegate = delegate
    }

    public func setData<T: Encodable>(_ data: T, forDocument: DocumentReference, merge: Bool = true) throws {
        try self.delegate?.setData(data, for: forDocument, merge: merge)
    }

    public func updateData<T: Encodable>(_ data: T, forDocument: DocumentReference) throws {
        try self.delegate?.updateData(data, for: forDocument)
    }

    public func deleteDocument(_ document: DocumentReference) {
        self.delegate?.deleteDocument(document)
    }

    public func getDocument<T: Decodable>(_ document: DocumentReference, type: T.Type) async throws -> T? {
        try await self.delegate?.getDocument(document, type: type)
    }
}

public protocol TransactionDelegate {
    func setData<T: Encodable>(_ data: T, for document: DocumentReference, merge: Bool) throws
    func updateData<T: Encodable>(_ data: T, for document: DocumentReference) throws
    func deleteDocument(_ document: DocumentReference)
    func getDocument<T: Decodable>(_ document: DocumentReference, type: T.Type) async throws -> T?
}
