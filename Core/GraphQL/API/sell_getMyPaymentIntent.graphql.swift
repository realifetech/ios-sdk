// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  final class GetMyPaymentIntentQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getMyPaymentIntent($id: ID!) {
        getMyPaymentIntent(id: $id) {
          __typename
          ...paymentIntentDetails
        }
      }
      """

    public let operationName: String = "getMyPaymentIntent"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + PaymentIntentDetails.fragmentDefinition)
      document.append("\n" + PaymentSourceDetails.fragmentDefinition)
      document.append("\n" + CardDetails.fragmentDefinition)
      return document
    }

    public var id: GraphQLID

    public init(id: GraphQLID) {
      self.id = id
    }

    public var variables: GraphQLMap? {
      return ["id": id]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getMyPaymentIntent", arguments: ["id": GraphQLVariable("id")], type: .object(GetMyPaymentIntent.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getMyPaymentIntent: GetMyPaymentIntent? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getMyPaymentIntent": getMyPaymentIntent.flatMap { (value: GetMyPaymentIntent) -> ResultMap in value.resultMap }])
      }

      public var getMyPaymentIntent: GetMyPaymentIntent? {
        get {
          return (resultMap["getMyPaymentIntent"] as? ResultMap).flatMap { GetMyPaymentIntent(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getMyPaymentIntent")
        }
      }

      public struct GetMyPaymentIntent: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PaymentIntent"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(PaymentIntentDetails.self),
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

          public var paymentIntentDetails: PaymentIntentDetails {
            get {
              return PaymentIntentDetails(unsafeResultMap: resultMap)
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
