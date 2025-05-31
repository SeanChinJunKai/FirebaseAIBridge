//
//  HarmCategory.swift
//  FirebaseAIBridge
//
//  Created by Sean Chin on 30/5/25.
//
import Foundation
import FirebaseAI

@objc public enum HarmCategoryObjc: Int {
    case unknown = 0
    case harassment = 1
    case hateSpeech = 2
    case sexuallyExplicit = 3
    case dangerousContent = 4
    case civicIntegrity = 5
    
    public static func from(_ harmCategory: HarmCategory) -> HarmCategoryObjc {
        switch harmCategory.rawValue {
        case HarmCategory.harassment.rawValue:
            return .harassment
        case HarmCategory.hateSpeech.rawValue:
            return .hateSpeech
        case HarmCategory.sexuallyExplicit.rawValue:
            return .sexuallyExplicit
        case HarmCategory.dangerousContent.rawValue:
            return .dangerousContent
        case HarmCategory.civicIntegrity.rawValue:
            return .civicIntegrity
        default:
            return .unknown
        }
    }
}
