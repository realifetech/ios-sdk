// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  final class CreateMyPaymentIntentMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation createMyPaymentIntent($input: PaymentIntentInput!) {
        createMyPaymentIntent(input: $input) {
          __typename
          ...FragmentPaymentIntent
        }
      }
      """

    public let operationName: String = "createMyPaymentIntent"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentPaymentIntent.fragmentDefinition)
      document.append("\n" + FragmentPaymentSource.fragmentDefinition)
      document.append("\n" + FragmentCard.fragmentDefinition)
      return document
    }

    public var input: PaymentIntentInput

    public init(input: PaymentIntentInput) {
      self.input = input
    }

    public var variables: GraphQLMap? {
      return ["input": input]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("createMyPaymentIntent", arguments: ["input": GraphQLVariable("input")], type: .object(CreateMyPaymentIntent.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(createMyPaymentIntent: CreateMyPaymentIntent? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "createMyPaymentIntent": createMyPaymentIntent.flatMap { (value: CreateMyPaymentIntent) -> ResultMap in value.resultMap }])
      }

      public var createMyPaymentIntent: CreateMyPaymentIntent? {
        get {
          return (resultMap["createMyPaymentIntent"] as? ResultMap).flatMap { CreateMyPaymentIntent(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "createMyPaymentIntent")
        }
      }

      public struct CreateMyPaymentIntent: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PaymentIntent"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentPaymentIntent.self),
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

          public var fragmentPaymentIntent: FragmentPaymentIntent {
            get {
              return FragmentPaymentIntent(unsafeResultMap: resultMap)
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
