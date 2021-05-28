// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  struct FragmentOrder: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentOrder on Order {
        __typename
        id
        orderNumber
        qrCodeUrl
        collectionDate
        status
        state {
          __typename
          workingState
          status
          translations {
            __typename
            language
            title
            desciption
          }
        }
        paymentStatus
        grossAmount
        discountAmount
        netAmount
        estimatedAt
        createdAt
        updatedAt
        items {
          __typename
          id
          product {
            __typename
            ...FragmentProduct
          }
          productVariant {
            __typename
            id
            externalId
            price
            externalId
            translations {
              __typename
              title
              language
            }
          }
          fulfilmentPoint {
            __typename
            ...FragmentFulfilmentPoint
          }
          productModifierItems {
            __typename
            quantity
            productModifierItem {
              __typename
              id
              externalId
              additionalPrice
              status
              additionalPrice
              translations {
                __typename
                title
                language
              }
            }
            totalPrice
          }
          price
          modifierItemsPrice
          quantity
          totalPrice
          title
          subtitle
          imageUrl
        }
        orderNotes {
          __typename
          id
          note
          author
        }
        timeslot {
          __typename
          id
          externalId
          reference
          startTime
          endTime
          translations {
            __typename
            language
            title
            description
            collectionNote
          }
        }
        fulfilmentPoint {
          __typename
          ...FragmentFulfilmentPoint
        }
        user {
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
      }
      """

    public static let possibleTypes: [String] = ["Order"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("orderNumber", type: .nonNull(.scalar(String.self))),
        GraphQLField("qrCodeUrl", type: .scalar(String.self)),
        GraphQLField("collectionDate", type: .scalar(String.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("state", type: .object(State.selections)),
        GraphQLField("paymentStatus", type: .scalar(String.self)),
        GraphQLField("grossAmount", type: .scalar(Int.self)),
        GraphQLField("discountAmount", type: .scalar(Int.self)),
        GraphQLField("netAmount", type: .scalar(Int.self)),
        GraphQLField("estimatedAt", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .scalar(String.self)),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("orderNotes", type: .list(.object(OrderNote.selections))),
        GraphQLField("timeslot", type: .object(Timeslot.selections)),
        GraphQLField("fulfilmentPoint", type: .object(FulfilmentPoint.selections)),
        GraphQLField("user", type: .object(User.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, orderNumber: String, qrCodeUrl: String? = nil, collectionDate: String? = nil, status: String? = nil, state: State? = nil, paymentStatus: String? = nil, grossAmount: Int? = nil, discountAmount: Int? = nil, netAmount: Int? = nil, estimatedAt: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, items: [Item?]? = nil, orderNotes: [OrderNote?]? = nil, timeslot: Timeslot? = nil, fulfilmentPoint: FulfilmentPoint? = nil, user: User? = nil) {
      self.init(unsafeResultMap: ["__typename": "Order", "id": id, "orderNumber": orderNumber, "qrCodeUrl": qrCodeUrl, "collectionDate": collectionDate, "status": status, "state": state.flatMap { (value: State) -> ResultMap in value.resultMap }, "paymentStatus": paymentStatus, "grossAmount": grossAmount, "discountAmount": discountAmount, "netAmount": netAmount, "estimatedAt": estimatedAt, "createdAt": createdAt, "updatedAt": updatedAt, "items": items.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }, "orderNotes": orderNotes.flatMap { (value: [OrderNote?]) -> [ResultMap?] in value.map { (value: OrderNote?) -> ResultMap? in value.flatMap { (value: OrderNote) -> ResultMap in value.resultMap } } }, "timeslot": timeslot.flatMap { (value: Timeslot) -> ResultMap in value.resultMap }, "fulfilmentPoint": fulfilmentPoint.flatMap { (value: FulfilmentPoint) -> ResultMap in value.resultMap }, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
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

    public var orderNumber: String {
      get {
        return resultMap["orderNumber"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "orderNumber")
      }
    }

    public var qrCodeUrl: String? {
      get {
        return resultMap["qrCodeUrl"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "qrCodeUrl")
      }
    }

    public var collectionDate: String? {
      get {
        return resultMap["collectionDate"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "collectionDate")
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

    public var state: State? {
      get {
        return (resultMap["state"] as? ResultMap).flatMap { State(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "state")
      }
    }

    public var paymentStatus: String? {
      get {
        return resultMap["paymentStatus"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "paymentStatus")
      }
    }

    public var grossAmount: Int? {
      get {
        return resultMap["grossAmount"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "grossAmount")
      }
    }

    public var discountAmount: Int? {
      get {
        return resultMap["discountAmount"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "discountAmount")
      }
    }

    public var netAmount: Int? {
      get {
        return resultMap["netAmount"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "netAmount")
      }
    }

    public var estimatedAt: String? {
      get {
        return resultMap["estimatedAt"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "estimatedAt")
      }
    }

    public var createdAt: String? {
      get {
        return resultMap["createdAt"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "createdAt")
      }
    }

    public var updatedAt: String? {
      get {
        return resultMap["updatedAt"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "updatedAt")
      }
    }

    public var items: [Item?]? {
      get {
        return (resultMap["items"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Item?] in value.map { (value: ResultMap?) -> Item? in value.flatMap { (value: ResultMap) -> Item in Item(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }, forKey: "items")
      }
    }

    public var orderNotes: [OrderNote?]? {
      get {
        return (resultMap["orderNotes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [OrderNote?] in value.map { (value: ResultMap?) -> OrderNote? in value.flatMap { (value: ResultMap) -> OrderNote in OrderNote(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [OrderNote?]) -> [ResultMap?] in value.map { (value: OrderNote?) -> ResultMap? in value.flatMap { (value: OrderNote) -> ResultMap in value.resultMap } } }, forKey: "orderNotes")
      }
    }

    public var timeslot: Timeslot? {
      get {
        return (resultMap["timeslot"] as? ResultMap).flatMap { Timeslot(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "timeslot")
      }
    }

    public var fulfilmentPoint: FulfilmentPoint? {
      get {
        return (resultMap["fulfilmentPoint"] as? ResultMap).flatMap { FulfilmentPoint(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "fulfilmentPoint")
      }
    }

    public var user: User? {
      get {
        return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "user")
      }
    }

    public struct State: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["OrderState"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("workingState", type: .scalar(String.self)),
          GraphQLField("status", type: .scalar(String.self)),
          GraphQLField("translations", type: .list(.object(Translation.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(workingState: String? = nil, status: String? = nil, translations: [Translation?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "OrderState", "workingState": workingState, "status": status, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var workingState: String? {
        get {
          return resultMap["workingState"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "workingState")
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

      public var translations: [Translation?]? {
        get {
          return (resultMap["translations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Translation?] in value.map { (value: ResultMap?) -> Translation? in value.flatMap { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, forKey: "translations")
        }
      }

      public struct Translation: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["OrderStateTranslation"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("language", type: .scalar(String.self)),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("desciption", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(language: String? = nil, title: String? = nil, desciption: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "OrderStateTranslation", "language": language, "title": title, "desciption": desciption])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var language: String? {
          get {
            return resultMap["language"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "language")
          }
        }

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var desciption: String? {
          get {
            return resultMap["desciption"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "desciption")
          }
        }
      }
    }

    public struct Item: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["OrderItem"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("product", type: .object(Product.selections)),
          GraphQLField("productVariant", type: .object(ProductVariant.selections)),
          GraphQLField("fulfilmentPoint", type: .object(FulfilmentPoint.selections)),
          GraphQLField("productModifierItems", type: .list(.object(ProductModifierItem.selections))),
          GraphQLField("price", type: .scalar(Int.self)),
          GraphQLField("modifierItemsPrice", type: .scalar(Int.self)),
          GraphQLField("quantity", type: .scalar(Int.self)),
          GraphQLField("totalPrice", type: .scalar(Int.self)),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("subtitle", type: .scalar(String.self)),
          GraphQLField("imageUrl", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, product: Product? = nil, productVariant: ProductVariant? = nil, fulfilmentPoint: FulfilmentPoint? = nil, productModifierItems: [ProductModifierItem?]? = nil, price: Int? = nil, modifierItemsPrice: Int? = nil, quantity: Int? = nil, totalPrice: Int? = nil, title: String? = nil, subtitle: String? = nil, imageUrl: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "OrderItem", "id": id, "product": product.flatMap { (value: Product) -> ResultMap in value.resultMap }, "productVariant": productVariant.flatMap { (value: ProductVariant) -> ResultMap in value.resultMap }, "fulfilmentPoint": fulfilmentPoint.flatMap { (value: FulfilmentPoint) -> ResultMap in value.resultMap }, "productModifierItems": productModifierItems.flatMap { (value: [ProductModifierItem?]) -> [ResultMap?] in value.map { (value: ProductModifierItem?) -> ResultMap? in value.flatMap { (value: ProductModifierItem) -> ResultMap in value.resultMap } } }, "price": price, "modifierItemsPrice": modifierItemsPrice, "quantity": quantity, "totalPrice": totalPrice, "title": title, "subtitle": subtitle, "imageUrl": imageUrl])
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

      public var product: Product? {
        get {
          return (resultMap["product"] as? ResultMap).flatMap { Product(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "product")
        }
      }

      public var productVariant: ProductVariant? {
        get {
          return (resultMap["productVariant"] as? ResultMap).flatMap { ProductVariant(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "productVariant")
        }
      }

      public var fulfilmentPoint: FulfilmentPoint? {
        get {
          return (resultMap["fulfilmentPoint"] as? ResultMap).flatMap { FulfilmentPoint(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "fulfilmentPoint")
        }
      }

      public var productModifierItems: [ProductModifierItem?]? {
        get {
          return (resultMap["productModifierItems"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ProductModifierItem?] in value.map { (value: ResultMap?) -> ProductModifierItem? in value.flatMap { (value: ResultMap) -> ProductModifierItem in ProductModifierItem(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ProductModifierItem?]) -> [ResultMap?] in value.map { (value: ProductModifierItem?) -> ResultMap? in value.flatMap { (value: ProductModifierItem) -> ResultMap in value.resultMap } } }, forKey: "productModifierItems")
        }
      }

      public var price: Int? {
        get {
          return resultMap["price"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "price")
        }
      }

      public var modifierItemsPrice: Int? {
        get {
          return resultMap["modifierItemsPrice"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "modifierItemsPrice")
        }
      }

      public var quantity: Int? {
        get {
          return resultMap["quantity"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "quantity")
        }
      }

      public var totalPrice: Int? {
        get {
          return resultMap["totalPrice"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalPrice")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var subtitle: String? {
        get {
          return resultMap["subtitle"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "subtitle")
        }
      }

      public var imageUrl: String? {
        get {
          return resultMap["imageUrl"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "imageUrl")
        }
      }

      public struct Product: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Product"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentProduct.self),
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

          public var fragmentProduct: FragmentProduct {
            get {
              return FragmentProduct(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct ProductVariant: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductVariant"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("externalId", type: .scalar(String.self)),
            GraphQLField("price", type: .scalar(Int.self)),
            GraphQLField("externalId", type: .scalar(String.self)),
            GraphQLField("translations", type: .list(.object(Translation.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, externalId: String? = nil, price: Int? = nil, translations: [Translation?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "ProductVariant", "id": id, "externalId": externalId, "price": price, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
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

        public var externalId: String? {
          get {
            return resultMap["externalId"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "externalId")
          }
        }

        public var price: Int? {
          get {
            return resultMap["price"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "price")
          }
        }

        public var translations: [Translation?]? {
          get {
            return (resultMap["translations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Translation?] in value.map { (value: ResultMap?) -> Translation? in value.flatMap { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, forKey: "translations")
          }
        }

        public struct Translation: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ProductVariantTranslation"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("title", type: .scalar(String.self)),
              GraphQLField("language", type: .scalar(Language.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(title: String? = nil, language: Language? = nil) {
            self.init(unsafeResultMap: ["__typename": "ProductVariantTranslation", "title": title, "language": language])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var title: String? {
            get {
              return resultMap["title"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "title")
            }
          }

          public var language: Language? {
            get {
              return resultMap["language"] as? Language
            }
            set {
              resultMap.updateValue(newValue, forKey: "language")
            }
          }
        }
      }

      public struct FulfilmentPoint: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FulfilmentPoint"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentFulfilmentPoint.self),
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

          public var fragmentFulfilmentPoint: FragmentFulfilmentPoint {
            get {
              return FragmentFulfilmentPoint(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct ProductModifierItem: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductModifierItemSelection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("quantity", type: .scalar(Int.self)),
            GraphQLField("productModifierItem", type: .object(ProductModifierItem.selections)),
            GraphQLField("totalPrice", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(quantity: Int? = nil, productModifierItem: ProductModifierItem? = nil, totalPrice: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "ProductModifierItemSelection", "quantity": quantity, "productModifierItem": productModifierItem.flatMap { (value: ProductModifierItem) -> ResultMap in value.resultMap }, "totalPrice": totalPrice])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var quantity: Int? {
          get {
            return resultMap["quantity"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "quantity")
          }
        }

        public var productModifierItem: ProductModifierItem? {
          get {
            return (resultMap["productModifierItem"] as? ResultMap).flatMap { ProductModifierItem(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "productModifierItem")
          }
        }

        public var totalPrice: Int? {
          get {
            return resultMap["totalPrice"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalPrice")
          }
        }

        public struct ProductModifierItem: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ProductModifierItem"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("externalId", type: .scalar(String.self)),
              GraphQLField("additionalPrice", type: .scalar(Int.self)),
              GraphQLField("status", type: .scalar(ProductModifierItemStatus.self)),
              GraphQLField("additionalPrice", type: .scalar(Int.self)),
              GraphQLField("translations", type: .list(.object(Translation.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, externalId: String? = nil, additionalPrice: Int? = nil, status: ProductModifierItemStatus? = nil, translations: [Translation?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "ProductModifierItem", "id": id, "externalId": externalId, "additionalPrice": additionalPrice, "status": status, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
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

          public var externalId: String? {
            get {
              return resultMap["externalId"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "externalId")
            }
          }

          public var additionalPrice: Int? {
            get {
              return resultMap["additionalPrice"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "additionalPrice")
            }
          }

          public var status: ProductModifierItemStatus? {
            get {
              return resultMap["status"] as? ProductModifierItemStatus
            }
            set {
              resultMap.updateValue(newValue, forKey: "status")
            }
          }

          public var translations: [Translation?]? {
            get {
              return (resultMap["translations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Translation?] in value.map { (value: ResultMap?) -> Translation? in value.flatMap { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, forKey: "translations")
            }
          }

          public struct Translation: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["ProductModifierItemTranslation"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("title", type: .scalar(String.self)),
                GraphQLField("language", type: .scalar(Language.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(title: String? = nil, language: Language? = nil) {
              self.init(unsafeResultMap: ["__typename": "ProductModifierItemTranslation", "title": title, "language": language])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var title: String? {
              get {
                return resultMap["title"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "title")
              }
            }

            public var language: Language? {
              get {
                return resultMap["language"] as? Language
              }
              set {
                resultMap.updateValue(newValue, forKey: "language")
              }
            }
          }
        }
      }
    }

    public struct OrderNote: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["OrderNote"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(Int.self)),
          GraphQLField("note", type: .scalar(String.self)),
          GraphQLField("author", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int? = nil, note: String? = nil, author: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "OrderNote", "id": id, "note": note, "author": author])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int? {
        get {
          return resultMap["id"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var note: String? {
        get {
          return resultMap["note"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "note")
        }
      }

      public var author: String? {
        get {
          return resultMap["author"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "author")
        }
      }
    }

    public struct Timeslot: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Timeslot"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("externalId", type: .scalar(String.self)),
          GraphQLField("reference", type: .scalar(String.self)),
          GraphQLField("startTime", type: .scalar(String.self)),
          GraphQLField("endTime", type: .scalar(String.self)),
          GraphQLField("translations", type: .list(.object(Translation.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, externalId: String? = nil, reference: String? = nil, startTime: String? = nil, endTime: String? = nil, translations: [Translation?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Timeslot", "id": id, "externalId": externalId, "reference": reference, "startTime": startTime, "endTime": endTime, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
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

      public var externalId: String? {
        get {
          return resultMap["externalId"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "externalId")
        }
      }

      public var reference: String? {
        get {
          return resultMap["reference"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reference")
        }
      }

      public var startTime: String? {
        get {
          return resultMap["startTime"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "startTime")
        }
      }

      public var endTime: String? {
        get {
          return resultMap["endTime"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "endTime")
        }
      }

      public var translations: [Translation?]? {
        get {
          return (resultMap["translations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Translation?] in value.map { (value: ResultMap?) -> Translation? in value.flatMap { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, forKey: "translations")
        }
      }

      public struct Translation: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["TimeslotTranslation"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("language", type: .scalar(Language.self)),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("description", type: .scalar(String.self)),
            GraphQLField("collectionNote", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(language: Language? = nil, title: String? = nil, description: String? = nil, collectionNote: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "TimeslotTranslation", "language": language, "title": title, "description": description, "collectionNote": collectionNote])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var language: Language? {
          get {
            return resultMap["language"] as? Language
          }
          set {
            resultMap.updateValue(newValue, forKey: "language")
          }
        }

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        public var collectionNote: String? {
          get {
            return resultMap["collectionNote"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "collectionNote")
          }
        }
      }
    }

    public struct FulfilmentPoint: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FulfilmentPoint"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragmentFulfilmentPoint.self),
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

        public var fragmentFulfilmentPoint: FragmentFulfilmentPoint {
          get {
            return FragmentFulfilmentPoint(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public struct User: GraphQLSelectionSet {
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
}
