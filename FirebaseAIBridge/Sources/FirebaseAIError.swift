//
//  FirebaseAIError.swift
//  FirebaseAIBridge
//
//  Created by Sean Chin on 8/6/25.
//

@objc public enum FirebaseAIErrorObjc: Int {
    case server = 0
    case promptBlocked = 1
    case responseStopped = 2
    case serialization = 3
    case invalidAPIKey = 4
    case quotaExceeded = 5
    case unsupportedUserLocation = 6
    case serviceDisabled = 7
    case contentBlocked = 8
}
