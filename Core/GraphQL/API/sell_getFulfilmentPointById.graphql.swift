// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  final class GetFulfilmentPointByIdQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getFulfilmentPointById($id: ID!, $params: [FilterParam!]) {
        getFulfilmentPoint(id: $id, params: $params) {
          __typename
          ...FragmentFulfilmentPoint
        }
      }
      """

    public let operationName: String = "getFulfilmentPointById"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentFulfilmentPoint.fragmentDefinition)
      document.append("\n" + FragmentForm.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      document.append("\n" + FragmentVenue.fragmentDefinition)
      document.append("\n" + FragmentTimeslot.fragmentDefinition)
      return document
    }

    public var id: GraphQLID
    public var params: [FilterParam]?

    public init(id: GraphQLID, params: [FilterParam]?) {
      self.id = id
      self.params = params
    }

    public var variables: GraphQLMap? {
      return ["id": id, "params": params]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getFulfilmentPoint", arguments: ["id": GraphQLVariable("id"), "params": GraphQLVariable("params")], type: .object(GetFulfilmentPoint.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getFulfilmentPoint: GetFulfilmentPoint? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getFulfilmentPoint": getFulfilmentPoint.flatMap { (value: GetFulfilmentPoint) -> ResultMap in value.resultMap }])
      }

      public var getFulfilmentPoint: GetFulfilmentPoint? {
        get {
          return (resultMap["getFulfilmentPoint"] as? ResultMap).flatMap { GetFulfilmentPoint(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getFulfilmentPoint")
        }
      }

      public struct GetFulfilmentPoint: GraphQLSelectionSet {
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
