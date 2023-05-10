//
//  Functions.swift
//  
//
//  Created by nori on 2022/05/18.
//

import Foundation

public protocol Functions {

    func call<T: Decodable>(_ callable: Callable<T>, decoder: JSONDecoder) async throws -> T?

    func request<T: Decodable>(url: URL, type: T.Type, decoder: JSONDecoder) async throws -> T?
}

extension Functions {

    public static func iso8601() -> JSONDecoder {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }

    public static func rfc822() -> JSONDecoder {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }
}
