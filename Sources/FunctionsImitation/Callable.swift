//
//  Callable.swift
//  
//
//  Created by nori on 2022/05/18.
//

import Foundation

public struct Callable<Response: Decodable>  {
    
    public var name: String

    public var data: [String: Any]

    public var type: Response.Type

    public init(_ name: String, data: [String: Any], type: Response.Type) {
        self.name = name
        self.data = data
        self.type = type
    }
}
