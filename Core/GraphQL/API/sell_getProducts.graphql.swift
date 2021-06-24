// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  final class GetProductsQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getProducts($pageSize: Int!, $page: Int, $filters: ProductFilter) {
        getProducts(pageSize: $pageSize, page: $page, filters: $filters) {
          __typename
          edges {
            __typename
            ...FragmentProduct
          }
          nextPage
        }
      }
      """

    public let operationName: String = "getProducts"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentProduct.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItem.fragmentDefinition)
      document.append("\n" + FragmentProductVariant.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPoint.fragmentDefinition)
      document.append("\n" + FragmentForm.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      document.append("\n" + FragmentVenue.fragmentDefinition)
      document.append("\n" + FragmentTimeslot.fragmentDefinition)
      return document
    }

    public var pageSize: Int
    public var page: Int?
    public var filters: ProductFilter?

    public init(pageSize: Int, page: Int? = nil, filters: ProductFilter? = nil) {
      self.pageSize = pageSize
      self.page = page
      self.filters = filters
    }

    public var variables: GraphQLMap? {
      return ["pageSize": pageSize, "page": page, "filters": filters]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getProducts", arguments: ["pageSize": GraphQLVariable("pageSize"), "page": GraphQLVariable("page"), "filters": GraphQLVariable("filters")], type: .object(GetProduct.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getProducts: GetProduct? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getProducts": getProducts.flatMap { (value: GetProduct) -> ResultMap in value.resultMap }])
      }

      public var getProducts: GetProduct? {
        get {
          return (resultMap["getProducts"] as? ResultMap).flatMap { GetProduct(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getProducts")
        }
      }

      public struct GetProduct: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
            GraphQLField("nextPage", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil, nextPage: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "ProductEdge", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "nextPage": nextPage])
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

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Product"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(FragmentProduct.self),
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

            public var fragmentProduct: FragmentProduct {
              get {
                return FragmentProduct(unsafeResultMap: resultMap)
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
