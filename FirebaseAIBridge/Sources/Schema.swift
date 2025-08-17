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
    
    public required init(type: String, descriptionText: String? = nil, format: String? = nil, nullable: NSNumber? = nil, enumValues: [String]? = nil, properties: [String : SchemaObjc]? = nil, requiredProperties: [String]? = nil, items: SchemaObjc? = nil, title: String? = nil, minItems: NSNumber? = nil, maxItems: NSNumber? = nil, minimum: NSNumber? = nil, maximum: NSNumber? = nil, anyOf: [SchemaObjc]? = nil, propertyOrdering: [String]? = nil) {
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
    
    public static func string(description: String? = nil, title: String? = nil,
                              nullable: Bool = false, format: StringFormatObjc? = nil) -> SchemaObjc {
      return self.init(
        type: "STRING",
        descriptionText: description,
        format: format?.rawValue,
        nullable: nullable as NSNumber,
        title: title
      )
    }
    
    public static func enumeration(values: [String], description: String? = nil,
                                   title: String? = nil, nullable: Bool = false) -> SchemaObjc {
      return self.init(
        type: "STRING",
        descriptionText: description,
        format: "enum",
        nullable: nullable as NSNumber,
        enumValues: values,
        title: title
      )
    }
    
    public static func float(description: String? = nil, title: String? = nil, nullable: Bool = false,
                             minimum: NSNumber? = nil, maximum: NSNumber? = nil) -> SchemaObjc {
      return self.init(
        type: "NUMBER",
        descriptionText: description,
        format: "float",
        nullable: nullable as NSNumber,
        title: title,
        minimum: minimum,
        maximum: maximum
      )
    }
    
    public static func double(description: String? = nil, title: String? = nil,
                              nullable: Bool = false,
                              minimum: NSNumber? = nil, maximum: NSNumber? = nil) -> SchemaObjc {
      return self.init(
        type: "NUMBER",
        descriptionText: description,
        nullable: nullable as NSNumber,
        title: title,
        minimum: minimum,
        maximum: maximum
      )
    }
    
    public static func integer(description: String? = nil, title: String? = nil,
                               nullable: Bool = false,
                               minimum: NSNumber? = nil, maximum: NSNumber? = nil) -> SchemaObjc {
      return self.init(
        type: "INTEGER",
        descriptionText: description,
        format: "int32",
        nullable: nullable as NSNumber,
        title: title,
        minimum: minimum,
        maximum: maximum
      )
    }
    
    public static func long(description: String? = nil, title: String? = nil,
                               nullable: Bool = false,
                               minimum: NSNumber? = nil, maximum: NSNumber? = nil) -> SchemaObjc {
      return self.init(
        type: "INTEGER",
        descriptionText: description,
        format: "int64",
        nullable: nullable as NSNumber,
        title: title,
        minimum: minimum,
        maximum: maximum
      )
    }
    
    public static func boolean(description: String? = nil, title: String? = nil,
                               nullable: Bool = false) -> SchemaObjc {
      return self.init(
        type: "BOOLEAN",
        descriptionText: description,
        nullable: nullable as NSNumber,
        title: title
      )
    }

    
    public static func array(items: SchemaObjc, description: String? = nil, title: String? = nil,
                             nullable: Bool = false, minItems: NSNumber? = nil,
                             maxItems: NSNumber? = nil) -> SchemaObjc {
      return self.init(
        type: "ARRAY",
        descriptionText: description,
        nullable: nullable as NSNumber,
        items: items,
        title: title,
        minItems: minItems,
        maxItems: maxItems
      )
    }
    
    public static func object(properties: [String: SchemaObjc], optionalProperties: [String] = [],
                              propertyOrdering: [String]? = nil,
                              description: String? = nil, title: String? = nil,
                              nullable: Bool = false) -> SchemaObjc {
      var requiredProperties = Set(properties.keys)
      for optionalProperty in optionalProperties {
        guard properties.keys.contains(optionalProperty) else {
          fatalError("Optional property \"\(optionalProperty)\" not defined in object properties.")
        }
        requiredProperties.remove(optionalProperty)
      }

      return self.init(
        type: "OBJECT",
        descriptionText: description,
        nullable: nullable as NSNumber,
        properties: properties,
        requiredProperties: requiredProperties.sorted(),
        title: title,
        propertyOrdering: propertyOrdering
      )
    }
    
    public static func anyOf(schemas: [SchemaObjc]) -> SchemaObjc {
      return self.init(
        type: "ANYOF",
        anyOf: schemas
      )
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
                    }
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
            if (schema.format == "int32") {
                return Schema.integer(
                    description: schema.descriptionText,
                    title: schema.title,
                    nullable: schema.nullable!.boolValue,
                    format: Schema.IntegerFormat.int32,
                    minimum:schema.minimum?.intValue,
                    maximum: schema.maximum?.intValue
                )
            } else {
                return Schema.integer(
                    description: schema.descriptionText,
                    title: schema.title,
                    nullable: schema.nullable!.boolValue,
                    format: Schema.IntegerFormat.int64,
                    minimum:schema.minimum?.intValue,
                    maximum: schema.maximum?.intValue
                )
            }
        case "BOOLEAN":
            return Schema.boolean(
                description: schema.descriptionText,
                title: schema.title,
                nullable: schema.nullable!.boolValue
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
                nullable: schema.nullable!.boolValue
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
