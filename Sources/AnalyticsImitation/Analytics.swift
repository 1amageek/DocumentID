//
//  Analytics.swift
//  
//
//  Created by nori on 2022/05/21.
//

import Foundation

public protocol Analytics {

    static func setUserID(_ userID: String)
    static func setUserProperty(_ value: String?, for name: String)
    static func logEvent(name: String, parameters: [String: Any]?)
    static func setSessionTimeoutInterval(_ sessionTimeoutInterval: TimeInterval)
    static func resetAnalyticsData()
    static func setDefaultEventParameters(_ parameters: [String: Any]?)
}

extension Analytics {

    static func logEvent(name: String) {
        logEvent(name: name, parameters: nil)
    }

    static func setDefaultEventParameters() {
        setDefaultEventParameters(nil)
    }
}
