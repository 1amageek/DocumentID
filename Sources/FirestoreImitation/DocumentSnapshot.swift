//
//  DocumentSnapshot.swift
//  
//
//  Created by Norikazu Muramoto on 2022/09/05.
//

import Foundation

public struct SnapshotMetadata {
    
    public private(set) var hasPendingWrites: Bool
    public private(set) var isFromCache: Bool
    
    public init(pendingWrites: Bool, fromCache: Bool) {
        self.hasPendingWrites = pendingWrites
        self.isFromCache = fromCache
    }
}

public enum ServerTimestampBehavior: Int {
    case none
    case estimate
    case previous
}

public struct DocumentSnapshot {
    public var exists: Bool { data != nil }
    public private(set) var reference: DocumentReference
    public var documentID: String { reference.id }
    public private(set) var metadata: SnapshotMetadata
    public private(set) var data: [String: Any]?
    public func get(_ field: String) -> Any? { data?[field] }
    
    public init(reference: DocumentReference, data: [String: Any]?, metadata: SnapshotMetadata) {
        self.reference = reference
        self.data = data
        self.metadata = metadata
    }
}
