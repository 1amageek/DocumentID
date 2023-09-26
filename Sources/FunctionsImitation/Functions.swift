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

extension DateFormatter {

    public static func iso8601() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return dateFormatter
    }

    public static func extendedDateTimeWithMillis() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter
    }
}

extension JSONDecoder {

    public static func custom(_ handler: (inout JSONDecoder) -> Void) -> JSONDecoder {
        var decoder = JSONDecoder()
        handler(&decoder)
        return decoder
    }
}
