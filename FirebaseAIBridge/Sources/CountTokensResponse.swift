//
//  CountTokensResponse.swift
//  FirebaseAIBridge
//
//  Created by Sean Chin on 29/5/25.
//
import Foundation
import FirebaseAI

@objcMembers
public class CountTokensResponseObjc: NSObject {
    public let totalTokens: Int
    
    public let totalBillableCharacters: Int?
    
    public let promptTokenDetails: [ModalityTokenCountObjc]
    
    public init(totalTokens: Int, totalBillableCharacters: Int?, promptTokenDetails: [ModalityTokenCountObjc]) {
        self.totalTokens = totalTokens
        self.totalBillableCharacters = totalBillableCharacters
        self.promptTokenDetails = promptTokenDetails
    }
    
    public static func from(_ countTokensResponse: CountTokensResponse) -> CountTokensResponseObjc {
        return CountTokensResponseObjc(
            totalTokens: countTokensResponse.totalTokens,
            totalBillableCharacters: countTokensResponse.totalBillableCharacters,
            promptTokenDetails: countTokensResponse.promptTokensDetails.map {
                ModalityTokenCountObjc.from($0)
            }
        )
    }
}
