//
//  Schema.swift
//  FirebaseAIBridge
//
//  Created by Sean  Chin on 11/6/25.
//

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
    required init(
        type: DataTypeObjc?,
        description: String? = nil,
        format: String? = nil,
        nullable: Bool? = nil,
        enumValues: [String]? = nil,
        properties: [String: SchemaObjc]? = nil,
        requiredProperties: [String]? = nil,
        items: SchemaObjc? = nil,
        title: String? = nil,
        minItems: Int? = nil,
        maxItems: Int? = nil,
        minimum: Double? = nil,
        maximum: Double? = nil,
        anyOf: [SchemaObjc]? = nil,
    ) {
        
    }
    
    public static func boolean(
        description: String? = nil, nullable: Bool = false, title: String? = nil
    ) -> SchemaObjc {
      return self.init(type: .boolean, description: description, nullable: nullable)
    }
    
    public static func integer(
        description: String? = nil, nullable: Bool = false,
        title: String? = nil, minimum: Double? = nil,
        maximum: Double? = nil
    ) -> SchemaObjc {
      return self.init(
        type: .integer,
        description: description,
        format: "int32",
        nullable: nullable,
        title: title,
        minimum: minimum,
        maximum: maximum
      )
    }

    public static func long(
        description: String? = nil, nullable: Bool = false,
        title: String? = nil, minimum: Double? = nil,
        maximum: Double? = nil
    ) -> SchemaObjc {
        return self.init(
          type: .integer,
          description: description,
          nullable: nullable,
          title: title,
          minimum: minimum,
          maximum: maximum
        )
    }
    
    public static func double(
        description: String? = nil, nullable: Bool = false,
        title: String? = nil, minimum: Double? = nil,
        maximum: Double? = nil
    ) -> SchemaObjc {
      return self.init(
        type: .number,
        description: description,
        nullable: nullable,
        title: title,
        minimum: minimum,
        maximum: maximum
      )
    }
    
    public static func float(
        description: String? = nil, nullable: Bool = false,
        title: String? = nil, minimum: Double? = nil,
        maximum: Double? = nil
    ) -> SchemaObjc {
      return self.init(
        type: .number,
        description: description,
        format: "float",
        nullable: nullable,
        title: title,
        minimum: minimum,
        maximum: maximum
      )
    }
    
    public static func string(
        description: String? = nil, nullable: Bool = false,
        format: StringFormatObjc? = nil, title: String? = nil
    ) -> SchemaObjc {
      return self.init(
        type: .string,
        description: description,
        format: format?.rawValue,
        nullable: nullable,
        title: title
      )
    }
    
    // object
    public static func object(
        properties: [String: SchemaObjc], optionalProperties: [String] = [],
        description: String? = nil, title: String? = nil,
        nullable: Bool = false
    ) -> SchemaObjc {
        var requiredProperties = Set(properties.keys)
        return self.init(
          type: .object,
          description: description,
          nullable: nullable,
          properties: properties,
          requiredProperties: requiredProperties.sorted(),
          title: title
        )
    }
    
    public static func array(
        items: SchemaObjc, description: String? = nil, nullable: Bool = false,
        title: String? = nil, minItems: Int? = nil, maxItems: Int? = nil
    ) -> SchemaObjc {
      return self.init(
        type: .array,
        description: description,
        nullable: nullable,
        items: items,
        title: title,
        minItems: minItems,
        maxItems: maxItems
      )
    }

    
    public static func enumeration(
        values: [String], description: String? = nil,
        title: String? = nil, nullable: Bool = false
    ) -> SchemaObjc {
      return self.init(
        type: .string,
        description: description,
        format: "enum",
        nullable: nullable,
        enumValues: values,
        title: title
      )
    }

    
    public static func anyOf(schemas: [SchemaObjc]) -> SchemaObjc {
      return self.init(type: nil, anyOf: schemas)
    }
}
