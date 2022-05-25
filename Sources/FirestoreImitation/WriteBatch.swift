//
//  WriteBatch.swift
//  
//
//  Created by nori on 2022/05/25.
//

import Foundation

public struct WriteBatch {

    public var delegate: WriteBatchDelegate?

    public init(delegate: WriteBatchDelegate) {
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

    public func commit() async throws {
        try await self.delegate?.commit()
    }
}

public protocol WriteBatchDelegate {
    func setData<T: Encodable>(_ data: T, for document: DocumentReference, merge: Bool) throws
    func updateData<T: Encodable>(_ data: T, for document: DocumentReference) throws
    func deleteDocument(_ document: DocumentReference)
    func commit() async throws
}
