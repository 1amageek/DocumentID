//
//  StorageReference.swift
//  
//
//  Created by nori on 2022/06/18.
//

import Foundation

public struct StorageReference {

    public var path: String

    public var name: String

    public var fullPath: String {
        let path = URLComponents(string: path)!.url!.pathComponents
            .filter({ $0 != "/" })
            .joined(separator: "/")
        return "\(path)/\(name)"
    }

    public init(_ path: String, name: String) {
        self.path = path
        self.name = name
    }

    public var root: StorageReference {
        StorageReference("/", name: name)
    }

    public var parent: StorageReference? {
        let path = URLComponents(string: path)!.url!.pathComponents
            .filter({ $0 != "/" })
            .dropLast()
            .joined(separator: "/")
        return StorageReference(path, name: name)
    }

    public func child(_ id: String) -> StorageReference {
        StorageReference("\(path)/\(id)", name: name)
    }
}
