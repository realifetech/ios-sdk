// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  final class CheckoutMyBasketMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation checkoutMyBasket($input: CheckoutInput) {
        checkoutMyBasket(input: $input) {
          __typename
          ...FragmentOrder
        }
      }
      """

    public let operationName: String = "checkoutMyBasket"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentOrder.fragmentDefinition)
      document.append("\n" + FragmentProduct.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPoint.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      document.append("\n" + FragmentTimeslot.fragmentDefinition)
      document.append("\n" + FragmentProductVariant.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItemSelection.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItem.fragmentDefinition)
      return document
    }

    public var input: CheckoutInput?

    public init(input: CheckoutInput? = nil) {
      self.input = input
    }

    public var variables: GraphQLMap? {
      return ["input": input]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("checkoutMyBasket", arguments: ["input": GraphQLVariable("input")], type: .object(CheckoutMyBasket.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(checkoutMyBasket: CheckoutMyBasket? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "checkoutMyBasket": checkoutMyBasket.flatMap { (value: CheckoutMyBasket) -> ResultMap in value.resultMap }])
      }

      public var checkoutMyBasket: CheckoutMyBasket? {
        get {
          return (resultMap["checkoutMyBasket"] as? ResultMap).flatMap { CheckoutMyBasket(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "checkoutMyBasket")
        }
      }

      public struct CheckoutMyBasket: GraphQLSelectionSet {
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
