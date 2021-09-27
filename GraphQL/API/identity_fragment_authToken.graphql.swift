// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  struct AuthToken: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment AuthToken on AuthToken {
        __typename
        accessToken
        tokenType
        expiresIn
        refreshToken
        scope
      }
      """

    public static let possibleTypes: [String] = ["AuthToken"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("accessToken", type: .nonNull(.scalar(String.self))),
        GraphQLField("tokenType", type: .nonNull(.scalar(String.self))),
        GraphQLField("expiresIn", type: .nonNull(.scalar(Int.self))),
        GraphQLField("refreshToken", type: .scalar(String.self)),
        GraphQLField("scope", type: .scalar(String.self)),
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

    public var accessToken: String {
      get {
        return resultMap["accessToken"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "accessToken")
      }
    }

    public var tokenType: String {
      get {
        return resultMap["tokenType"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "tokenType")
      }
    }

    public var expiresIn: Int {
      get {
        return resultMap["expiresIn"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "expiresIn")
      }
    }

    public var refreshToken: String? {
      get {
        return resultMap["refreshToken"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "refreshToken")
      }
    }

    public var scope: String? {
      get {
        return resultMap["scope"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "scope")
      }
    }
  }
}
