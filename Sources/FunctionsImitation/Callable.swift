//
//  Callable.swift
//  
//
//  Created by nori on 2022/05/18.
//

import Foundation
import Shared
@_exported import DocumentID

public struct Callable<Response: Decodable>  {
    
    public enum EndpointType {
        case name(String)
        case url(URL)
    }
    
    public var endpoint: EndpointType

    public var data: Any?

    public var type: Response.Type

    public init(_ name: String, data: Any? = nil, type: Response.Type) {
        self.endpoint = .name(name)
        self.data = data
        self.type = type
    }
    
    public init<Request: Encodable>(_ name: String, request: Request, type: Response.Type) throws {
        self.endpoint = .name(name)
        let encoder = FirebaseDataEncoder()
        encoder.dateEncodingStrategy = .formatted(.extendedDateTimeWithMillis())
        self.data = try encoder.encode(request)
        self.type = type
    }

    public init(_ name: String, path: String, type: Response.Type) {
        self.endpoint = .name(name)
        self.data = ["path": path]
        self.type = type
    }

    public init(_ name: String, query: Query, type: Response.Type) {
        self.endpoint = .name(name)
        self.data = query.encode()
        self.type = type
    }
    
    public init(_ url: URL, data: Any? = nil, type: Response.Type) {
        self.endpoint = .url(url)
        self.data = data
        self.type = type
    }
    
    public init<Request: Encodable>(_ url: URL, request: Request, type: Response.Type) throws {
        self.endpoint = .url(url)
        let encoder = FirebaseDataEncoder()
        encoder.dateEncodingStrategy = .formatted(.extendedDateTimeWithMillis())
        self.data = try encoder.encode(request)
        self.type = type
    }

    public init(_ url: URL, path: String, type: Response.Type) {
        self.endpoint = .url(url)
        self.data = ["path": path]
        self.type = type
    }

    public init(_ url: URL, query: Query, type: Response.Type) {
        self.endpoint = .url(url)
        self.data = query.encode()
        self.type = type
    }
}
