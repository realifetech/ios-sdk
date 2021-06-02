// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  final class GetFulfilmentPointCategoryByIdQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getFulfilmentPointCategoryById($id: ID!) {
        me {
          __typename
          fulfilmentPointCategory(id: $id) {
            __typename
            ...FragmentFulfilmentPointCategory
          }
        }
      }
      """

    public let operationName: String = "getFulfilmentPointCategoryById"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      return document
    }

    public var id: GraphQLID

    public init(id: GraphQLID) {
      self.id = id
    }

    public var variables: GraphQLMap? {
      return ["id": id]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("me", type: .object(Me.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(me: Me? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "me": me.flatMap { (value: Me) -> ResultMap in value.resultMap }])
      }

      public var me: Me? {
        get {
          return (resultMap["me"] as? ResultMap).flatMap { Me(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "me")
        }
      }

      public struct Me: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Context"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("fulfilmentPointCategory", arguments: ["id": GraphQLVariable("id")], type: .object(FulfilmentPointCategory.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(fulfilmentPointCategory: FulfilmentPointCategory? = nil) {
          self.init(unsafeResultMap: ["__typename": "Context", "fulfilmentPointCategory": fulfilmentPointCategory.flatMap { (value: FulfilmentPointCategory) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fulfilmentPointCategory: FulfilmentPointCategory? {
          get {
            return (resultMap["fulfilmentPointCategory"] as? ResultMap).flatMap { FulfilmentPointCategory(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "fulfilmentPointCategory")
          }
        }

        public struct FulfilmentPointCategory: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["FulfilmentPointCategory"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(FragmentFulfilmentPointCategory.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var fragmentFulfilmentPointCategory: FragmentFulfilmentPointCategory {
              get {
                return FragmentFulfilmentPointCategory(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }
}
