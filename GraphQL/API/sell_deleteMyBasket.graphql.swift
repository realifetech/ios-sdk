// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  final class DeleteMyBasketMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation deleteMyBasket {
        deleteMyBasket {
          __typename
          success
          message
        }
      }
      """

    public let operationName: String = "deleteMyBasket"

    public init() {
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("deleteMyBasket", type: .object(DeleteMyBasket.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(deleteMyBasket: DeleteMyBasket? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "deleteMyBasket": deleteMyBasket.flatMap { (value: DeleteMyBasket) -> ResultMap in value.resultMap }])
      }

      public var deleteMyBasket: DeleteMyBasket? {
        get {
          return (resultMap["deleteMyBasket"] as? ResultMap).flatMap { DeleteMyBasket(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "deleteMyBasket")
        }
      }

      public struct DeleteMyBasket: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MutationResponse"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("success", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("message", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(success: Bool, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MutationResponse", "success": success, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var success: Bool {
          get {
            return resultMap["success"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "success")
          }
        }

        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }
}
