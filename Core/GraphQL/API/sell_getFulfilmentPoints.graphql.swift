// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  final class GetFulfilmentPointsQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getFulfilmentPoints($pageSize: Int!, $page: Int = 1, $filters: FulfilmentPointFilter, $params: [FilterParam!]) {
        getFulfilmentPoints(
          page: $page
          pageSize: $pageSize
          filters: $filters
          params: $params
        ) {
          __typename
          edges {
            __typename
            ...FragmentFulfilmentPoint
          }
          nextPage
        }
      }
      """

    public let operationName: String = "getFulfilmentPoints"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentFulfilmentPoint.fragmentDefinition)
      document.append("\n" + FragmentForm.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      document.append("\n" + FragmentVenue.fragmentDefinition)
      document.append("\n" + FragmentTimeslot.fragmentDefinition)
      return document
    }

    public var pageSize: Int
    public var page: Int?
    public var filters: FulfilmentPointFilter?
    public var params: [FilterParam]?

    public init(pageSize: Int, page: Int? = nil, filters: FulfilmentPointFilter? = nil, params: [FilterParam]?) {
      self.pageSize = pageSize
      self.page = page
      self.filters = filters
      self.params = params
    }

    public var variables: GraphQLMap? {
      return ["pageSize": pageSize, "page": page, "filters": filters, "params": params]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getFulfilmentPoints", arguments: ["page": GraphQLVariable("page"), "pageSize": GraphQLVariable("pageSize"), "filters": GraphQLVariable("filters"), "params": GraphQLVariable("params")], type: .object(GetFulfilmentPoint.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getFulfilmentPoints: GetFulfilmentPoint? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getFulfilmentPoints": getFulfilmentPoints.flatMap { (value: GetFulfilmentPoint) -> ResultMap in value.resultMap }])
      }

      public var getFulfilmentPoints: GetFulfilmentPoint? {
        get {
          return (resultMap["getFulfilmentPoints"] as? ResultMap).flatMap { GetFulfilmentPoint(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getFulfilmentPoints")
        }
      }

      public struct GetFulfilmentPoint: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FulfilmentPointEdge"]

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
          self.init(unsafeResultMap: ["__typename": "FulfilmentPointEdge", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "nextPage": nextPage])
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
          public static let possibleTypes: [String] = ["FulfilmentPoint"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(FragmentFulfilmentPoint.self),
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

            public var fragmentFulfilmentPoint: FragmentFulfilmentPoint {
              get {
                return FragmentFulfilmentPoint(unsafeResultMap: resultMap)
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
