//
//  FirebaseVertexAIBridge.swift
//  FirebaseVertexAIBridge
//
//  Created by Sean Chin on 20/5/25.
//
import Foundation
import FirebaseVertexAI

@objc(FirebaseVertexAI)
public class FirebaseVertexAI: NSObject {
    private let service: VertexAI
    
    @objc public override init() {
        self.service = VertexAI.vertexAI()
    }
}
