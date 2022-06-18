//
//  StorageKey.swift
//  
//
//  Created by nori on 2022/06/19.
//

import SwiftUI

struct StorageKey: EnvironmentKey {
    static var defaultValue: Storage?
}

extension EnvironmentValues {
    public var functions: Storage? {
        get { self[StorageKey.self] }
        set { self[StorageKey.self] = newValue }
    }
}
