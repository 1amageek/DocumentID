//
//  StorageKey.swift
//  
//
//  Created by nori on 2022/06/19.
//

import SwiftUI

struct StorageKey: EnvironmentKey {
    nonisolated(unsafe) static var defaultValue: Storage?
}

extension EnvironmentValues {
    public var storage: Storage? {
        get { self[StorageKey.self] }
        set { self[StorageKey.self] = newValue }
    }
}
