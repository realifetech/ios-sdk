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
          ...FragmentPaymentSource
        }
        amount
        currency
        livemode
        cancellationReason
        savePaymentSource
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
        GraphQLField("nextAction", type: .object(NextAction.selections)),
        GraphQLField("lastPaymentError", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, orderType: OrderType, orderId: GraphQLID, status: PaymentStatus, paymentSource: PaymentSource? = nil, amount: Int, currency: String, livemode: Bool, cancellationReason: CancellationReason? = nil, savePaymentSource: Bool? = nil, nextAction: NextAction? = nil, lastPaymentError: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "PaymentIntent", "id": id, "orderType": orderType, "orderId": orderId, "status": status, "paymentSource": paymentSource.flatMap { (value: PaymentSource) -> ResultMap in value.resultMap }, "amount": amount, "currency": currency, "livemode": livemode, "cancellationReason": cancellationReason, "savePaymentSource": savePaymentSource, "nextAction": nextAction.flatMap { (value: NextAction) -> ResultMap in value.resultMap }, "lastPaymentError": lastPaymentError])
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
          GraphQLFragmentSpread(FragmentPaymentSource.self),
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

        public var fragmentPaymentSource: FragmentPaymentSource {
          get {
            return FragmentPaymentSource(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
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
