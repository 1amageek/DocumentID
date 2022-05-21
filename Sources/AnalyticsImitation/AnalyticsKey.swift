//
//  AnalyticsKey.swift
//  
//
//  Created by nori on 2022/05/21.
//

import SwiftUI

struct AnalyticsKey: EnvironmentKey {
    static var defaultValue: Analytics.Type?
}

extension EnvironmentValues {
    public var analytics: Analytics.Type? {
        get { self[AnalyticsKey.self] }
        set { self[AnalyticsKey.self] = newValue }
    }
}
