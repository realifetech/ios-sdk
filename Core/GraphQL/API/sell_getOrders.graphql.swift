// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  final class GetOrdersQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getOrders($pageSize: Int!, $page: Int = 1) {
        me {
          __typename
          orders(pageSize: $pageSize, page: $page) {
            __typename
            ...FragmentOrders
          }
        }
      }
      """

    public let operationName: String = "getOrders"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentOrders.fragmentDefinition)
      document.append("\n" + FragmentOrder.fragmentDefinition)
      document.append("\n" + FragmentProduct.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPoint.fragmentDefinition)
      document.append("\n" + FragmentForm.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      document.append("\n" + FragmentVenue.fragmentDefinition)
      document.append("\n" + FragmentTimeslot.fragmentDefinition)
      document.append("\n" + FragmentProductVariant.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItemSelection.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItem.fragmentDefinition)
      document.append("\n" + FragmentUser.fragmentDefinition)
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
            GraphQLField("orders", arguments: ["pageSize": GraphQLVariable("pageSize"), "page": GraphQLVariable("page")], type: .object(Order.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(orders: Order? = nil) {
          self.init(unsafeResultMap: ["__typename": "Context", "orders": orders.flatMap { (value: Order) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var orders: Order? {
          get {
            return (resultMap["orders"] as? ResultMap).flatMap { Order(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "orders")
          }
        }

        public struct Order: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["OrderEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(FragmentOrders.self),
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

            public var fragmentOrders: FragmentOrders {
              get {
                return FragmentOrders(unsafeResultMap: resultMap)
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
