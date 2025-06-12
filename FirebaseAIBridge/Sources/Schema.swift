//
//  Schema.swift
//  FirebaseAIBridge
//
//  Created by Sean  Chin on 11/6/25.
//
import FirebaseAI

@objcMembers
public class StringFormatObjc: NSObject {
    let rawValue: String
    
    init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public static func custom(_ format: String) -> StringFormatObjc {
        return .init(rawValue: format)
    }
}

@objcMembers
public class SchemaObjc: NSObject {
    public let type: String
    
    public let format: String?
    
    public let explanation: String?

    public let title: String?

    public let nullable: NSNumber?

    public let enumValues: [String]?
    
    public let properties: [String: SchemaObjc]?
    
    public let requiredProperties: [String]?

    public let items: SchemaObjc?

    public let minItems: NSNumber?

    public let maxItems: NSNumber?

    public let minimum: NSNumber?

    public let maximum: NSNumber?

    public let anyOf: [SchemaObjc]?

    
    @objc public init(
        type: String,
        description: String? = nil,
        format: String? = nil,
        nullable: NSNumber? = nil,
        enumValues: [String]? = nil,
        properties: [String: SchemaObjc]? = nil,
        requiredProperties: [String]? = nil,
        items: SchemaObjc? = nil,
        title: String? = nil,
        minItems: NSNumber? = nil,
        maxItems: NSNumber? = nil,
        minimum: NSNumber? = nil,
        maximum: NSNumber? = nil,
        anyOf: [SchemaObjc]? = nil,
    ) {
        self.type = type
        self.explanation = description
        self.format = format
        self.nullable = nullable
        self.enumValues = enumValues
        self.properties = properties
        self.requiredProperties = requiredProperties
        self.items = items
        self.minItems = minItems
        self.maxItems = maxItems
        self.minimum = minimum
        self.maximum = maximum
        self.anyOf = anyOf
    }
    
    public static func to(_ schema: SchemaObjc) -> Schema {
        
    }
}
