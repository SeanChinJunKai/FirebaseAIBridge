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
    
    
    @objc public func generateContent(prompt: String) async throws -> GenerateContentResponseObjc {
        let response = try await model.generateContent(prompt)
        return GenerateContentResponseObjc.from(response)
    }
    
    
    @objc public func generateContent(content: [ModelContentObjc]) async throws -> GenerateContentResponseObjc {
        let contents = content.map {
            ModelContentObjc.to($0)
        }
        let response = try await model.generateContent(contents)
        return GenerateContentResponseObjc.from(response)
    }
    
    @objc public func countTokens(prompt: String) async throws -> CountTokensResponseObjc {
        let response = try await model.countTokens(prompt)
        return CountTokensResponseObjc.from(response)
    }
    
    @objc public func countTokens(content: [ModelContentObjc]) async throws -> CountTokensResponseObjc {
        let contents = content.map {
            ModelContentObjc.to($0)
        }
        let response = try await model.countTokens(contents)
        return CountTokensResponseObjc.from(response)
    }
}
