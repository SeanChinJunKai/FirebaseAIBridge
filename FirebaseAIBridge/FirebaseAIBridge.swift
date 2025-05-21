//
//  FirebaseAIBridge.swift
//  FirebaseAIBridge
//
//  Created by Sean Chin on 20/5/25.
//
import Foundation
import FirebaseAI


@objc(FirebaseAIBridge)
public class FirebaseAIBridge: NSObject {
    private let service: FirebaseAI
    
    @objc public override init() {
        self.service = FirebaseAI.firebaseAI(backend: .googleAI())
    }
    
    @objc public func generativeModel(modelName: String) -> GenerativeModelBridge {
        return GenerativeModelBridge(model: self.service.generativeModel(modelName: modelName))
    }
}


@objc(GenerativeModelBridge)
public class GenerativeModelBridge: NSObject {
    private let model: GenerativeModel
    
    init(model: GenerativeModel) {
        self.model = model
    }
    
    @objc public func generateContent(prompt: String, completion: @escaping (String?, NSError?) -> Void) {
        Task {
            do {
                let response = try await model.generateContent(prompt)
                completion(response.text, nil)
            } catch {
                completion(nil, error as NSError)
            }
        }
    }
}
