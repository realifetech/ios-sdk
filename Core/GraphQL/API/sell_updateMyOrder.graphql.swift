// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  final class UpdateMyOrderMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation updateMyOrder($id: ID!, $input: OrderUpdateInput) {
        updateMyOrder(id: $id, input: $input) {
          __typename
          ...FragmentOrder
        }
      }
      """

    public let operationName: String = "updateMyOrder"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentOrder.fragmentDefinition)
      document.append("\n" + FragmentProduct.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItem.fragmentDefinition)
      document.append("\n" + FragmentProductVariant.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPoint.fragmentDefinition)
      document.append("\n" + FragmentForm.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      document.append("\n" + FragmentVenue.fragmentDefinition)
      document.append("\n" + FragmentTimeslot.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItemSelection.fragmentDefinition)
      document.append("\n" + FragmentUser.fragmentDefinition)
      document.append("\n" + FragmentSeatInfo.fragmentDefinition)
      return document
    }

    public var id: GraphQLID
    public var input: OrderUpdateInput?

    public init(id: GraphQLID, input: OrderUpdateInput? = nil) {
      self.id = id
      self.input = input
    }

    public var variables: GraphQLMap? {
      return ["id": id, "input": input]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("updateMyOrder", arguments: ["id": GraphQLVariable("id"), "input": GraphQLVariable("input")], type: .object(UpdateMyOrder.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(updateMyOrder: UpdateMyOrder? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "updateMyOrder": updateMyOrder.flatMap { (value: UpdateMyOrder) -> ResultMap in value.resultMap }])
      }

      public var updateMyOrder: UpdateMyOrder? {
        get {
          return (resultMap["updateMyOrder"] as? ResultMap).flatMap { UpdateMyOrder(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "updateMyOrder")
        }
      }

      public struct UpdateMyOrder: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Order"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentOrder.self),
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

          public var fragmentOrder: FragmentOrder {
            get {
              return FragmentOrder(unsafeResultMap: resultMap)
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
