//
//  FirebaseAIBridge.swift
//  FirebaseAIBridge
//
//  Created by Sean Chin on 20/5/25.
//
import Foundation
import FirebaseAI

@objc(FirebaseObjc)
public class FirebaseObjc: NSObject {
    //  TODO: Adding missing parameters such as firebase app
    @objc public static func ai(backend: NSNumber) -> FirebaseAIObjc {
        return FirebaseAIObjc(backend: backend.boolValue)
    }
}


@objc(FirebaseAIObjc)
public class FirebaseAIObjc: NSObject {
    private let service: FirebaseAI
    
    // TODO: Find a better way than Bool
    init(backend: Bool) {
        if (backend) {
            self.service = FirebaseAI.firebaseAI(backend: .googleAI())
        } else {
            self.service = FirebaseAI.firebaseAI(backend: .vertexAI())
        }
    }
    // TODO: Add missing parameters
    @objc public func generativeModel(modelName: String) -> GenerativeModelObjc {
        return GenerativeModelObjc(model: self.service.generativeModel(modelName: modelName))
    }
}


@objc(GenerativeModelObjc)
public class GenerativeModelObjc: NSObject {
    private let model: GenerativeModel
    
    init(model: GenerativeModel) {
        self.model = model
    }
    
    
    @objc public func generateContent(prompt: String) async throws -> String? {
        let response = try await model.generateContent(prompt)
        return response.text
    }
    
    
    @objc public func generateContent(parts: [PartObjc]) async throws -> String? {
        let internalParts: [any PartsRepresentable] = parts.map { part in
            switch part {
                case let part as TextPartObjc:
                    return TextPart(part.text)
                case let part as InlineDataPartObjc:
                    return InlineDataPart(data: part.data, mimeType: part.mimeType)
                case let part as FileDataPartObjc:
                    return FileDataPart(uri: part.fileURI, mimeType: part.mimeType)
                case let part as ImagePartObjc:
                    return part.image
                default:
                    fatalError("Unsupported part type")
            }
        }
        
        let response = try await model.generateContent(internalParts)
        return response.text
    }
    
    @objc public func countTokens(prompt: String) async throws -> CountTokensResponseObjc {
        let response = try await model.countTokens(prompt)
        return CountTokensResponseObjc.from(response)
    }
    
    @objc public func countTokens(parts: [PartObjc]) async throws -> CountTokensResponseObjc {
        let internalParts: [any PartsRepresentable] = parts.map { part in
            switch part {
                case let part as TextPartObjc:
                    return TextPart(part.text)
                case let part as InlineDataPartObjc:
                    return InlineDataPart(data: part.data, mimeType: part.mimeType)
                case let part as FileDataPartObjc:
                    return FileDataPart(uri: part.fileURI, mimeType: part.mimeType)
                case let part as ImagePartObjc:
                    return part.image
                default:
                    fatalError("Unsupported part type")
            }
        }
        let response = try await model.countTokens(internalParts)
        return CountTokensResponseObjc.from(response)
    }
}
