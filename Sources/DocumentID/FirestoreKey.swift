//
//  FirestoreKey.swift
//  
//
//  Created by nori on 2022/05/16.
//

import SwiftUI

struct FirestoreKey: EnvironmentKey {
    static var defaultValue: Firestore?
}

extension EnvironmentValues {
    public var firestore: Firestore? {
        get { self[FirestoreKey.self] }
        set { self[FirestoreKey.self] = newValue }
    }
}
