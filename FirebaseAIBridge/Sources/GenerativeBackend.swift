//
//  GenerativeBackend.swift
//  FirebaseAIBridge
//
//  Created by Sean Chin on 6/6/25.
//

import Foundation
import FirebaseAI

@objcMembers
public class GenerativeBackendObjc: NSObject {
    let backend: Backend
    
    init(backend: Backend) {
        self.backend = backend
    }
    
    public static func googleAI() -> GenerativeBackendObjc {
        return GenerativeBackendObjc(backend: .googleAI())
    }
    
    public static func vertexAI(location: String = "us-central1") -> GenerativeBackendObjc {
        return GenerativeBackendObjc(backend: .vertexAI(location: location))
    }
}
