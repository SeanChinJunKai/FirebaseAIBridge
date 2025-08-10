//
//  ThinkingConfig.swift
//  FirebaseAIBridge
//
//  Created by Sean  Chin on 10/8/25.
//
import FirebaseAI

@objcMembers
public class ThinkingConfigObjc: NSObject {
    public let thinkingBudget: NSNumber?
    
    public init(thinkingBudget: NSNumber?) {
        self.thinkingBudget = thinkingBudget
    }
    
    public static func to(_ thinkingConfig: ThinkingConfigObjc) -> ThinkingConfig {
        return ThinkingConfig(
            thinkingBudget: thinkingConfig.thinkingBudget?.intValue
        )
    }
}
