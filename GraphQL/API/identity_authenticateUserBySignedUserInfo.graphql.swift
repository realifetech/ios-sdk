// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  final class AuthenticateUserBySignedUserInfoMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation AuthenticateUserBySignedUserInfo($input: SignedUserInfoInput!) {
        authenticateUserBySignedUserInfo(input: $input) {
          __typename
          ...AuthToken
        }
      }
      """

    public let operationName: String = "AuthenticateUserBySignedUserInfo"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + AuthToken.fragmentDefinition)
      return document
    }

    public var input: SignedUserInfoInput

    public init(input: SignedUserInfoInput) {
      self.input = input
    }

    public var variables: GraphQLMap? {
      return ["input": input]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("authenticateUserBySignedUserInfo", arguments: ["input": GraphQLVariable("input")], type: .object(AuthenticateUserBySignedUserInfo.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(authenticateUserBySignedUserInfo: AuthenticateUserBySignedUserInfo? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "authenticateUserBySignedUserInfo": authenticateUserBySignedUserInfo.flatMap { (value: AuthenticateUserBySignedUserInfo) -> ResultMap in value.resultMap }])
      }

      public var authenticateUserBySignedUserInfo: AuthenticateUserBySignedUserInfo? {
        get {
          return (resultMap["authenticateUserBySignedUserInfo"] as? ResultMap).flatMap { AuthenticateUserBySignedUserInfo(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "authenticateUserBySignedUserInfo")
        }
      }

      public struct AuthenticateUserBySignedUserInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AuthToken"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(AuthToken.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(accessToken: String, tokenType: String, expiresIn: Int, refreshToken: String? = nil, scope: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "AuthToken", "accessToken": accessToken, "tokenType": tokenType, "expiresIn": expiresIn, "refreshToken": refreshToken, "scope": scope])
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

          public var authToken: AuthToken {
            get {
              return AuthToken(unsafeResultMap: resultMap)
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
