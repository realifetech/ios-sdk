// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  final class GetFulfilmentPointCategoriesQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getFulfilmentPointCategories($pageSize: Int!, $page: Int = 1) {
        me {
          __typename
          fulfilmentPointCategories(pageSize: $pageSize, page: $page) {
            __typename
            edges {
              __typename
              ...FragmentFulfilmentPointCategory
            }
            nextPage
            lastPage
            firstPage
          }
        }
      }
      """

    public let operationName: String = "getFulfilmentPointCategories"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      return document
    }

    public var pageSize: Int
    public var page: Int?

    public init(pageSize: Int, page: Int? = nil) {
      self.pageSize = pageSize
      self.page = page
    }

    public var variables: GraphQLMap? {
      return ["pageSize": pageSize, "page": page]
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
            GraphQLField("fulfilmentPointCategories", arguments: ["pageSize": GraphQLVariable("pageSize"), "page": GraphQLVariable("page")], type: .object(FulfilmentPointCategory.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(fulfilmentPointCategories: FulfilmentPointCategory? = nil) {
          self.init(unsafeResultMap: ["__typename": "Context", "fulfilmentPointCategories": fulfilmentPointCategories.flatMap { (value: FulfilmentPointCategory) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fulfilmentPointCategories: FulfilmentPointCategory? {
          get {
            return (resultMap["fulfilmentPointCategories"] as? ResultMap).flatMap { FulfilmentPointCategory(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "fulfilmentPointCategories")
          }
        }

        public struct FulfilmentPointCategory: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["FulfilmentPointCategoryEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("edges", type: .list(.object(Edge.selections))),
              GraphQLField("nextPage", type: .scalar(Int.self)),
              GraphQLField("lastPage", type: .scalar(Int.self)),
              GraphQLField("firstPage", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(edges: [Edge?]? = nil, nextPage: Int? = nil, lastPage: Int? = nil, firstPage: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "FulfilmentPointCategoryEdge", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "nextPage": nextPage, "lastPage": lastPage, "firstPage": firstPage])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var edges: [Edge?]? {
            get {
              return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
            }
          }

          public var nextPage: Int? {
            get {
              return resultMap["nextPage"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "nextPage")
            }
          }

          public var lastPage: Int? {
            get {
              return resultMap["lastPage"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "lastPage")
            }
          }

          public var firstPage: Int? {
            get {
              return resultMap["firstPage"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "firstPage")
            }
          }

          public struct Edge: GraphQLSelectionSet {
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
}
