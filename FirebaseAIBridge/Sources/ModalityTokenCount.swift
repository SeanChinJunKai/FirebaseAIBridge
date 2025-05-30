//
//  ModalityTokenCount.swift
//  FirebaseAIBridge
//
//  Created by Sean Chin on 30/5/25.
//
import Foundation
import FirebaseAI

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
