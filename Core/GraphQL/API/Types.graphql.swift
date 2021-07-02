// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public enum ApolloType {
  public struct AnalyticEvent: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - type
    ///   - action
    ///   - new
    ///   - old
    ///   - version
    ///   - timestamp
    public init(type: String, action: String, new: Swift.Optional<String?> = nil, old: Swift.Optional<String?> = nil, version: String, timestamp: String) {
      graphQLMap = ["type": type, "action": action, "new": new, "old": old, "version": version, "timestamp": timestamp]
    }

    public var type: String {
      get {
        return graphQLMap["type"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "type")
      }
    }

    public var action: String {
      get {
        return graphQLMap["action"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "action")
      }
    }

    public var new: Swift.Optional<String?> {
      get {
        return graphQLMap["new"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "new")
      }
    }

    public var old: Swift.Optional<String?> {
      get {
        return graphQLMap["old"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "old")
      }
    }

    public var version: String {
      get {
        return graphQLMap["version"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "version")
      }
    }

    public var timestamp: String {
      get {
        return graphQLMap["timestamp"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "timestamp")
      }
    }
  }

  public enum ScreenType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case discover
    case shop
    case events
    case wallet
    case booking
    case lineup
    case social
    case generic
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "discover": self = .discover
        case "shop": self = .shop
        case "events": self = .events
        case "wallet": self = .wallet
        case "booking": self = .booking
        case "lineup": self = .lineup
        case "social": self = .social
        case "generic": self = .generic
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .discover: return "discover"
        case .shop: return "shop"
        case .events: return "events"
        case .wallet: return "wallet"
        case .booking: return "booking"
        case .lineup: return "lineup"
        case .social: return "social"
        case .generic: return "generic"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: ScreenType, rhs: ScreenType) -> Bool {
      switch (lhs, rhs) {
        case (.discover, .discover): return true
        case (.shop, .shop): return true
        case (.events, .events): return true
        case (.wallet, .wallet): return true
        case (.booking, .booking): return true
        case (.lineup, .lineup): return true
        case (.social, .social): return true
        case (.generic, .generic): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [ScreenType] {
      return [
        .discover,
        .shop,
        .events,
        .wallet,
        .booking,
        .lineup,
        .social,
        .generic,
      ]
    }
  }

  public enum WebPageType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case audioGuidesHelp
    case tAndC
    case privacy
    case about
    case aboutCompany
    case important
    case info
    case times
    case event
    case welcome
    case travel
    case faq
    case food
    case program
    case social
    case menu
    case legal
    case quizHelp
    case quizTerms
    case quizWinner
    case ntpTerms
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "audioGuidesHelp": self = .audioGuidesHelp
        case "tAndC": self = .tAndC
        case "privacy": self = .privacy
        case "about": self = .about
        case "aboutCompany": self = .aboutCompany
        case "important": self = .important
        case "info": self = .info
        case "times": self = .times
        case "event": self = .event
        case "welcome": self = .welcome
        case "travel": self = .travel
        case "faq": self = .faq
        case "food": self = .food
        case "program": self = .program
        case "social": self = .social
        case "menu": self = .menu
        case "legal": self = .legal
        case "quizHelp": self = .quizHelp
        case "quizTerms": self = .quizTerms
        case "quizWinner": self = .quizWinner
        case "ntpTerms": self = .ntpTerms
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .audioGuidesHelp: return "audioGuidesHelp"
        case .tAndC: return "tAndC"
        case .privacy: return "privacy"
        case .about: return "about"
        case .aboutCompany: return "aboutCompany"
        case .important: return "important"
        case .info: return "info"
        case .times: return "times"
        case .event: return "event"
        case .welcome: return "welcome"
        case .travel: return "travel"
        case .faq: return "faq"
        case .food: return "food"
        case .program: return "program"
        case .social: return "social"
        case .menu: return "menu"
        case .legal: return "legal"
        case .quizHelp: return "quizHelp"
        case .quizTerms: return "quizTerms"
        case .quizWinner: return "quizWinner"
        case .ntpTerms: return "ntpTerms"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: WebPageType, rhs: WebPageType) -> Bool {
      switch (lhs, rhs) {
        case (.audioGuidesHelp, .audioGuidesHelp): return true
        case (.tAndC, .tAndC): return true
        case (.privacy, .privacy): return true
        case (.about, .about): return true
        case (.aboutCompany, .aboutCompany): return true
        case (.important, .important): return true
        case (.info, .info): return true
        case (.times, .times): return true
        case (.event, .event): return true
        case (.welcome, .welcome): return true
        case (.travel, .travel): return true
        case (.faq, .faq): return true
        case (.food, .food): return true
        case (.program, .program): return true
        case (.social, .social): return true
        case (.menu, .menu): return true
        case (.legal, .legal): return true
        case (.quizHelp, .quizHelp): return true
        case (.quizTerms, .quizTerms): return true
        case (.quizWinner, .quizWinner): return true
        case (.ntpTerms, .ntpTerms): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [WebPageType] {
      return [
        .audioGuidesHelp,
        .tAndC,
        .privacy,
        .about,
        .aboutCompany,
        .important,
        .info,
        .times,
        .event,
        .welcome,
        .travel,
        .faq,
        .food,
        .program,
        .social,
        .menu,
        .legal,
        .quizHelp,
        .quizTerms,
        .quizWinner,
        .ntpTerms,
      ]
    }
  }

  public struct PaymentSourceInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - id
    ///   - billingDetails
    ///   - card
    public init(id: Swift.Optional<GraphQLID?> = nil, billingDetails: Swift.Optional<PaymentSourceBillingDetailsInput?> = nil, card: Swift.Optional<CardInput?> = nil) {
      graphQLMap = ["id": id, "billingDetails": billingDetails, "card": card]
    }

    public var id: Swift.Optional<GraphQLID?> {
      get {
        return graphQLMap["id"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "id")
      }
    }

    public var billingDetails: Swift.Optional<PaymentSourceBillingDetailsInput?> {
      get {
        return graphQLMap["billingDetails"] as? Swift.Optional<PaymentSourceBillingDetailsInput?> ?? Swift.Optional<PaymentSourceBillingDetailsInput?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "billingDetails")
      }
    }

    public var card: Swift.Optional<CardInput?> {
      get {
        return graphQLMap["card"] as? Swift.Optional<CardInput?> ?? Swift.Optional<CardInput?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "card")
      }
    }
  }

  public struct PaymentSourceBillingDetailsInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - address
    ///   - email
    ///   - name
    ///   - phone
    public init(address: Swift.Optional<PaymentSourceAddressInput?> = nil, email: Swift.Optional<String?> = nil, name: Swift.Optional<String?> = nil, phone: Swift.Optional<String?> = nil) {
      graphQLMap = ["address": address, "email": email, "name": name, "phone": phone]
    }

    public var address: Swift.Optional<PaymentSourceAddressInput?> {
      get {
        return graphQLMap["address"] as? Swift.Optional<PaymentSourceAddressInput?> ?? Swift.Optional<PaymentSourceAddressInput?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "address")
      }
    }

    public var email: Swift.Optional<String?> {
      get {
        return graphQLMap["email"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "email")
      }
    }

    public var name: Swift.Optional<String?> {
      get {
        return graphQLMap["name"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "name")
      }
    }

    public var phone: Swift.Optional<String?> {
      get {
        return graphQLMap["phone"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "phone")
      }
    }
  }

  public struct PaymentSourceAddressInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - city
    ///   - country
    ///   - line1
    ///   - line2
    ///   - postalCode
    ///   - state
    public init(city: Swift.Optional<String?> = nil, country: Swift.Optional<String?> = nil, line1: Swift.Optional<String?> = nil, line2: Swift.Optional<String?> = nil, postalCode: Swift.Optional<String?> = nil, state: Swift.Optional<String?> = nil) {
      graphQLMap = ["city": city, "country": country, "line1": line1, "line2": line2, "postalCode": postalCode, "state": state]
    }

    public var city: Swift.Optional<String?> {
      get {
        return graphQLMap["city"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "city")
      }
    }

    public var country: Swift.Optional<String?> {
      get {
        return graphQLMap["country"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "country")
      }
    }

    public var line1: Swift.Optional<String?> {
      get {
        return graphQLMap["line1"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "line1")
      }
    }

    public var line2: Swift.Optional<String?> {
      get {
        return graphQLMap["line2"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "line2")
      }
    }

    public var postalCode: Swift.Optional<String?> {
      get {
        return graphQLMap["postalCode"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "postalCode")
      }
    }

    public var state: Swift.Optional<String?> {
      get {
        return graphQLMap["state"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "state")
      }
    }
  }

  public struct CardInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - brand
    ///   - numberToken
    ///   - expMonth
    ///   - expYear
    ///   - securityCodeToken
    ///   - last4
    public init(brand: String, numberToken: String, expMonth: String, expYear: String, securityCodeToken: String, last4: String) {
      graphQLMap = ["brand": brand, "numberToken": numberToken, "expMonth": expMonth, "expYear": expYear, "securityCodeToken": securityCodeToken, "last4": last4]
    }

    public var brand: String {
      get {
        return graphQLMap["brand"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "brand")
      }
    }

    public var numberToken: String {
      get {
        return graphQLMap["numberToken"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "numberToken")
      }
    }

    public var expMonth: String {
      get {
        return graphQLMap["expMonth"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "expMonth")
      }
    }

    public var expYear: String {
      get {
        return graphQLMap["expYear"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "expYear")
      }
    }

    public var securityCodeToken: String {
      get {
        return graphQLMap["securityCodeToken"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "securityCodeToken")
      }
    }

    public var last4: String {
      get {
        return graphQLMap["last4"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "last4")
      }
    }
  }

  public struct CheckoutInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - netAmount
    ///   - language
    public init(netAmount: Swift.Optional<Int?> = nil, language: Swift.Optional<Language?> = nil) {
      graphQLMap = ["netAmount": netAmount, "language": language]
    }

    public var netAmount: Swift.Optional<Int?> {
      get {
        return graphQLMap["netAmount"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "netAmount")
      }
    }

    public var language: Swift.Optional<Language?> {
      get {
        return graphQLMap["language"] as? Swift.Optional<Language?> ?? Swift.Optional<Language?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "language")
      }
    }
  }

  public enum Language: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case en
    case fr
    case nr
    case de
    case sv
    case nb
    case lt
    case pt
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "en": self = .en
        case "fr": self = .fr
        case "nr": self = .nr
        case "de": self = .de
        case "sv": self = .sv
        case "nb": self = .nb
        case "lt": self = .lt
        case "pt": self = .pt
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .en: return "en"
        case .fr: return "fr"
        case .nr: return "nr"
        case .de: return "de"
        case .sv: return "sv"
        case .nb: return "nb"
        case .lt: return "lt"
        case .pt: return "pt"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: Language, rhs: Language) -> Bool {
      switch (lhs, rhs) {
        case (.en, .en): return true
        case (.fr, .fr): return true
        case (.nr, .nr): return true
        case (.de, .de): return true
        case (.sv, .sv): return true
        case (.nb, .nb): return true
        case (.lt, .lt): return true
        case (.pt, .pt): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [Language] {
      return [
        .en,
        .fr,
        .nr,
        .de,
        .sv,
        .nb,
        .lt,
        .pt,
      ]
    }
  }

  public struct BasketInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - collectionDate
    ///   - collectionPreferenceType
    ///   - timeslot
    ///   - fulfilmentPoint
    ///   - seatInfo
    ///   - items
    public init(collectionDate: Swift.Optional<String?> = nil, collectionPreferenceType: Swift.Optional<CollectionPreferenceType?> = nil, timeslot: Swift.Optional<GraphQLID?> = nil, fulfilmentPoint: GraphQLID, seatInfo: Swift.Optional<SeatInfoInput?> = nil, items: [BasketItemInput?]) {
      graphQLMap = ["collectionDate": collectionDate, "collectionPreferenceType": collectionPreferenceType, "timeslot": timeslot, "fulfilmentPoint": fulfilmentPoint, "seatInfo": seatInfo, "items": items]
    }

    public var collectionDate: Swift.Optional<String?> {
      get {
        return graphQLMap["collectionDate"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "collectionDate")
      }
    }

    public var collectionPreferenceType: Swift.Optional<CollectionPreferenceType?> {
      get {
        return graphQLMap["collectionPreferenceType"] as? Swift.Optional<CollectionPreferenceType?> ?? Swift.Optional<CollectionPreferenceType?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "collectionPreferenceType")
      }
    }

    public var timeslot: Swift.Optional<GraphQLID?> {
      get {
        return graphQLMap["timeslot"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "timeslot")
      }
    }

    public var fulfilmentPoint: GraphQLID {
      get {
        return graphQLMap["fulfilmentPoint"] as! GraphQLID
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "fulfilmentPoint")
      }
    }

    public var seatInfo: Swift.Optional<SeatInfoInput?> {
      get {
        return graphQLMap["seatInfo"] as? Swift.Optional<SeatInfoInput?> ?? Swift.Optional<SeatInfoInput?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "seatInfo")
      }
    }

    public var items: [BasketItemInput?] {
      get {
        return graphQLMap["items"] as! [BasketItemInput?]
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "items")
      }
    }
  }

  public enum CollectionPreferenceType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case checkin
    case asap
    case preorder
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "CHECKIN": self = .checkin
        case "ASAP": self = .asap
        case "PREORDER": self = .preorder
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .checkin: return "CHECKIN"
        case .asap: return "ASAP"
        case .preorder: return "PREORDER"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: CollectionPreferenceType, rhs: CollectionPreferenceType) -> Bool {
      switch (lhs, rhs) {
        case (.checkin, .checkin): return true
        case (.asap, .asap): return true
        case (.preorder, .preorder): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [CollectionPreferenceType] {
      return [
        .checkin,
        .asap,
        .preorder,
      ]
    }
  }

  public struct SeatInfoInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - row
    ///   - seat
    ///   - block
    ///   - table
    public init(row: Swift.Optional<String?> = nil, seat: Swift.Optional<String?> = nil, block: Swift.Optional<String?> = nil, table: Swift.Optional<String?> = nil) {
      graphQLMap = ["Row": row, "Seat": seat, "Block": block, "Table": table]
    }

    public var row: Swift.Optional<String?> {
      get {
        return graphQLMap["Row"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "Row")
      }
    }

    public var seat: Swift.Optional<String?> {
      get {
        return graphQLMap["Seat"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "Seat")
      }
    }

    public var block: Swift.Optional<String?> {
      get {
        return graphQLMap["Block"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "Block")
      }
    }

    public var table: Swift.Optional<String?> {
      get {
        return graphQLMap["Table"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "Table")
      }
    }
  }

  public struct BasketItemInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - product
    ///   - productVariant
    ///   - fulfilmentPoint
    ///   - quantity
    ///   - productModifierItems
    public init(product: Swift.Optional<GraphQLID?> = nil, productVariant: Swift.Optional<GraphQLID?> = nil, fulfilmentPoint: Swift.Optional<GraphQLID?> = nil, quantity: Swift.Optional<Int?> = nil, productModifierItems: Swift.Optional<[ProductModifierItemSelectionInput?]?> = nil) {
      graphQLMap = ["product": product, "productVariant": productVariant, "fulfilmentPoint": fulfilmentPoint, "quantity": quantity, "productModifierItems": productModifierItems]
    }

    public var product: Swift.Optional<GraphQLID?> {
      get {
        return graphQLMap["product"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "product")
      }
    }

    public var productVariant: Swift.Optional<GraphQLID?> {
      get {
        return graphQLMap["productVariant"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "productVariant")
      }
    }

    public var fulfilmentPoint: Swift.Optional<GraphQLID?> {
      get {
        return graphQLMap["fulfilmentPoint"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "fulfilmentPoint")
      }
    }

    public var quantity: Swift.Optional<Int?> {
      get {
        return graphQLMap["quantity"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "quantity")
      }
    }

    public var productModifierItems: Swift.Optional<[ProductModifierItemSelectionInput?]?> {
      get {
        return graphQLMap["productModifierItems"] as? Swift.Optional<[ProductModifierItemSelectionInput?]?> ?? Swift.Optional<[ProductModifierItemSelectionInput?]?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "productModifierItems")
      }
    }
  }

  public struct ProductModifierItemSelectionInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - productModifierItemId
    ///   - quantity
    public init(productModifierItemId: Swift.Optional<GraphQLID?> = nil, quantity: Swift.Optional<Int?> = nil) {
      graphQLMap = ["productModifierItemId": productModifierItemId, "quantity": quantity]
    }

    public var productModifierItemId: Swift.Optional<GraphQLID?> {
      get {
        return graphQLMap["productModifierItemId"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "productModifierItemId")
      }
    }

    public var quantity: Swift.Optional<Int?> {
      get {
        return graphQLMap["quantity"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "quantity")
      }
    }
  }

  public struct PaymentIntentInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - orderType
    ///   - orderId
    ///   - paymentSource
    ///   - amount
    ///   - currency
    ///   - savePaymentSource
    ///   - livemode
    ///   - cancellationReason
    ///   - receiptEmail
    public init(orderType: OrderType, orderId: GraphQLID, paymentSource: Swift.Optional<PaymentSourceInput?> = nil, amount: Int, currency: String, savePaymentSource: Bool, livemode: Bool, cancellationReason: Swift.Optional<CancellationReason?> = nil, receiptEmail: Swift.Optional<String?> = nil) {
      graphQLMap = ["orderType": orderType, "orderId": orderId, "paymentSource": paymentSource, "amount": amount, "currency": currency, "savePaymentSource": savePaymentSource, "livemode": livemode, "cancellationReason": cancellationReason, "receiptEmail": receiptEmail]
    }

    public var orderType: OrderType {
      get {
        return graphQLMap["orderType"] as! OrderType
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "orderType")
      }
    }

    public var orderId: GraphQLID {
      get {
        return graphQLMap["orderId"] as! GraphQLID
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "orderId")
      }
    }

    public var paymentSource: Swift.Optional<PaymentSourceInput?> {
      get {
        return graphQLMap["paymentSource"] as? Swift.Optional<PaymentSourceInput?> ?? Swift.Optional<PaymentSourceInput?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "paymentSource")
      }
    }

    public var amount: Int {
      get {
        return graphQLMap["amount"] as! Int
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "amount")
      }
    }

    public var currency: String {
      get {
        return graphQLMap["currency"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "currency")
      }
    }

    public var savePaymentSource: Bool {
      get {
        return graphQLMap["savePaymentSource"] as! Bool
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "savePaymentSource")
      }
    }

    public var livemode: Bool {
      get {
        return graphQLMap["livemode"] as! Bool
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "livemode")
      }
    }

    public var cancellationReason: Swift.Optional<CancellationReason?> {
      get {
        return graphQLMap["cancellationReason"] as? Swift.Optional<CancellationReason?> ?? Swift.Optional<CancellationReason?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "cancellationReason")
      }
    }

    public var receiptEmail: Swift.Optional<String?> {
      get {
        return graphQLMap["receiptEmail"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "receiptEmail")
      }
    }
  }

  public enum OrderType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case foodAndBeverage
    case ticket
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "food_and_beverage": self = .foodAndBeverage
        case "ticket": self = .ticket
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .foodAndBeverage: return "food_and_beverage"
        case .ticket: return "ticket"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: OrderType, rhs: OrderType) -> Bool {
      switch (lhs, rhs) {
        case (.foodAndBeverage, .foodAndBeverage): return true
        case (.ticket, .ticket): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [OrderType] {
      return [
        .foodAndBeverage,
        .ticket,
      ]
    }
  }

  public enum CancellationReason: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case duplicate
    case fraudulent
    case requestedByCustomer
    case abandoned
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "duplicate": self = .duplicate
        case "fraudulent": self = .fraudulent
        case "requested_by_customer": self = .requestedByCustomer
        case "abandoned": self = .abandoned
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .duplicate: return "duplicate"
        case .fraudulent: return "fraudulent"
        case .requestedByCustomer: return "requested_by_customer"
        case .abandoned: return "abandoned"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: CancellationReason, rhs: CancellationReason) -> Bool {
      switch (lhs, rhs) {
        case (.duplicate, .duplicate): return true
        case (.fraudulent, .fraudulent): return true
        case (.requestedByCustomer, .requestedByCustomer): return true
        case (.abandoned, .abandoned): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [CancellationReason] {
      return [
        .duplicate,
        .fraudulent,
        .requestedByCustomer,
        .abandoned,
      ]
    }
  }

  public struct FulfilmentPointFilter: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - categories
    public init(categories: Swift.Optional<GraphQLID?> = nil) {
      graphQLMap = ["categories": categories]
    }

    public var categories: Swift.Optional<GraphQLID?> {
      get {
        return graphQLMap["categories"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "categories")
      }
    }
  }

  public struct ProductFilter: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - fulfilmentPoints
    ///   - categories
    public init(fulfilmentPoints: Swift.Optional<[GraphQLID?]?> = nil, categories: Swift.Optional<[GraphQLID?]?> = nil) {
      graphQLMap = ["fulfilmentPoints": fulfilmentPoints, "categories": categories]
    }

    public var fulfilmentPoints: Swift.Optional<[GraphQLID?]?> {
      get {
        return graphQLMap["fulfilmentPoints"] as? Swift.Optional<[GraphQLID?]?> ?? Swift.Optional<[GraphQLID?]?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "fulfilmentPoints")
      }
    }

    public var categories: Swift.Optional<[GraphQLID?]?> {
      get {
        return graphQLMap["categories"] as? Swift.Optional<[GraphQLID?]?> ?? Swift.Optional<[GraphQLID?]?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "categories")
      }
    }
  }

  public struct OrderUpdateInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - status
    ///   - collectionPreferenceType
    ///   - checkInTime
    public init(status: Swift.Optional<String?> = nil, collectionPreferenceType: Swift.Optional<CollectionPreferenceType?> = nil, checkInTime: Swift.Optional<String?> = nil) {
      graphQLMap = ["status": status, "collectionPreferenceType": collectionPreferenceType, "checkInTime": checkInTime]
    }

    public var status: Swift.Optional<String?> {
      get {
        return graphQLMap["status"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "status")
      }
    }

    public var collectionPreferenceType: Swift.Optional<CollectionPreferenceType?> {
      get {
        return graphQLMap["collectionPreferenceType"] as? Swift.Optional<CollectionPreferenceType?> ?? Swift.Optional<CollectionPreferenceType?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "collectionPreferenceType")
      }
    }

    public var checkInTime: Swift.Optional<String?> {
      get {
        return graphQLMap["checkInTime"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "checkInTime")
      }
    }
  }

  public struct PaymentIntentUpdateInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - status
    ///   - paymentSource
    ///   - savePaymentSource
    public init(status: Swift.Optional<UpdatePaymentStatus?> = nil, paymentSource: Swift.Optional<PaymentSourceInput?> = nil, savePaymentSource: Swift.Optional<Bool?> = nil) {
      graphQLMap = ["status": status, "paymentSource": paymentSource, "savePaymentSource": savePaymentSource]
    }

    public var status: Swift.Optional<UpdatePaymentStatus?> {
      get {
        return graphQLMap["status"] as? Swift.Optional<UpdatePaymentStatus?> ?? Swift.Optional<UpdatePaymentStatus?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "status")
      }
    }

    public var paymentSource: Swift.Optional<PaymentSourceInput?> {
      get {
        return graphQLMap["paymentSource"] as? Swift.Optional<PaymentSourceInput?> ?? Swift.Optional<PaymentSourceInput?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "paymentSource")
      }
    }

    public var savePaymentSource: Swift.Optional<Bool?> {
      get {
        return graphQLMap["savePaymentSource"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "savePaymentSource")
      }
    }
  }

  public enum UpdatePaymentStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case canceled
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "canceled": self = .canceled
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .canceled: return "canceled"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: UpdatePaymentStatus, rhs: UpdatePaymentStatus) -> Bool {
      switch (lhs, rhs) {
        case (.canceled, .canceled): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [UpdatePaymentStatus] {
      return [
        .canceled,
      ]
    }
  }

  public enum StyleType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case pager
    case carousel
    case list
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "PAGER": self = .pager
        case "CAROUSEL": self = .carousel
        case "LIST": self = .list
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .pager: return "PAGER"
        case .carousel: return "CAROUSEL"
        case .list: return "LIST"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: StyleType, rhs: StyleType) -> Bool {
      switch (lhs, rhs) {
        case (.pager, .pager): return true
        case (.carousel, .carousel): return true
        case (.list, .list): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [StyleType] {
      return [
        .pager,
        .carousel,
        .list,
      ]
    }
  }

  public enum StyleSize: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case small
    case medium
    case large
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "SMALL": self = .small
        case "MEDIUM": self = .medium
        case "LARGE": self = .large
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .small: return "SMALL"
        case .medium: return "MEDIUM"
        case .large: return "LARGE"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: StyleSize, rhs: StyleSize) -> Bool {
      switch (lhs, rhs) {
        case (.small, .small): return true
        case (.medium, .medium): return true
        case (.large, .large): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [StyleSize] {
      return [
        .small,
        .medium,
        .large,
      ]
    }
  }

  public enum WidgetType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case product
    case button
    case banner
    case event
    case fixture
    case countdownClock
    case galleryCoverImage
    case news
    case ticket
    case ticketProduct
    case fulfilmentPoint
    case socialPost
    case fulfilmentPointCategorySelector
    case selectedEvent
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "Product": self = .product
        case "Button": self = .button
        case "Banner": self = .banner
        case "Event": self = .event
        case "Fixture": self = .fixture
        case "CountdownClock": self = .countdownClock
        case "GalleryCoverImage": self = .galleryCoverImage
        case "News": self = .news
        case "Ticket": self = .ticket
        case "TicketProduct": self = .ticketProduct
        case "FulfilmentPoint": self = .fulfilmentPoint
        case "SocialPost": self = .socialPost
        case "FulfilmentPointCategorySelector": self = .fulfilmentPointCategorySelector
        case "SelectedEvent": self = .selectedEvent
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .product: return "Product"
        case .button: return "Button"
        case .banner: return "Banner"
        case .event: return "Event"
        case .fixture: return "Fixture"
        case .countdownClock: return "CountdownClock"
        case .galleryCoverImage: return "GalleryCoverImage"
        case .news: return "News"
        case .ticket: return "Ticket"
        case .ticketProduct: return "TicketProduct"
        case .fulfilmentPoint: return "FulfilmentPoint"
        case .socialPost: return "SocialPost"
        case .fulfilmentPointCategorySelector: return "FulfilmentPointCategorySelector"
        case .selectedEvent: return "SelectedEvent"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: WidgetType, rhs: WidgetType) -> Bool {
      switch (lhs, rhs) {
        case (.product, .product): return true
        case (.button, .button): return true
        case (.banner, .banner): return true
        case (.event, .event): return true
        case (.fixture, .fixture): return true
        case (.countdownClock, .countdownClock): return true
        case (.galleryCoverImage, .galleryCoverImage): return true
        case (.news, .news): return true
        case (.ticket, .ticket): return true
        case (.ticketProduct, .ticketProduct): return true
        case (.fulfilmentPoint, .fulfilmentPoint): return true
        case (.socialPost, .socialPost): return true
        case (.fulfilmentPointCategorySelector, .fulfilmentPointCategorySelector): return true
        case (.selectedEvent, .selectedEvent): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [WidgetType] {
      return [
        .product,
        .button,
        .banner,
        .event,
        .fixture,
        .countdownClock,
        .galleryCoverImage,
        .news,
        .ticket,
        .ticketProduct,
        .fulfilmentPoint,
        .socialPost,
        .fulfilmentPointCategorySelector,
        .selectedEvent,
      ]
    }
  }

  public enum WidgetFetchType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case featured
    case feed
    case `static`
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "featured": self = .featured
        case "feed": self = .feed
        case "static": self = .static
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .featured: return "featured"
        case .feed: return "feed"
        case .static: return "static"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: WidgetFetchType, rhs: WidgetFetchType) -> Bool {
      switch (lhs, rhs) {
        case (.featured, .featured): return true
        case (.feed, .feed): return true
        case (.static, .static): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [WidgetFetchType] {
      return [
        .featured,
        .feed,
        .static,
      ]
    }
  }

  public enum FulfilmentPointType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case homeDelivery
    case collection
    case seatDelivery
    case digitalRedemption
    case virtualQueue
    case collectWhenReady
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "HOME_DELIVERY": self = .homeDelivery
        case "COLLECTION": self = .collection
        case "SEAT_DELIVERY": self = .seatDelivery
        case "DIGITAL_REDEMPTION": self = .digitalRedemption
        case "VIRTUAL_QUEUE": self = .virtualQueue
        case "COLLECT_WHEN_READY": self = .collectWhenReady
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .homeDelivery: return "HOME_DELIVERY"
        case .collection: return "COLLECTION"
        case .seatDelivery: return "SEAT_DELIVERY"
        case .digitalRedemption: return "DIGITAL_REDEMPTION"
        case .virtualQueue: return "VIRTUAL_QUEUE"
        case .collectWhenReady: return "COLLECT_WHEN_READY"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: FulfilmentPointType, rhs: FulfilmentPointType) -> Bool {
      switch (lhs, rhs) {
        case (.homeDelivery, .homeDelivery): return true
        case (.collection, .collection): return true
        case (.seatDelivery, .seatDelivery): return true
        case (.digitalRedemption, .digitalRedemption): return true
        case (.virtualQueue, .virtualQueue): return true
        case (.collectWhenReady, .collectWhenReady): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [FulfilmentPointType] {
      return [
        .homeDelivery,
        .collection,
        .seatDelivery,
        .digitalRedemption,
        .virtualQueue,
        .collectWhenReady,
      ]
    }
  }

  public enum OrderStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case confirmed
    case onHold
    case inProgress
    case prepComplete
    case readyToCollect
    case cancelled
    case complete
    case onTheWay
    case paymentPending
    case payInProgress
    case refunded
    case refundRequested
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "CONFIRMED": self = .confirmed
        case "ON_HOLD": self = .onHold
        case "IN_PROGRESS": self = .inProgress
        case "PREP_COMPLETE": self = .prepComplete
        case "READY_TO_COLLECT": self = .readyToCollect
        case "CANCELLED": self = .cancelled
        case "COMPLETE": self = .complete
        case "ON_THE_WAY": self = .onTheWay
        case "PAYMENT_PENDING": self = .paymentPending
        case "PAY_IN_PROGRESS": self = .payInProgress
        case "REFUNDED": self = .refunded
        case "REFUND_REQUESTED": self = .refundRequested
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .confirmed: return "CONFIRMED"
        case .onHold: return "ON_HOLD"
        case .inProgress: return "IN_PROGRESS"
        case .prepComplete: return "PREP_COMPLETE"
        case .readyToCollect: return "READY_TO_COLLECT"
        case .cancelled: return "CANCELLED"
        case .complete: return "COMPLETE"
        case .onTheWay: return "ON_THE_WAY"
        case .paymentPending: return "PAYMENT_PENDING"
        case .payInProgress: return "PAY_IN_PROGRESS"
        case .refunded: return "REFUNDED"
        case .refundRequested: return "REFUND_REQUESTED"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: OrderStatus, rhs: OrderStatus) -> Bool {
      switch (lhs, rhs) {
        case (.confirmed, .confirmed): return true
        case (.onHold, .onHold): return true
        case (.inProgress, .inProgress): return true
        case (.prepComplete, .prepComplete): return true
        case (.readyToCollect, .readyToCollect): return true
        case (.cancelled, .cancelled): return true
        case (.complete, .complete): return true
        case (.onTheWay, .onTheWay): return true
        case (.paymentPending, .paymentPending): return true
        case (.payInProgress, .payInProgress): return true
        case (.refunded, .refunded): return true
        case (.refundRequested, .refundRequested): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [OrderStatus] {
      return [
        .confirmed,
        .onHold,
        .inProgress,
        .prepComplete,
        .readyToCollect,
        .cancelled,
        .complete,
        .onTheWay,
        .paymentPending,
        .payInProgress,
        .refunded,
        .refundRequested,
      ]
    }
  }

  public enum PaymentStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case requiresPaymentMethod
    case requiresAction
    case processing
    case succeeded
    case canceled
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "requires_payment_method": self = .requiresPaymentMethod
        case "requires_action": self = .requiresAction
        case "processing": self = .processing
        case "succeeded": self = .succeeded
        case "canceled": self = .canceled
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .requiresPaymentMethod: return "requires_payment_method"
        case .requiresAction: return "requires_action"
        case .processing: return "processing"
        case .succeeded: return "succeeded"
        case .canceled: return "canceled"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: PaymentStatus, rhs: PaymentStatus) -> Bool {
      switch (lhs, rhs) {
        case (.requiresPaymentMethod, .requiresPaymentMethod): return true
        case (.requiresAction, .requiresAction): return true
        case (.processing, .processing): return true
        case (.succeeded, .succeeded): return true
        case (.canceled, .canceled): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [PaymentStatus] {
      return [
        .requiresPaymentMethod,
        .requiresAction,
        .processing,
        .succeeded,
        .canceled,
      ]
    }
  }

  public enum PaymentActionType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case redirectToUrl
    case collectCvc
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "redirect_to_url": self = .redirectToUrl
        case "collect_cvc": self = .collectCvc
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .redirectToUrl: return "redirect_to_url"
        case .collectCvc: return "collect_cvc"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: PaymentActionType, rhs: PaymentActionType) -> Bool {
      switch (lhs, rhs) {
        case (.redirectToUrl, .redirectToUrl): return true
        case (.collectCvc, .collectCvc): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [PaymentActionType] {
      return [
        .redirectToUrl,
        .collectCvc,
      ]
    }
  }

  public enum PaymentSourceType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case card
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "card": self = .card
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .card: return "card"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: PaymentSourceType, rhs: PaymentSourceType) -> Bool {
      switch (lhs, rhs) {
        case (.card, .card): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [PaymentSourceType] {
      return [
        .card,
      ]
    }
  }

  public enum ProductModifierItemStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case active
    case disabled
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "ACTIVE": self = .active
        case "DISABLED": self = .disabled
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .active: return "ACTIVE"
        case .disabled: return "DISABLED"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: ProductModifierItemStatus, rhs: ProductModifierItemStatus) -> Bool {
      switch (lhs, rhs) {
        case (.active, .active): return true
        case (.disabled, .disabled): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [ProductModifierItemStatus] {
      return [
        .active,
        .disabled,
      ]
    }
  }
}
