//
//  Analytics.swift
//  
//
//  Created by nori on 2022/05/21.
//

import Foundation

public protocol Analytics {

    static func logEvent(_ name: String, parameters: [String: Any]?)
    static func setUserProperty(_ value: String?, forName name: String)
    static func setUserID(_ userID: String?)
    static func setAnalyticsCollectionEnabled(_ analyticsCollectionEnabled: Bool)
    static func setSessionTimeoutInterval(_ sessionTimeoutInterval: TimeInterval)
    static func appInstanceID() -> String?
    static func resetAnalyticsData()
    static func setDefaultEventParameters(_ parameters: [String: Any]?)
}

extension Analytics {

    static func logEvent(_ name: String) {
        logEvent(name, parameters: nil)
    }

    static func setDefaultEventParameters() {
        setDefaultEventParameters(nil)
    }
}
