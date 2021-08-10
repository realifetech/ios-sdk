// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  final class DeleteMyPaymentSourceMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation deleteMyPaymentSource($id: ID!) {
        deleteMyPaymentSource(id: $id) {
          __typename
          ...paymentSourceDetails
        }
      }
      """

    public let operationName: String = "deleteMyPaymentSource"

    public var queryDocument: String {
      var document: String = operationDefinition
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
      public static let possibleTypes: [String] = ["Mutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("deleteMyPaymentSource", arguments: ["id": GraphQLVariable("id")], type: .object(DeleteMyPaymentSource.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(deleteMyPaymentSource: DeleteMyPaymentSource? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "deleteMyPaymentSource": deleteMyPaymentSource.flatMap { (value: DeleteMyPaymentSource) -> ResultMap in value.resultMap }])
      }

      public var deleteMyPaymentSource: DeleteMyPaymentSource? {
        get {
          return (resultMap["deleteMyPaymentSource"] as? ResultMap).flatMap { DeleteMyPaymentSource(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "deleteMyPaymentSource")
        }
      }

      public struct DeleteMyPaymentSource: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PaymentSource"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(PaymentSourceDetails.self),
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

          public var paymentSourceDetails: PaymentSourceDetails {
            get {
              return PaymentSourceDetails(unsafeResultMap: resultMap)
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
