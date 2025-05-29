//
//  Candidate.swift
//  FirebaseAIBridge
//
//  Created by Sean Chin on 29/5/25.
//
import Foundation
import FirebaseAI

@objcMembers
public class CandidateObjc: NSObject {
    public let content: ModelContentObjc

    public let safetyRatings: [SafetyRatingObjc]

    public let finishReason: FinishReasonObjc?

    public let citationMetadata: CitationMetadataObjc?
    
    public init(
        content: ModelContentObjc,
        safetyRatings: [SafetyRatingObjc],
        finishReason: FinishReasonObjc?,
        citationMetadata: CitationMetadataObjc?
    ) {
        self.content = content
        self.safetyRatings = safetyRatings
        self.finishReason = finishReason
        self.citationMetadata = citationMetadata
    }
    
    public static func from(_ candidate: Candidate) -> CandidateObjc {
        return CandidateObjc(
            content: ModelContentObjc.from(candidate.content),
            safetyRatings: candidate.safetyRatings.map {
                SafetyRatingObjc.from($0)
            },
            finishReason: candidate.finishReason.map {
                FinishReasonObjc.from($0)
            },
            citationMetadata: candidate.citationMetadata.map {
                CitationMetadataObjc.from($0)
            }
        )
    }
}


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

@objcMembers
public class FinishReasonObjc: NSObject {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public static func from(_ finishReason: FinishReason) -> FinishReasonObjc {
        return FinishReasonObjc(rawValue: finishReason.rawValue)
    }
}
