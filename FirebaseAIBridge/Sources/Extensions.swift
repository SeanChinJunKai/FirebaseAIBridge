//
//  Extensions.swift
//  FirebaseAIBridge
//
//  Created by Sean  Chin on 8/6/25.
//

import Foundation
import FirebaseAI

extension Error {
    func toNSError() -> NSError {
        if let decodingError = self as? DecodingError {
            return decodingError.toNSError()
        }

        if let generateContentError = self as? GenerateContentError {
            return generateContentError.toNSError()
        }

        let message = self.localizedDescription

        switch message {
        case _ where message.contains("API key not valid"):
            return NSError(
                domain: "FirebaseAIBridge",
                code: FirebaseAIErrorObjc.invalidAPIKey.rawValue,
                userInfo: [
                    NSLocalizedDescriptionKey: message
                ]
            )
        case _ where message.contains("quota"):
            return NSError(
                domain: "FirebaseAIBridge",
                code: FirebaseAIErrorObjc.quotaExceeded.rawValue,
                userInfo: [
                    NSLocalizedDescriptionKey: message
                ]
            )
        case _ where message == "User location is not supported for the API use.":
            return NSError(
                domain: "FirebaseAIBridge",
                code: FirebaseAIErrorObjc.unsupportedUserLocation.rawValue,
                userInfo: [
                    NSLocalizedDescriptionKey: message
                ]
            )
        case _ where message.starts(with: "Vertex AI in Firebase API has not been used in project"):
            return NSError(
                domain: "FirebaseAIBridge",
                code: FirebaseAIErrorObjc.serviceDisabled.rawValue,
                userInfo: [
                    NSLocalizedDescriptionKey: message
                ]
            )
        default:
            return NSError(
                domain: "FirebaseAIBridge",
                code: FirebaseAIErrorObjc.server.rawValue,
                userInfo: [
                    NSLocalizedDescriptionKey: message
                ]
            )
        }
    }
}

extension DecodingError {
    func toNSError() -> NSError {
        return NSError(
            domain: "FirebaseAIBridge",
            code: FirebaseAIErrorObjc.serialization.rawValue,
            userInfo: [
                NSLocalizedDescriptionKey: self.localizedDescription
            ]
        )
    }
}


extension GenerateContentError {
    func toNSError() -> NSError {
        switch self {
        case .promptBlocked(let response):
            return NSError(
                domain: "FirebaseAIBridge",
                code: FirebaseAIErrorObjc.promptBlocked.rawValue,
                userInfo: [
                    NSLocalizedDescriptionKey: "Prompt was blocked: \(response.promptFeedback?.blockReason?.rawValue ?? "Unknown reason")",
                    "response": GenerateContentResponseObjc.from(response)
                ]
            )
        case .responseStoppedEarly(let reason, let response):
            return NSError(
                domain: "FirebaseAIBridge",
                code: FirebaseAIErrorObjc.responseStopped.rawValue,
                userInfo: [
                    NSLocalizedDescriptionKey: "Content generation stopped. Reason: \(reason)",
                    "response": GenerateContentResponseObjc.from(response)
                ]
            )
        case .internalError(let underlying):
            return NSError(
                domain: "FirebaseAIBridge",
                code: FirebaseAIErrorObjc.server.rawValue,
                userInfo: [
                    NSLocalizedDescriptionKey: underlying.localizedDescription,
                ]
            )
        case .promptImageContentError(let underlying):
            return NSError(
                domain: "FirebaseAIBridge",
                code: FirebaseAIErrorObjc.contentBlocked.rawValue,
                userInfo: [
                    NSLocalizedDescriptionKey: underlying.localizedDescription,
                ]
            )
        }
    }
}
