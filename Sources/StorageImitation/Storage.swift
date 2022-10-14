//
//  Storage.swift
//  
//
//  Created by nori on 2022/06/17.
//

import Foundation

public protocol Storage {
    func putData(ref: StorageReference, data: Data, metadata: StorageMetadata) async throws
    func getData(ref: StorageReference, maxSize: Int64) async throws -> Data?
    func delete(ref: StorageReference) async throws
}
