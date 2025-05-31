//
//  FinishReason.swift
//  FirebaseAIBridge
//
//  Created by Sean Chin on 30/5/25.
//
import Foundation
import FirebaseAI

@objc public enum FinishReasonObjc: Int {
    case unknown = 0
    case stop = 1
    case maxTokens = 2
    case safety = 3
    case recitation = 4
    case other = 5
    case blocklist = 6
    case prohibitedContent = 7
    case spii = 8
    case malformedFunctionCall = 9
    
    public static func from(_ finishReason: FinishReason) -> FinishReasonObjc {
        switch finishReason.rawValue {
        case FinishReason.stop.rawValue:
            return .stop
        case FinishReason.maxTokens.rawValue:
            return .maxTokens
        case FinishReason.safety.rawValue:
            return .safety
        case FinishReason.recitation.rawValue:
            return .recitation
        case FinishReason.other.rawValue:
            return .other
        case FinishReason.blocklist.rawValue:
            return .blocklist
        case FinishReason.prohibitedContent.rawValue:
            return .prohibitedContent
        case FinishReason.spii.rawValue:
            return .spii
        case FinishReason.malformedFunctionCall.rawValue:
            return .malformedFunctionCall
        default:
            return .unknown
        }
    }
}

