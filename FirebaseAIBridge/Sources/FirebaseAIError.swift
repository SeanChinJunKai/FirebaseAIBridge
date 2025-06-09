//
//  FirebaseAIError.swift
//  FirebaseAIBridge
//
//  Created by Sean Chin on 8/6/25.
//
import Foundation

@objc public class AIError: NSObject {
    @objc public let error: NSError
    
    @objc public let errorCode: FirebaseAIErrorObjc
    
    @objc public init(error: NSError, errorCode: FirebaseAIErrorObjc) {
        self.error = error
        self.errorCode = errorCode
    }
}

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
