//
//  GenerationConfig.swift
//  FirebaseAIBridge
//
//  Created by Sean  Chin on 11/6/25.
//
import Foundation
import FirebaseAI

@objcMembers
public class GenerationConfigObjc: NSObject {
    public let temperature: Float?
    
    public let topP: Float?

    public let topK: Int?

    public let candidateCount: Int?
    
    public let maxOutputTokens: Int?

    public let presencePenalty: Float?

    public let frequencyPenalty: Float?

    public let stopSequences: [String]?

    public let responseMIMEType: String?

    public let responseSchema: SchemaObjc?

    public let responseModalities: [ResponseModalityObjc]?

    public init(
        temperature: Float? = nil,
        topP: Float? = nil,
        topK: Int? = nil,
        candidateCount: Int? = nil,
        maxOutputTokens: Int? = nil,
        presencePenalty: Float? = nil,
        frequencyPenalty: Float? = nil,
        stopSequences: [String]? = nil,
        responseMIMEType: String? = nil,
        responseSchema: SchemaObjc? = nil,
        responseModalities: [ResponseModalityObjc]? = nil
    ) {
      self.temperature = temperature
      self.topP = topP
      self.topK = topK
      self.candidateCount = candidateCount
      self.maxOutputTokens = maxOutputTokens
      self.presencePenalty = presencePenalty
      self.frequencyPenalty = frequencyPenalty
      self.stopSequences = stopSequences
      self.responseMIMEType = responseMIMEType
      self.responseSchema = responseSchema
      self.responseModalities = responseModalities
    }
    
    public static func to(_ generationConfig: GenerationConfigObjc) -> GenerationConfig {
        return GenerationConfig(
            temperature: generationConfig.temperature,
            topP: generationConfig.topP,
            topK: generationConfig.topK,
            candidateCount: generationConfig.candidateCount,
            maxOutputTokens: generationConfig.maxOutputTokens,
            presencePenalty: generationConfig.presencePenalty,
            frequencyPenalty: generationConfig.frequencyPenalty,
            stopSequences: generationConfig.stopSequences,
            responseMIMEType: generationConfig.responseMIMEType,
            responseSchema: <#T##Schema?#>,
            responseModalities: generationConfig.responseModalities?.map {
                ResponseModalityObjc.to($0)
            }
        )
    }
    
    
    
}
