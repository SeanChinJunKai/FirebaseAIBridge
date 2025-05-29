//
//  SafetyRatingObjc.swift
//  FirebaseAIBridge
//
//  Created by Sean  Chin on 29/5/25.
//
import Foundation
import FirebaseAI

@objcMembers
public class SafetyRatingObjc: NSObject {
    public let category: HarmCategoryObjc
     
    public let probability: HarmProbabilityObjc
    
    public let probabilityScore: Float
    
    public let severity: HarmSeverityObjc
    
    public let severityScore: Float
    
    public let blocked: Bool
    
    public init(category: HarmCategoryObjc,
                probability: HarmProbabilityObjc,
                probabilityScore: Float,
                severity: HarmSeverityObjc,
                severityScore: Float,
                blocked: Bool) {
        self.category = category
        self.probability = probability
        self.probabilityScore = probabilityScore
        self.severity = severity
        self.severityScore = severityScore
        self.blocked = blocked
    }
    
    public static func from(_ safetyRating: SafetyRating) -> SafetyRatingObjc {
        return SafetyRatingObjc(
            category: HarmCategoryObjc.from(safetyRating.category),
            probability: HarmProbabilityObjc.from(safetyRating.probability),
            probabilityScore: safetyRating.probabilityScore,
            severity: HarmSeverityObjc.from(safetyRating.severity),
            severityScore: safetyRating.severityScore,
            blocked: safetyRating.blocked
        )
    }
}

@objcMembers
public class HarmCategoryObjc: NSObject {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public static func from(_ harmCategory: HarmCategory) -> HarmCategoryObjc {
        return HarmCategoryObjc(rawValue: harmCategory.rawValue)
    }
}

@objcMembers
public class HarmProbabilityObjc: NSObject {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public static func from(_ harmProbability: SafetyRating.HarmProbability) -> HarmProbabilityObjc {
        return HarmProbabilityObjc(rawValue: harmProbability.rawValue)
    }
    
}

@objcMembers
public class HarmSeverityObjc: NSObject {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public static func from (_ harmSeverity: SafetyRating.HarmSeverity) -> HarmSeverityObjc {
        return HarmSeverityObjc(rawValue: harmSeverity.rawValue)
    }
}

