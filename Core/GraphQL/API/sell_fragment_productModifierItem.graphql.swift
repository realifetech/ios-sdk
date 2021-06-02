// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  struct FragmentProductModifierItem: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentProductModifierItem on ProductModifierItem {
        __typename
        id
        status
        externalId
        additionalPrice
        position
        translations {
          __typename
          language
          title
        }
      }
      """

    public static let possibleTypes: [String] = ["ProductModifierItem"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("status", type: .scalar(ProductModifierItemStatus.self)),
        GraphQLField("externalId", type: .scalar(String.self)),
        GraphQLField("additionalPrice", type: .scalar(Int.self)),
        GraphQLField("position", type: .scalar(Int.self)),
        GraphQLField("translations", type: .list(.object(Translation.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, status: ProductModifierItemStatus? = nil, externalId: String? = nil, additionalPrice: Int? = nil, position: Int? = nil, translations: [Translation?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "ProductModifierItem", "id": id, "status": status, "externalId": externalId, "additionalPrice": additionalPrice, "position": position, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
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

    public var status: ProductModifierItemStatus? {
      get {
        return resultMap["status"] as? ProductModifierItemStatus
      }
      set {
        resultMap.updateValue(newValue, forKey: "status")
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

    public var additionalPrice: Int? {
      get {
        return resultMap["additionalPrice"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "additionalPrice")
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
      public static let possibleTypes: [String] = ["ProductModifierItemTranslation"]

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
        self.init(unsafeResultMap: ["__typename": "ProductModifierItemTranslation", "language": language, "title": title])
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
