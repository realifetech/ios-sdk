// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  final class GenerateNonceMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation generateNonce {
        generateNonce {
          __typename
          token
        }
      }
      """

    public let operationName: String = "generateNonce"

    public init() {
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("generateNonce", type: .object(GenerateNonce.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(generateNonce: GenerateNonce? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "generateNonce": generateNonce.flatMap { (value: GenerateNonce) -> ResultMap in value.resultMap }])
      }

      public var generateNonce: GenerateNonce? {
        get {
          return (resultMap["generateNonce"] as? ResultMap).flatMap { GenerateNonce(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "generateNonce")
        }
      }

      public struct GenerateNonce: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Nonce"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("token", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(token: String) {
          self.init(unsafeResultMap: ["__typename": "Nonce", "token": token])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var token: String {
          get {
            return resultMap["token"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "token")
          }
        }
      }
    }
  }
}
