//
//  ResponseModality.swift
//  FirebaseAIBridge
//
//  Created by Sean Chin on 11/6/25.
//
import Foundation
import FirebaseAI

@objcMembers public class ResponseModalityObjc: NSObject {
    enum Kind: String {
        case text = "TEXT"
        case image = "IMAGE"
    }
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public static func to(_ responseModality: ResponseModalityObjc) -> ResponseModality {
        switch responseModality.rawValue {
        case Kind.text.rawValue:
            return .text
        case Kind.image.rawValue:
            return .image
        default: // TODO: Think of another way to do this
            return .text
        }
    }
}
