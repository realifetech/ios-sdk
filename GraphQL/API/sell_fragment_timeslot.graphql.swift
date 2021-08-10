// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  struct FragmentTimeslot: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentTimeslot on Timeslot {
        __typename
        id
        externalId
        reference
        startTime
        endTime
        createdAt
        updatedAt
        translations {
          __typename
          language
          title
          description
          collectionNote
        }
      }
      """

    public static let possibleTypes: [String] = ["Timeslot"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("externalId", type: .scalar(String.self)),
        GraphQLField("reference", type: .scalar(String.self)),
        GraphQLField("startTime", type: .scalar(String.self)),
        GraphQLField("endTime", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .scalar(String.self)),
        GraphQLField("translations", type: .list(.object(Translation.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, externalId: String? = nil, reference: String? = nil, startTime: String? = nil, endTime: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, translations: [Translation?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Timeslot", "id": id, "externalId": externalId, "reference": reference, "startTime": startTime, "endTime": endTime, "createdAt": createdAt, "updatedAt": updatedAt, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var externalId: String? {
      get {
        return resultMap["externalId"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "externalId")
      }
    }

    public var reference: String? {
      get {
        return resultMap["reference"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "reference")
      }
    }

    public var startTime: String? {
      get {
        return resultMap["startTime"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "startTime")
      }
    }

    public var endTime: String? {
      get {
        return resultMap["endTime"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "endTime")
      }
    }

    public var createdAt: String? {
      get {
        return resultMap["createdAt"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "createdAt")
      }
    }

    public var updatedAt: String? {
      get {
        return resultMap["updatedAt"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "updatedAt")
      }
    }

    public var translations: [Translation?]? {
      get {
        return (resultMap["translations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Translation?] in value.map { (value: ResultMap?) -> Translation? in value.flatMap { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, forKey: "translations")
      }
    }

    public struct Translation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TimeslotTranslation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("language", type: .scalar(Language.self)),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("collectionNote", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(language: Language? = nil, title: String? = nil, description: String? = nil, collectionNote: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "TimeslotTranslation", "language": language, "title": title, "description": description, "collectionNote": collectionNote])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var language: Language? {
        get {
          return resultMap["language"] as? Language
        }
        set {
          resultMap.updateValue(newValue, forKey: "language")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var collectionNote: String? {
        get {
          return resultMap["collectionNote"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "collectionNote")
        }
      }
    }
  }
}
