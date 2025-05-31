//
//  HarmProbability.swift
//  FirebaseAIBridge
//
//  Created by Sean  Chin on 30/5/25.
//
import Foundation
import FirebaseAI

@objc public enum HarmProbabilityObjc: Int {
    case unknown = 0
    case negligible = 1
    case low = 2
    case medium = 3
    case high = 4
    
    public static func from(_ harmProbability: SafetyRating.HarmProbability) -> HarmProbabilityObjc {
        switch harmProbability.rawValue {
        case SafetyRating.HarmProbability.negligible.rawValue:
            return .negligible
        case SafetyRating.HarmProbability.low.rawValue:
            return .low
        case SafetyRating.HarmProbability.medium.rawValue:
            return .medium
        case SafetyRating.HarmProbability.high.rawValue:
            return .high
        default:
            return .unknown
        }
    }
}
