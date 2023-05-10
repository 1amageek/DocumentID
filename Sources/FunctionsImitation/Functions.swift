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
