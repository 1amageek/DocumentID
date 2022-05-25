//
//  WriteBatch.swift
//  
//
//  Created by nori on 2022/05/25.
//

import Foundation

public struct WriteBatch {

    public var delegate: WriteBatchDelegate?

    public func setData<T: Decodable>(_ data: T, forDocument: DocumentReference, merge: Bool = true) {
        self.delegate?.setData(data, forDocument: forDocument, merge: merge)
    }

    public func updateData<T: Decodable>(_ data: T, forDocument: DocumentReference) {
        self.delegate?.updateData(data, forDocument: forDocument)
    }

    public func deleteDocument(_ document: DocumentReference) {
        self.delegate?.deleteDocument(document)
    }

    public func commit() async throws {
        try await self.delegate?.commit()
    }
}

public protocol WriteBatchDelegate {
    func setData<T: Decodable>(_ data: T, forDocument: DocumentReference, merge: Bool)
    func updateData<T: Decodable>(_ data: T, forDocument: DocumentReference)
    func deleteDocument(_ document: DocumentReference)
    func commit() async throws
}
