//
//  StorageMetadata.swift
//  
//
//  Created by nori on 2022/06/18.
//

import Foundation

public struct StorageMetadata: Sendable {

    public var cacheControl: String?
    public var contentDisposition: String?
    public var contentEncoding: String?
    public var contentLanguage: String?
    public var contentType: String?
    public var customMetadata: [String: String]?

    public init(
        cacheControl: String? = nil,
        contentDisposition: String? = nil,
        contentEncoding: String? = nil,
        contentLanguage: String? = nil,
        contentType: String? = nil,
        customMetadata: [String: String]? = nil
    ) {
        self.cacheControl = cacheControl
        self.contentDisposition = contentDisposition
        self.contentEncoding = contentEncoding
        self.contentLanguage = contentLanguage
        self.contentType = contentType
        self.customMetadata = customMetadata
    }
}
