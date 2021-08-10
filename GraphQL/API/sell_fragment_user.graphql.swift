// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  struct FragmentUser: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentUser on User {
        __typename
        id
        email
        token
        authType
        status
        lastLogin
        ticketsFetchedAt
        firstName
        lastName
        gender
        phone
        dob
        userConsent
      }
      """

    public static let possibleTypes: [String] = ["User"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("email", type: .scalar(String.self)),
        GraphQLField("token", type: .scalar(String.self)),
        GraphQLField("authType", type: .scalar(String.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("lastLogin", type: .scalar(String.self)),
        GraphQLField("ticketsFetchedAt", type: .scalar(String.self)),
        GraphQLField("firstName", type: .scalar(String.self)),
        GraphQLField("lastName", type: .scalar(String.self)),
        GraphQLField("gender", type: .scalar(String.self)),
        GraphQLField("phone", type: .scalar(String.self)),
        GraphQLField("dob", type: .scalar(String.self)),
        GraphQLField("userConsent", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, email: String? = nil, token: String? = nil, authType: String? = nil, status: String? = nil, lastLogin: String? = nil, ticketsFetchedAt: String? = nil, firstName: String? = nil, lastName: String? = nil, gender: String? = nil, phone: String? = nil, dob: String? = nil, userConsent: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "User", "id": id, "email": email, "token": token, "authType": authType, "status": status, "lastLogin": lastLogin, "ticketsFetchedAt": ticketsFetchedAt, "firstName": firstName, "lastName": lastName, "gender": gender, "phone": phone, "dob": dob, "userConsent": userConsent])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var email: String? {
      get {
        return resultMap["email"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "email")
      }
    }

    public var token: String? {
      get {
        return resultMap["token"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "token")
      }
    }

    public var authType: String? {
      get {
        return resultMap["authType"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "authType")
      }
    }

    public var status: String? {
      get {
        return resultMap["status"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "status")
      }
    }

    public var lastLogin: String? {
      get {
        return resultMap["lastLogin"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "lastLogin")
      }
    }

    public var ticketsFetchedAt: String? {
      get {
        return resultMap["ticketsFetchedAt"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "ticketsFetchedAt")
      }
    }

    public var firstName: String? {
      get {
        return resultMap["firstName"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "firstName")
      }
    }

    public var lastName: String? {
      get {
        return resultMap["lastName"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "lastName")
      }
    }

    public var gender: String? {
      get {
        return resultMap["gender"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "gender")
      }
    }

    public var phone: String? {
      get {
        return resultMap["phone"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "phone")
      }
    }

    public var dob: String? {
      get {
        return resultMap["dob"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "dob")
      }
    }

    public var userConsent: String? {
      get {
        return resultMap["userConsent"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "userConsent")
      }
    }
  }
}
