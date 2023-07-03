//
//  AggregateQuerySnapshot.swift
//  
//
//  Created by Norikazu Muramoto on 2023/07/03.
//

import Foundation

public struct AggregateQuerySnapshot {

    public var query: AggregateQuery

    public var count: Int

    public init(query: AggregateQuery, count: Int) {
        self.query = query
        self.count = count
    }
}
