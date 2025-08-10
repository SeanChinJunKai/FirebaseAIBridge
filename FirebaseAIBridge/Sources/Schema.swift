//
//  Schema.swift
//  FirebaseAIBridge
//
//  Created by Sean  Chin on 10/8/25.
//
import FirebaseAI


@objcMembers
public class StringFormatObjc: NSObject {
    public let rawValue: String
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

@objcMembers
public class SchemaObjc: NSObject {
    public let type: String
    public let descriptionText: String?
    public let format: String?
    public let nullable: NSNumber?
    public let enumValues: [String]?
    public let properties: [String: SchemaObjc]?
    public let requiredProperties: [String]?
    public let items: SchemaObjc?
    public let title: String?
    public let minItems: NSNumber?
    public let maxItems: NSNumber?
    public let minimum: NSNumber?
    public let maximum: NSNumber?
    public let anyOf: [SchemaObjc]?
    public let propertyOrdering: [String]?
    
    public init(type: String, descriptionText: String?, format: String?, nullable: NSNumber?, enumValues: [String]?, properties: [String : SchemaObjc]?, requiredProperties: [String]?, items: SchemaObjc?, title: String?, minItems: NSNumber?, maxItems: NSNumber?, minimum: NSNumber?, maximum: NSNumber?, anyOf: [SchemaObjc]?, propertyOrdering: [String]?) {
        self.type = type
        self.descriptionText = descriptionText
        self.format = format
        self.nullable = nullable
        self.enumValues = enumValues
        self.properties = properties
        self.requiredProperties = requiredProperties
        self.items = items
        self.title = title
        self.minItems = minItems
        self.maxItems = maxItems
        self.minimum = minimum
        self.maximum = maximum
        self.anyOf = anyOf
        self.propertyOrdering = propertyOrdering
    }
    
    
    
    public static func to(_ schema: SchemaObjc) -> Schema {
        // string -> type is String
        switch schema.type {
        case "STRING":
            if (schema.format == "enum") {
                return Schema.string(
                    description: schema.descriptionText,
                    title: schema.title,
                    nullable: schema.nullable!.boolValue,
                    format: schema.format.map {
                        Schema.StringFormat.custom($0)
                    },
                )
            } else {
                return Schema.enumeration(
                    values: schema.enumValues!,
                    description: schema.descriptionText,
                    title: schema.title,
                    nullable: schema.nullable!.boolValue
                )
            }
            
        case "NUMBER":
            if (schema.format == "float") {
                return Schema.float(
                    description: schema.descriptionText,
                    title: schema.title,
                    nullable: schema.nullable!.boolValue,
                    minimum: schema.minimum?.floatValue,
                    maximum: schema.maximum?.floatValue
                )
            } else {
                return Schema.double(
                    description: schema.descriptionText,
                    title: schema.title,
                    nullable: schema.nullable!.boolValue,
                    minimum: schema.minimum?.doubleValue,
                    maximum: schema.maximum?.doubleValue
                )
            }
        case "INTEGER":
            return Schema.integer(
                description: schema.descriptionText,
                title: schema.title,
                nullable: schema.nullable!.boolValue,
                format: Schema.IntegerFormat.int64,
                minimum:schema.minimum?.intValue,
                maximum: schema.maximum?.intValue
            )
        case "BOOLEAN":
            return Schema.boolean(
                description: schema.descriptionText,
                title: schema.title,
                nullable: schema.nullable!.boolValue,
            )
        case "ARRAY":
            return Schema.array(
                items: SchemaObjc.to(schema.items!),
                description: schema.descriptionText,
                title: schema.title,
                nullable: schema.nullable!.boolValue,
                minItems: schema.minItems?.intValue,
                maxItems: schema.maxItems?.intValue
            )
        case "OBJECT":
            let optionalProperties = Set(schema.properties!.keys).subtracting(Set(schema.requiredProperties!))
            return Schema.object(
                properties: schema.properties!.mapValues{
                    SchemaObjc.to($0)
                },
                optionalProperties: Array(optionalProperties),
                propertyOrdering: schema.propertyOrdering,
                description: schema.descriptionText,
                title: schema.title,
                nullable: schema.nullable!.boolValue,
            )
        default:
            return Schema.anyOf(
                schemas: schema.anyOf!.map {
                    SchemaObjc.to($0)
                }
            )
        }
    
    }
}
