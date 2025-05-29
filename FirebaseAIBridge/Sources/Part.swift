//
//  Part.swift
//  FirebaseAIBridge
//
//  Created by Sean Chin on 23/5/25.
//
import Foundation
import FirebaseAI

@objc(PartObjc)
public class PartObjc: NSObject {}

@objc(TextPartObjc)
public class TextPartObjc: PartObjc {
    @objc public let text: String
    
    @objc public init(text: String) {
        self.text = text
    }
}


@objc(InlineDataPartObjc)
public class InlineDataPartObjc: PartObjc {
    @objc public let data: Data
    
    @objc public let mimeType: String
    
    @objc public init(data: Data, mimeType: String) {
        self.data = data
        self.mimeType = mimeType
    }
}

@objc(FileDataPartObjc)
public class FileDataPartObjc: PartObjc {
    @objc public let fileURI: String
    
    @objc public let mimeType: String
    
    @objc public init(fileURI: String, mimeType: String) {
        self.fileURI = fileURI
        self.mimeType = mimeType
    }
}

@objc(ImagePartObjc)
public class ImagePartObjc: PartObjc {
    @objc public let image: UIImage
    
    @objc public init(image: UIImage) {
        self.image = image
    }
}

