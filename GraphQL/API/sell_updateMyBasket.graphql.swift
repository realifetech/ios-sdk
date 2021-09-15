// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  final class UpdateMyBasketMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation updateMyBasket($input: BasketInput) {
        updateMyBasket(input: $input) {
          __typename
          ...FragmentBasket
        }
      }
      """

    public let operationName: String = "updateMyBasket"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentBasket.fragmentDefinition)
      document.append("\n" + FragmentTimeslot.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPoint.fragmentDefinition)
      document.append("\n" + FragmentForm.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      document.append("\n" + FragmentVenue.fragmentDefinition)
      document.append("\n" + FragmentProductVariant.fragmentDefinition)
      document.append("\n" + FragmentProduct.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItem.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItemSelection.fragmentDefinition)
      return document
    }

    public var input: BasketInput?

    public init(input: BasketInput? = nil) {
      self.input = input
    }

    public var variables: GraphQLMap? {
      return ["input": input]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("updateMyBasket", arguments: ["input": GraphQLVariable("input")], type: .object(UpdateMyBasket.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(updateMyBasket: UpdateMyBasket? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "updateMyBasket": updateMyBasket.flatMap { (value: UpdateMyBasket) -> ResultMap in value.resultMap }])
      }

      public var updateMyBasket: UpdateMyBasket? {
        get {
          return (resultMap["updateMyBasket"] as? ResultMap).flatMap { UpdateMyBasket(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "updateMyBasket")
        }
      }

      public struct UpdateMyBasket: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Basket"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentBasket.self),
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

          public var fragmentBasket: FragmentBasket {
            get {
              return FragmentBasket(unsafeResultMap: resultMap)
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
