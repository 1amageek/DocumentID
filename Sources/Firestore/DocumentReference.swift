//
//  DocumentReference.swift
//  
//
//  Created by nori on 2022/05/16.
//

import Foundation

public struct DocumentReference {

    public var id: String { URLComponents(string: path)!.url!.pathComponents.last! }

    public var path: String

    public init(_ path: String) {
        self.path = path
    }

    public func collection(_ collectionID: String) -> CollectionReference {
        CollectionReference("\(path)/\(collectionID)")
    }
}
