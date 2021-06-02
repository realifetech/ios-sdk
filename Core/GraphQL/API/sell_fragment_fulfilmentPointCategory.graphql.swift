// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  struct FragmentFulfilmentPointCategory: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentFulfilmentPointCategory on FulfilmentPointCategory {
        __typename
        id
        reference
        status
        iconImageUrl
        position
        translations {
          __typename
          language
          title
        }
      }
      """

    public static let possibleTypes: [String] = ["FulfilmentPointCategory"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("reference", type: .scalar(String.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("iconImageUrl", type: .scalar(String.self)),
        GraphQLField("position", type: .scalar(Int.self)),
        GraphQLField("translations", type: .list(.object(Translation.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, reference: String? = nil, status: String? = nil, iconImageUrl: String? = nil, position: Int? = nil, translations: [Translation?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "FulfilmentPointCategory", "id": id, "reference": reference, "status": status, "iconImageUrl": iconImageUrl, "position": position, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
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

    public var reference: String? {
      get {
        return resultMap["reference"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "reference")
      }
    }

    public var status: String? {
      get {
        return resultMap["status"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "status")
      }
    }

    public var iconImageUrl: String? {
      get {
        return resultMap["iconImageUrl"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "iconImageUrl")
      }
    }

    public var position: Int? {
      get {
        return resultMap["position"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "position")
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
      public static let possibleTypes: [String] = ["FulfilmentPointCategoryTranslation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("language", type: .scalar(Language.self)),
          GraphQLField("title", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(language: Language? = nil, title: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "FulfilmentPointCategoryTranslation", "language": language, "title": title])
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
    }
  }
}
