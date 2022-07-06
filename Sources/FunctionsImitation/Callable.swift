//
//  Callable.swift
//  
//
//  Created by nori on 2022/05/18.
//

import Foundation
@_exported import DocumentID

public struct Callable<Response: Decodable>  {
    
    public var name: String

    public var data: Any?

    public var type: Response.Type

    public init(_ name: String, data: Any? = nil, type: Response.Type) {
        self.name = name
        self.data = data
        self.type = type
    }

    public init(_ name: String, path: String, type: Response.Type) {
        self.name = name
        self.data = ["path": path]
        self.type = type
    }

    public init(_ name: String, query: Query, type: Response.Type) {
        self.name = name
        self.data = query.encode()
        self.type = type
    }
}
