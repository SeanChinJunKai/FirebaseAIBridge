//
//  CitationMetadata.swift
//  FirebaseAIBridge
//
//  Created by Sean Chin on 29/5/25.
//
import Foundation
import FirebaseAI

@objcMembers
public class CitationMetadataObjc: NSObject {
    public let citations : [CitationObjc]
    
    public init(citations: [CitationObjc]) {
        self.citations = citations
    }
    
    public static func from(_ citationMetadata: CitationMetadata) -> CitationMetadataObjc {
        return CitationMetadataObjc(citations: citationMetadata.citations.map {
            CitationObjc.from($0)
            }
        )
    }
}

@objcMembers
public class CitationObjc: NSObject {
    public let startIndex: Int

    public let endIndex: Int

    public let uri: String?

    public let title: String?

    public let license: String?

    public let publicationDate: DateComponents?
    
    public init(startIndex: Int,
         endIndex: Int,
         uri: String? = nil,
         title: String? = nil,
         license: String? = nil,
         publicationDate: DateComponents?) {
      self.startIndex = startIndex
      self.endIndex = endIndex
      self.uri = uri
      self.title = title
      self.license = license
      self.publicationDate = publicationDate
    }
    
    public static func from(_ citation: Citation) -> CitationObjc {
        return CitationObjc(
            startIndex: citation.startIndex,
            endIndex: citation.endIndex,
            uri: citation.uri,
            title: citation.title,
            license: citation.license,
            publicationDate: citation.publicationDate,
            
        )
    }
}
