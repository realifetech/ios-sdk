// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  final class GetContentByExternalIdQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getContentByExternalId($externalId: String!) {
        getContentByExternalId(externalId: $externalId) {
          __typename
          campaignId
          items {
            __typename
            contentType
            data
          }
        }
      }
      """

    public let operationName: String = "getContentByExternalId"

    public var externalId: String

    public init(externalId: String) {
      self.externalId = externalId
    }

    public var variables: GraphQLMap? {
      return ["externalId": externalId]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getContentByExternalId", arguments: ["externalId": GraphQLVariable("externalId")], type: .object(GetContentByExternalId.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getContentByExternalId: GetContentByExternalId? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getContentByExternalId": getContentByExternalId.flatMap { (value: GetContentByExternalId) -> ResultMap in value.resultMap }])
      }

      public var getContentByExternalId: GetContentByExternalId? {
        get {
          return (resultMap["getContentByExternalId"] as? ResultMap).flatMap { GetContentByExternalId(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getContentByExternalId")
        }
      }

      public struct GetContentByExternalId: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ContentResponse"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("campaignId", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("items", type: .list(.object(Item.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(campaignId: GraphQLID, items: [Item?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "ContentResponse", "campaignId": campaignId, "items": items.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var campaignId: GraphQLID {
          get {
            return resultMap["campaignId"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "campaignId")
          }
        }

        public var items: [Item?]? {
          get {
            return (resultMap["items"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Item?] in value.map { (value: ResultMap?) -> Item? in value.flatMap { (value: ResultMap) -> Item in Item(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }, forKey: "items")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Content"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("contentType", type: .scalar(ContentType.self)),
              GraphQLField("data", type: .scalar(JSON.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(contentType: ContentType? = nil, data: JSON? = nil) {
            self.init(unsafeResultMap: ["__typename": "Content", "contentType": contentType, "data": data])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var contentType: ContentType? {
            get {
              return resultMap["contentType"] as? ContentType
            }
            set {
              resultMap.updateValue(newValue, forKey: "contentType")
            }
          }

          public var data: JSON? {
            get {
              return resultMap["data"] as? JSON
            }
            set {
              resultMap.updateValue(newValue, forKey: "data")
            }
          }
        }
      }
    }
  }
}
