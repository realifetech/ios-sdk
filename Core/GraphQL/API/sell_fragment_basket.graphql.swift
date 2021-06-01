// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  struct FragmentBasket: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentBasket on Basket {
        __typename
        grossAmount
        discountAmount
        netAmount
        seatInfo {
          __typename
          key
          value
        }
        timeslot {
          __typename
          id
          externalId
          reference
          startTime
          endTime
          createdAt
          updatedAt
          translations {
            __typename
            language
            title
            description
            collectionNote
          }
        }
        collectionDate
        items {
          __typename
          id
          price
          modifierItemsPrice
          quantity
          totalPrice
          fulfilmentPoint {
            __typename
            ...FragmentFulfilmentPoint
          }
          productVariant {
            __typename
            id
            externalId
            price
            createdAt
            updatedAt
            translations {
              __typename
              language
              title
            }
          }
          product {
            __typename
            ...FragmentProduct
          }
          productModifierItems {
            __typename
            productModifierItem {
              __typename
              id
              status
              externalId
              additionalPrice
              position
              translations {
                __typename
                language
                title
              }
            }
            quantity
            totalPrice
          }
        }
      }
      """

    public static let possibleTypes: [String] = ["Basket"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("grossAmount", type: .scalar(Int.self)),
        GraphQLField("discountAmount", type: .scalar(Int.self)),
        GraphQLField("netAmount", type: .scalar(Int.self)),
        GraphQLField("seatInfo", type: .list(.object(SeatInfo.selections))),
        GraphQLField("timeslot", type: .object(Timeslot.selections)),
        GraphQLField("collectionDate", type: .scalar(String.self)),
        GraphQLField("items", type: .list(.object(Item.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(grossAmount: Int? = nil, discountAmount: Int? = nil, netAmount: Int? = nil, seatInfo: [SeatInfo?]? = nil, timeslot: Timeslot? = nil, collectionDate: String? = nil, items: [Item?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Basket", "grossAmount": grossAmount, "discountAmount": discountAmount, "netAmount": netAmount, "seatInfo": seatInfo.flatMap { (value: [SeatInfo?]) -> [ResultMap?] in value.map { (value: SeatInfo?) -> ResultMap? in value.flatMap { (value: SeatInfo) -> ResultMap in value.resultMap } } }, "timeslot": timeslot.flatMap { (value: Timeslot) -> ResultMap in value.resultMap }, "collectionDate": collectionDate, "items": items.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
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

    public var seatInfo: [SeatInfo?]? {
      get {
        return (resultMap["seatInfo"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SeatInfo?] in value.map { (value: ResultMap?) -> SeatInfo? in value.flatMap { (value: ResultMap) -> SeatInfo in SeatInfo(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SeatInfo?]) -> [ResultMap?] in value.map { (value: SeatInfo?) -> ResultMap? in value.flatMap { (value: SeatInfo) -> ResultMap in value.resultMap } } }, forKey: "seatInfo")
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

    public var collectionDate: String? {
      get {
        return resultMap["collectionDate"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "collectionDate")
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

    public struct SeatInfo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SeatInfo"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("key", type: .scalar(String.self)),
          GraphQLField("value", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(key: String? = nil, value: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "SeatInfo", "key": key, "value": value])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var key: String? {
        get {
          return resultMap["key"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "key")
        }
      }

      public var value: String? {
        get {
          return resultMap["value"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "value")
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
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("translations", type: .list(.object(Translation.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, externalId: String? = nil, reference: String? = nil, startTime: String? = nil, endTime: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, translations: [Translation?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Timeslot", "id": id, "externalId": externalId, "reference": reference, "startTime": startTime, "endTime": endTime, "createdAt": createdAt, "updatedAt": updatedAt, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
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

    public struct Item: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["BasketItem"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("price", type: .scalar(Int.self)),
          GraphQLField("modifierItemsPrice", type: .scalar(Int.self)),
          GraphQLField("quantity", type: .scalar(Int.self)),
          GraphQLField("totalPrice", type: .scalar(Int.self)),
          GraphQLField("fulfilmentPoint", type: .object(FulfilmentPoint.selections)),
          GraphQLField("productVariant", type: .object(ProductVariant.selections)),
          GraphQLField("product", type: .object(Product.selections)),
          GraphQLField("productModifierItems", type: .list(.object(ProductModifierItem.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, price: Int? = nil, modifierItemsPrice: Int? = nil, quantity: Int? = nil, totalPrice: Int? = nil, fulfilmentPoint: FulfilmentPoint? = nil, productVariant: ProductVariant? = nil, product: Product? = nil, productModifierItems: [ProductModifierItem?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "BasketItem", "id": id, "price": price, "modifierItemsPrice": modifierItemsPrice, "quantity": quantity, "totalPrice": totalPrice, "fulfilmentPoint": fulfilmentPoint.flatMap { (value: FulfilmentPoint) -> ResultMap in value.resultMap }, "productVariant": productVariant.flatMap { (value: ProductVariant) -> ResultMap in value.resultMap }, "product": product.flatMap { (value: Product) -> ResultMap in value.resultMap }, "productModifierItems": productModifierItems.flatMap { (value: [ProductModifierItem?]) -> [ResultMap?] in value.map { (value: ProductModifierItem?) -> ResultMap? in value.flatMap { (value: ProductModifierItem) -> ResultMap in value.resultMap } } }])
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

      public var fulfilmentPoint: FulfilmentPoint? {
        get {
          return (resultMap["fulfilmentPoint"] as? ResultMap).flatMap { FulfilmentPoint(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "fulfilmentPoint")
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

      public var product: Product? {
        get {
          return (resultMap["product"] as? ResultMap).flatMap { Product(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "product")
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

      public struct ProductVariant: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductVariant"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("externalId", type: .scalar(String.self)),
            GraphQLField("price", type: .scalar(Int.self)),
            GraphQLField("createdAt", type: .scalar(String.self)),
            GraphQLField("updatedAt", type: .scalar(String.self)),
            GraphQLField("translations", type: .list(.object(Translation.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, externalId: String? = nil, price: Int? = nil, createdAt: String? = nil, updatedAt: String? = nil, translations: [Translation?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "ProductVariant", "id": id, "externalId": externalId, "price": price, "createdAt": createdAt, "updatedAt": updatedAt, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
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
              GraphQLField("language", type: .scalar(Language.self)),
              GraphQLField("title", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(language: Language? = nil, title: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "ProductVariantTranslation", "language": language, "title": title])
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

      public struct ProductModifierItem: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductModifierItemSelection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("productModifierItem", type: .object(ProductModifierItem.selections)),
            GraphQLField("quantity", type: .scalar(Int.self)),
            GraphQLField("totalPrice", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(productModifierItem: ProductModifierItem? = nil, quantity: Int? = nil, totalPrice: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "ProductModifierItemSelection", "productModifierItem": productModifierItem.flatMap { (value: ProductModifierItem) -> ResultMap in value.resultMap }, "quantity": quantity, "totalPrice": totalPrice])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        public struct ProductModifierItem: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ProductModifierItem"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("status", type: .scalar(ProductModifierItemStatus.self)),
              GraphQLField("externalId", type: .scalar(String.self)),
              GraphQLField("additionalPrice", type: .scalar(Int.self)),
              GraphQLField("position", type: .scalar(Int.self)),
              GraphQLField("translations", type: .list(.object(Translation.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, status: ProductModifierItemStatus? = nil, externalId: String? = nil, additionalPrice: Int? = nil, position: Int? = nil, translations: [Translation?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "ProductModifierItem", "id": id, "status": status, "externalId": externalId, "additionalPrice": additionalPrice, "position": position, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
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

          public var status: ProductModifierItemStatus? {
            get {
              return resultMap["status"] as? ProductModifierItemStatus
            }
            set {
              resultMap.updateValue(newValue, forKey: "status")
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

          public var position: Int? {
            get {
              return resultMap["position"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "position")
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
                GraphQLField("language", type: .scalar(Language.self)),
                GraphQLField("title", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(language: Language? = nil, title: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "ProductModifierItemTranslation", "language": language, "title": title])
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
          }
        }
      }
    }
  }
}
