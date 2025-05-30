//
//  ContentModality.swift
//  FirebaseAIBridge
//
//  Created by Sean Chin on 30/5/25.
//
import Foundation
import FirebaseAI



@objc(ContentModalityObjc)
public class ContentModalityObjc: NSObject {
    // TODO: Refactor this
    @objc public static let text = ContentModalityObjc(rawValue: "TEXT")
    @objc public static let image = ContentModalityObjc(rawValue: "IMAGE")
    @objc public static let video = ContentModalityObjc(rawValue: "VIDEO")
    @objc public static let audio = ContentModalityObjc(rawValue: "AUDIO")
    @objc public static let document = ContentModalityObjc(rawValue: "DOCUMENT")
    @objc public static let unknown = ContentModalityObjc(rawValue: "UNKNOWN")
    
    @objc public let rawValue: String
    
    @objc public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public static func from(_ modality: ContentModality) -> ContentModalityObjc {
        switch modality.rawValue {
        case "TEXT":
            return .text
        case "IMAGE":
            return .image
        case "VIDEO":
            return .video
        case "AUDIO":
            return .audio
        case "DOCUMENT":
            return .document
        default:
            return .unknown
        }
    }
}
