//
//  GenerationConfig.swift
//  FirebaseAIBridge
//
//  Created by Sean Chin on 10/8/25.
//
import FirebaseAI

@objcMembers public class GenerationConfigObjc: NSObject {
    public let temperature: NSNumber?
    public let topP: NSNumber?
    public let topK: NSNumber?
    public let candidateCount: NSNumber?
    public let maxOutputTokens: NSNumber?
    public let presencePenalty: NSNumber?
    public let frequencyPenalty: NSNumber?
    public let stopSequences: [String]?
    public let responseMIMEType: String?
    public let responseSchema: SchemaObjc?
    public let responseModalities: [ResponseModalityObjc]?
    public let thinkingConfig: ThinkingConfigObjc?

    public init(
        temperature: NSNumber? = nil,
        topP: NSNumber? = nil,
        topK: NSNumber? = nil,
        candidateCount: NSNumber? = nil,
        maxOutputTokens: NSNumber? = nil,
        presencePenalty: NSNumber? = nil,
        frequencyPenalty: NSNumber? = nil,
        stopSequences: [String]? = nil,
        responseMIMEType: String? = nil,
        responseSchema: SchemaObjc? = nil,
        responseModalities: [ResponseModalityObjc]? = nil,
        thinkingConfig: ThinkingConfigObjc? = nil
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
        self.thinkingConfig = thinkingConfig
    }
    
    public static func to(_ generationConfig: GenerationConfigObjc) -> GenerationConfig {
        return GenerationConfig(
            temperature: generationConfig.temperature?.floatValue,
            topP: generationConfig.topP?.floatValue,
            topK: generationConfig.topK?.intValue,
            candidateCount: generationConfig.candidateCount?.intValue,
            maxOutputTokens: generationConfig.maxOutputTokens?.intValue,
            presencePenalty: generationConfig.presencePenalty?.floatValue,
            frequencyPenalty: generationConfig.frequencyPenalty?.floatValue,
            stopSequences: generationConfig.stopSequences,
            responseMIMEType: generationConfig.responseMIMEType,
            responseSchema: generationConfig.responseSchema.map {
                SchemaObjc.to($0)
            },
            responseModalities: generationConfig.responseModalities?.map {
                ResponseModalityObjc.to($0)
            },
            thinkingConfig: generationConfig.thinkingConfig.map {
                ThinkingConfigObjc.to($0)
            }
        )
    }
}

