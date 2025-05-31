//
//  BlockReason.swift
//  FirebaseAIBridge
//
//  Created by Sean Chin on 30/5/25.
//
import Foundation
import FirebaseAI

@objc public enum BlockReasonObjc: Int{
    case unknown = 0
    case safety = 1
    case other = 2
    case blocklist = 3
    case prohibitedContent = 4
    
    public static func from(_ reason: PromptFeedback.BlockReason) -> BlockReasonObjc {
        switch reason.rawValue {
        case PromptFeedback.BlockReason.safety.rawValue:
            return .safety
        case PromptFeedback.BlockReason.other.rawValue:
            return .other
        case PromptFeedback.BlockReason.blocklist.rawValue:
            return .blocklist
        case PromptFeedback.BlockReason.prohibitedContent.rawValue:
            return .prohibitedContent
        default:
            return .unknown
        }
    }
}
