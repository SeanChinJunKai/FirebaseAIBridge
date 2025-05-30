//
//  CountTokensResponse.swift
//  FirebaseAIBridge
//
//  Created by Sean Chin on 29/5/25.
//
import Foundation
import FirebaseAI

@objc(CountTokensResponseObjc)
public class CountTokensResponseObjc: NSObject {
    @objc public let totalTokens: NSNumber
    
    @objc public let totalBillableCharacters: NSNumber?
    
    @objc public let promptTokenDetails: [ModalityTokenCountObjc]
    
    @objc public init(totalTokens: NSNumber, totalBillableCharacters: NSNumber?, promptTokenDetails: [ModalityTokenCountObjc]) {
        self.totalTokens = totalTokens
        self.totalBillableCharacters = totalBillableCharacters
        self.promptTokenDetails = promptTokenDetails
    }
    
    public static func from(_ countTokensResponse: CountTokensResponse) -> CountTokensResponseObjc {
        return CountTokensResponseObjc(
            totalTokens: NSNumber(value: countTokensResponse.totalTokens),
            totalBillableCharacters: countTokensResponse.totalBillableCharacters as NSNumber?,
            promptTokenDetails: countTokensResponse.promptTokensDetails.map {
                ModalityTokenCountObjc.from($0)
            }
        )
    }
}
