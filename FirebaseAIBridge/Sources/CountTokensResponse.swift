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

@objc(ModalityTokenCountObjc)
public class ModalityTokenCountObjc: NSObject {
    @objc public let modality: ContentModalityObjc
    
    @objc public let tokenCount: NSNumber
    
    @objc public init(modality: ContentModalityObjc, tokenCount: NSNumber) {
        self.modality = modality
        self.tokenCount = tokenCount
    }
    
    public static func from(_ modalityTokenCount: ModalityTokenCount) -> ModalityTokenCountObjc {
        return ModalityTokenCountObjc(
            modality: ContentModalityObjc.from(modalityTokenCount.modality),
            tokenCount: NSNumber(value: modalityTokenCount.tokenCount)
        )
    }
}


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
