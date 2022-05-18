//
//  FunctionsKey.swift
//  
//
//  Created by nori on 2022/05/18.
//

import SwiftUI

struct FunctionsKey: EnvironmentKey {
    static var defaultValue: Functions?
}

extension EnvironmentValues {
    public var functions: Functions? {
        get { self[FunctionsKey.self] }
        set { self[FunctionsKey.self] = newValue }
    }
}
