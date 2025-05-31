//
//  HarmSeverity.swift
//  FirebaseAIBridge
//
//  Created by Sean  Chin on 30/5/25.
//
import Foundation
import FirebaseAI

@objc public enum HarmSeverityObjc: Int {
    case unknown = 0
    case negligible = 1
    case low = 2
    case medium = 3
    case high = 4
    
    public static func from (_ harmSeverity: SafetyRating.HarmSeverity) -> HarmSeverityObjc {
        switch harmSeverity.rawValue {
        case SafetyRating.HarmSeverity.negligible.rawValue:
            return .negligible
        case SafetyRating.HarmSeverity.low.rawValue:
            return .low
        case SafetyRating.HarmSeverity.medium.rawValue:
            return .medium
        case SafetyRating.HarmSeverity.high.rawValue:
            return .high
        default:
            return .unknown
        }
    }
}
