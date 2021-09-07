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
        seatInfo
        timeslot {
          __typename
          ...FragmentTimeslot
        }
        collectionDate
        collectionPreferenceType
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
            ...FragmentProductVariant
          }
          product {
            __typename
            ...FragmentProduct
          }
          productModifierItems {
            __typename
            ...FragmentProductModifierItemSelection
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
        GraphQLField("seatInfo", type: .scalar(JSON.self)),
        GraphQLField("timeslot", type: .object(Timeslot.selections)),
        GraphQLField("collectionDate", type: .scalar(String.self)),
        GraphQLField("collectionPreferenceType", type: .scalar(CollectionPreferenceType.self)),
        GraphQLField("items", type: .list(.object(Item.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(grossAmount: Int? = nil, discountAmount: Int? = nil, netAmount: Int? = nil, seatInfo: JSON? = nil, timeslot: Timeslot? = nil, collectionDate: String? = nil, collectionPreferenceType: CollectionPreferenceType? = nil, items: [Item?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Basket", "grossAmount": grossAmount, "discountAmount": discountAmount, "netAmount": netAmount, "seatInfo": seatInfo, "timeslot": timeslot.flatMap { (value: Timeslot) -> ResultMap in value.resultMap }, "collectionDate": collectionDate, "collectionPreferenceType": collectionPreferenceType, "items": items.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }])
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

    public var seatInfo: JSON? {
      get {
        return resultMap["seatInfo"] as? JSON
      }
      set {
        resultMap.updateValue(newValue, forKey: "seatInfo")
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

    public var collectionPreferenceType: CollectionPreferenceType? {
      get {
        return resultMap["collectionPreferenceType"] as? CollectionPreferenceType
      }
      set {
        resultMap.updateValue(newValue, forKey: "collectionPreferenceType")
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

    public struct Timeslot: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Timeslot"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragmentTimeslot.self),
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

        public var fragmentTimeslot: FragmentTimeslot {
          get {
            return FragmentTimeslot(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
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
            GraphQLFragmentSpread(FragmentProductVariant.self),
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

          public var fragmentProductVariant: FragmentProductVariant {
            get {
              return FragmentProductVariant(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
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
            GraphQLFragmentSpread(FragmentProductModifierItemSelection.self),
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

          public var fragmentProductModifierItemSelection: FragmentProductModifierItemSelection {
            get {
              return FragmentProductModifierItemSelection(unsafeResultMap: resultMap)
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
