//
//  HarmCategory.swift
//  FirebaseAIBridge
//
//  Created by Sean Chin on 30/5/25.
//
import Foundation
import FirebaseAI

@objcMembers
public class HarmCategoryObjc: NSObject {
    public let rawString: String
    
    public init(rawString: String) {
        self.rawString = rawString
    }
    
    public static func from(_ harmCategory: HarmCategory) -> HarmCategoryObjc {
        return HarmCategoryObjc(rawString: harmCategory.rawValue)
    }
}
