// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  struct FragmentProductModifierItemSelection: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentProductModifierItemSelection on ProductModifierItemSelection {
        __typename
        productModifierItem {
          __typename
          ...FragmentProductModifierItem
        }
        quantity
        totalPrice
      }
      """

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
          GraphQLFragmentSpread(FragmentProductModifierItem.self),
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

        public var fragmentProductModifierItem: FragmentProductModifierItem {
          get {
            return FragmentProductModifierItem(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}
