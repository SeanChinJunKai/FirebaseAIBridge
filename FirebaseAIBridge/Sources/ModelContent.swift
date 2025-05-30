//
//  ModelContent.swift
//  FirebaseAIBridge
//
//  Created by Sean Chin on 30/5/25.
//
import Foundation
import FirebaseAI

@objcMembers
public class ModelContentObjc: NSObject {
    public let role: String?
    
    public let parts: [PartObjc]
    
    public init(role: String?, parts: [PartObjc]) {
        self.role = role
        self.parts = parts
    }
    
    public static func from(_ modelContent: ModelContent) -> ModelContentObjc {
        return ModelContentObjc(
            role: modelContent.role,
            parts: modelContent.parts.map {
                PartObjc.from($0)
            }
        )
    }
    
}
