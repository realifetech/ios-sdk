// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  final class CreateMyBasketMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation createMyBasket($input: BasketInput) {
        createMyBasket(input: $input) {
          __typename
          ...FragmentBasket
        }
      }
      """

    public let operationName: String = "createMyBasket"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentBasket.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPoint.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      document.append("\n" + FragmentTimeslot.fragmentDefinition)
      document.append("\n" + FragmentProductVariant.fragmentDefinition)
      document.append("\n" + FragmentProduct.fragmentDefinition)
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
          GraphQLField("createMyBasket", arguments: ["input": GraphQLVariable("input")], type: .object(CreateMyBasket.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(createMyBasket: CreateMyBasket? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "createMyBasket": createMyBasket.flatMap { (value: CreateMyBasket) -> ResultMap in value.resultMap }])
      }

      public var createMyBasket: CreateMyBasket? {
        get {
          return (resultMap["createMyBasket"] as? ResultMap).flatMap { CreateMyBasket(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "createMyBasket")
        }
      }

      public struct CreateMyBasket: GraphQLSelectionSet {
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
