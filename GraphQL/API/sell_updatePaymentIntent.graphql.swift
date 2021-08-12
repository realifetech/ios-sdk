// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  final class UpdateMyPaymentIntentMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation updateMyPaymentIntent($id: ID!, $input: PaymentIntentUpdateInput!) {
        updateMyPaymentIntent(id: $id, input: $input) {
          __typename
          ...FragmentPaymentIntent
        }
      }
      """

    public let operationName: String = "updateMyPaymentIntent"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentPaymentIntent.fragmentDefinition)
      document.append("\n" + FragmentPaymentSource.fragmentDefinition)
      document.append("\n" + FragmentCard.fragmentDefinition)
      return document
    }

    public var id: GraphQLID
    public var input: PaymentIntentUpdateInput

    public init(id: GraphQLID, input: PaymentIntentUpdateInput) {
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
          GraphQLField("updateMyPaymentIntent", arguments: ["id": GraphQLVariable("id"), "input": GraphQLVariable("input")], type: .object(UpdateMyPaymentIntent.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(updateMyPaymentIntent: UpdateMyPaymentIntent? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "updateMyPaymentIntent": updateMyPaymentIntent.flatMap { (value: UpdateMyPaymentIntent) -> ResultMap in value.resultMap }])
      }

      public var updateMyPaymentIntent: UpdateMyPaymentIntent? {
        get {
          return (resultMap["updateMyPaymentIntent"] as? ResultMap).flatMap { UpdateMyPaymentIntent(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "updateMyPaymentIntent")
        }
      }

      public struct UpdateMyPaymentIntent: GraphQLSelectionSet {
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
