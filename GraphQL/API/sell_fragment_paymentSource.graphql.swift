// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  struct FragmentPaymentSource: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentPaymentSource on PaymentSource {
        __typename
        id
        type
        default
        billingDetails {
          __typename
          address {
            __typename
            city
            country
            line1
            line2
            postalCode
            state
          }
          email
          name
          phone
        }
        card {
          __typename
          ...FragmentCard
        }
      }
      """

    public static let possibleTypes: [String] = ["PaymentSource"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("type", type: .nonNull(.scalar(PaymentSourceType.self))),
        GraphQLField("default", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("billingDetails", type: .object(BillingDetail.selections)),
        GraphQLField("card", type: .object(Card.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, type: PaymentSourceType, `default`: Bool, billingDetails: BillingDetail? = nil, card: Card? = nil) {
      self.init(unsafeResultMap: ["__typename": "PaymentSource", "id": id, "type": type, "default": `default`, "billingDetails": billingDetails.flatMap { (value: BillingDetail) -> ResultMap in value.resultMap }, "card": card.flatMap { (value: Card) -> ResultMap in value.resultMap }])
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

    public var type: PaymentSourceType {
      get {
        return resultMap["type"]! as! PaymentSourceType
      }
      set {
        resultMap.updateValue(newValue, forKey: "type")
      }
    }

    public var `default`: Bool {
      get {
        return resultMap["default"]! as! Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "default")
      }
    }

    public var billingDetails: BillingDetail? {
      get {
        return (resultMap["billingDetails"] as? ResultMap).flatMap { BillingDetail(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "billingDetails")
      }
    }

    public var card: Card? {
      get {
        return (resultMap["card"] as? ResultMap).flatMap { Card(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "card")
      }
    }

    public struct BillingDetail: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PaymentSourceBillingDetails"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("address", type: .object(Address.selections)),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("phone", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(address: Address? = nil, email: String? = nil, name: String? = nil, phone: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "PaymentSourceBillingDetails", "address": address.flatMap { (value: Address) -> ResultMap in value.resultMap }, "email": email, "name": name, "phone": phone])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var address: Address? {
        get {
          return (resultMap["address"] as? ResultMap).flatMap { Address(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "address")
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

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
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

      public struct Address: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PaymentSourceAddress"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("city", type: .scalar(String.self)),
            GraphQLField("country", type: .scalar(String.self)),
            GraphQLField("line1", type: .scalar(String.self)),
            GraphQLField("line2", type: .scalar(String.self)),
            GraphQLField("postalCode", type: .scalar(String.self)),
            GraphQLField("state", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(city: String? = nil, country: String? = nil, line1: String? = nil, line2: String? = nil, postalCode: String? = nil, state: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "PaymentSourceAddress", "city": city, "country": country, "line1": line1, "line2": line2, "postalCode": postalCode, "state": state])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var city: String? {
          get {
            return resultMap["city"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "city")
          }
        }

        public var country: String? {
          get {
            return resultMap["country"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "country")
          }
        }

        public var line1: String? {
          get {
            return resultMap["line1"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "line1")
          }
        }

        public var line2: String? {
          get {
            return resultMap["line2"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "line2")
          }
        }

        public var postalCode: String? {
          get {
            return resultMap["postalCode"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "postalCode")
          }
        }

        public var state: String? {
          get {
            return resultMap["state"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "state")
          }
        }
      }
    }

    public struct Card: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Card"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragmentCard.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(brand: String, numberToken: String, expMonth: String, expYear: String, last4: String, fingerprint: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Card", "brand": brand, "numberToken": numberToken, "expMonth": expMonth, "expYear": expYear, "last4": last4, "fingerprint": fingerprint])
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

        public var fragmentCard: FragmentCard {
          get {
            return FragmentCard(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }

  struct FragmentCard: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentCard on Card {
        __typename
        brand
        numberToken
        expMonth
        expYear
        last4
        fingerprint
      }
      """

    public static let possibleTypes: [String] = ["Card"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("brand", type: .nonNull(.scalar(String.self))),
        GraphQLField("numberToken", type: .nonNull(.scalar(String.self))),
        GraphQLField("expMonth", type: .nonNull(.scalar(String.self))),
        GraphQLField("expYear", type: .nonNull(.scalar(String.self))),
        GraphQLField("last4", type: .nonNull(.scalar(String.self))),
        GraphQLField("fingerprint", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(brand: String, numberToken: String, expMonth: String, expYear: String, last4: String, fingerprint: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Card", "brand": brand, "numberToken": numberToken, "expMonth": expMonth, "expYear": expYear, "last4": last4, "fingerprint": fingerprint])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var brand: String {
      get {
        return resultMap["brand"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "brand")
      }
    }

    public var numberToken: String {
      get {
        return resultMap["numberToken"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "numberToken")
      }
    }

    public var expMonth: String {
      get {
        return resultMap["expMonth"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "expMonth")
      }
    }

    public var expYear: String {
      get {
        return resultMap["expYear"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "expYear")
      }
    }

    public var last4: String {
      get {
        return resultMap["last4"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "last4")
      }
    }

    public var fingerprint: String? {
      get {
        return resultMap["fingerprint"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "fingerprint")
      }
    }
  }
}
