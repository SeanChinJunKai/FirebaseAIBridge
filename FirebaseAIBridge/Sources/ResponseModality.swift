//
//  ResponseModality.swift
//  FirebaseAIBridge
//
//  Created by Sean  Chin on 10/8/25.
//

import Foundation
import FirebaseAI

@objcMembers
public class ResponseModalityObjc: NSObject {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public static func to(_ modality: ResponseModalityObjc) -> ResponseModality {
        switch (modality.rawValue) {
        case "TEXT":
            .text
        case "IMAGE":
            .image
        default:
            fatalError("Unsupported modality: \(modality.rawValue)")
        }
    }
}
