// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  struct FragmentPaymentIntent: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentPaymentIntent on PaymentIntent {
        __typename
        id
        orderType
        orderId
        status
        paymentSource {
          __typename
          id
          type
          default
          card {
            __typename
            ...cardDetails
          }
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
        }
        amount
        currency
        livemode
        cancellationReason
        savePaymentSource
        receiptEmail
        nextAction {
          __typename
          type
          url
        }
        lastPaymentError
      }
      """

    public static let possibleTypes: [String] = ["PaymentIntent"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("orderType", type: .nonNull(.scalar(OrderType.self))),
        GraphQLField("orderId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("status", type: .nonNull(.scalar(PaymentStatus.self))),
        GraphQLField("paymentSource", type: .object(PaymentSource.selections)),
        GraphQLField("amount", type: .nonNull(.scalar(Int.self))),
        GraphQLField("currency", type: .nonNull(.scalar(String.self))),
        GraphQLField("livemode", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("cancellationReason", type: .scalar(CancellationReason.self)),
        GraphQLField("savePaymentSource", type: .scalar(Bool.self)),
        GraphQLField("receiptEmail", type: .scalar(String.self)),
        GraphQLField("nextAction", type: .object(NextAction.selections)),
        GraphQLField("lastPaymentError", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, orderType: OrderType, orderId: GraphQLID, status: PaymentStatus, paymentSource: PaymentSource? = nil, amount: Int, currency: String, livemode: Bool, cancellationReason: CancellationReason? = nil, savePaymentSource: Bool? = nil, receiptEmail: String? = nil, nextAction: NextAction? = nil, lastPaymentError: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "PaymentIntent", "id": id, "orderType": orderType, "orderId": orderId, "status": status, "paymentSource": paymentSource.flatMap { (value: PaymentSource) -> ResultMap in value.resultMap }, "amount": amount, "currency": currency, "livemode": livemode, "cancellationReason": cancellationReason, "savePaymentSource": savePaymentSource, "receiptEmail": receiptEmail, "nextAction": nextAction.flatMap { (value: NextAction) -> ResultMap in value.resultMap }, "lastPaymentError": lastPaymentError])
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

    public var orderType: OrderType {
      get {
        return resultMap["orderType"]! as! OrderType
      }
      set {
        resultMap.updateValue(newValue, forKey: "orderType")
      }
    }

    public var orderId: GraphQLID {
      get {
        return resultMap["orderId"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "orderId")
      }
    }

    public var status: PaymentStatus {
      get {
        return resultMap["status"]! as! PaymentStatus
      }
      set {
        resultMap.updateValue(newValue, forKey: "status")
      }
    }

    public var paymentSource: PaymentSource? {
      get {
        return (resultMap["paymentSource"] as? ResultMap).flatMap { PaymentSource(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "paymentSource")
      }
    }

    public var amount: Int {
      get {
        return resultMap["amount"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "amount")
      }
    }

    public var currency: String {
      get {
        return resultMap["currency"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "currency")
      }
    }

    public var livemode: Bool {
      get {
        return resultMap["livemode"]! as! Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "livemode")
      }
    }

    public var cancellationReason: CancellationReason? {
      get {
        return resultMap["cancellationReason"] as? CancellationReason
      }
      set {
        resultMap.updateValue(newValue, forKey: "cancellationReason")
      }
    }

    public var savePaymentSource: Bool? {
      get {
        return resultMap["savePaymentSource"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "savePaymentSource")
      }
    }

    public var receiptEmail: String? {
      get {
        return resultMap["receiptEmail"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "receiptEmail")
      }
    }

    public var nextAction: NextAction? {
      get {
        return (resultMap["nextAction"] as? ResultMap).flatMap { NextAction(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "nextAction")
      }
    }

    public var lastPaymentError: String? {
      get {
        return resultMap["lastPaymentError"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "lastPaymentError")
      }
    }

    public struct PaymentSource: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PaymentSource"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("type", type: .nonNull(.scalar(PaymentSourceType.self))),
          GraphQLField("default", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("card", type: .object(Card.selections)),
          GraphQLField("billingDetails", type: .object(BillingDetail.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, type: PaymentSourceType, `default`: Bool, card: Card? = nil, billingDetails: BillingDetail? = nil) {
        self.init(unsafeResultMap: ["__typename": "PaymentSource", "id": id, "type": type, "default": `default`, "card": card.flatMap { (value: Card) -> ResultMap in value.resultMap }, "billingDetails": billingDetails.flatMap { (value: BillingDetail) -> ResultMap in value.resultMap }])
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

      public var card: Card? {
        get {
          return (resultMap["card"] as? ResultMap).flatMap { Card(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "card")
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

      public struct Card: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Card"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(CardDetails.self),
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

          public var cardDetails: CardDetails {
            get {
              return CardDetails(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct BillingDetail: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PaymentSourceBillingDetails"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("address", type: .object(Address.selections)),
            GraphQLField("email", type: .scalar(String.self)),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("phone", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(address: Address? = nil, email: String? = nil, name: String, phone: String? = nil) {
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

        public var name: String {
          get {
            return resultMap["name"]! as! String
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
    }

    public struct NextAction: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PaymentAction"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(PaymentActionType.self))),
          GraphQLField("url", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(type: PaymentActionType, url: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "PaymentAction", "type": type, "url": url])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var type: PaymentActionType {
        get {
          return resultMap["type"]! as! PaymentActionType
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      public var url: String? {
        get {
          return resultMap["url"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "url")
        }
      }
    }
  }
}
