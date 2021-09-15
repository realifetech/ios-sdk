// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  final class CreatePaymentIntentMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation createPaymentIntent($input: PaymentIntentInput!) {
        createPaymentIntent(input: $input) {
          __typename
          ...FragmentPaymentIntent
        }
      }
      """

    public let operationName: String = "createPaymentIntent"

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
          GraphQLField("createPaymentIntent", arguments: ["input": GraphQLVariable("input")], type: .object(CreatePaymentIntent.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(createPaymentIntent: CreatePaymentIntent? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "createPaymentIntent": createPaymentIntent.flatMap { (value: CreatePaymentIntent) -> ResultMap in value.resultMap }])
      }

      @available(*, deprecated, message: "use createMyPaymentIntent instead")
      public var createPaymentIntent: CreatePaymentIntent? {
        get {
          return (resultMap["createPaymentIntent"] as? ResultMap).flatMap { CreatePaymentIntent(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "createPaymentIntent")
        }
      }

      public struct CreatePaymentIntent: GraphQLSelectionSet {
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
