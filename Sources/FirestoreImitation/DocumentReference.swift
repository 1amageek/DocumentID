//
//  DocumentReference.swift
//  
//
//  Created by nori on 2022/05/16.
//

import Foundation

public struct DocumentReference: Hashable, Sendable {

    public var id: String { URLComponents(string: path)!.url!.pathComponents.last! }

    public var path: String

    public init(_ path: String) {
        self.path = path
    }

    public func collection(_ collectionID: String) -> CollectionReference {
        CollectionReference("\(path)/\(collectionID)")
    }

    public var parent: CollectionReference {
        let path = URLComponents(string: path)!.url!.pathComponents
            .filter({ $0 != "/" })
            .dropLast()
            .joined(separator: "/")
        return CollectionReference(path)
    }
}
