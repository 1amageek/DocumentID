//
//  AggregateQuery.swift
//  
//
//  Created by Norikazu Muramoto on 2023/07/03.
//

import Foundation

public struct AggregateQuery: Sendable {

    public var query: Query

    init(_ query: Query) {
        self.query = query
    }
}
