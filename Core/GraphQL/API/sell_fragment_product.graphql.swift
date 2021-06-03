// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  struct FragmentProduct: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentProduct on Product {
        __typename
        id
        status
        reference
        externalId
        images {
          __typename
          imageUrl
          position
        }
        modifierLists {
          __typename
          id
          status
          externalId
          reference
          multipleSelect
          mandatorySelect
          maxAllowed
          items {
            __typename
            ...FragmentProductModifierItem
          }
          translations {
            __typename
            language
            title
          }
        }
        variants {
          __typename
          ...FragmentProductVariant
        }
        categories {
          __typename
          id
          externalId
          reference
          status
          position
          translations {
            __typename
            language
            title
          }
        }
        fulfilmentPoints {
          __typename
          ...FragmentFulfilmentPoint
        }
        translations {
          __typename
          language
          title
        }
      }
      """

    public static let possibleTypes: [String] = ["Product"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("reference", type: .scalar(String.self)),
        GraphQLField("externalId", type: .scalar(String.self)),
        GraphQLField("images", type: .list(.object(Image.selections))),
        GraphQLField("modifierLists", type: .list(.object(ModifierList.selections))),
        GraphQLField("variants", type: .list(.object(Variant.selections))),
        GraphQLField("categories", type: .list(.object(Category.selections))),
        GraphQLField("fulfilmentPoints", type: .list(.object(FulfilmentPoint.selections))),
        GraphQLField("translations", type: .list(.object(Translation.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, status: String? = nil, reference: String? = nil, externalId: String? = nil, images: [Image?]? = nil, modifierLists: [ModifierList?]? = nil, variants: [Variant?]? = nil, categories: [Category?]? = nil, fulfilmentPoints: [FulfilmentPoint?]? = nil, translations: [Translation?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Product", "id": id, "status": status, "reference": reference, "externalId": externalId, "images": images.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }, "modifierLists": modifierLists.flatMap { (value: [ModifierList?]) -> [ResultMap?] in value.map { (value: ModifierList?) -> ResultMap? in value.flatMap { (value: ModifierList) -> ResultMap in value.resultMap } } }, "variants": variants.flatMap { (value: [Variant?]) -> [ResultMap?] in value.map { (value: Variant?) -> ResultMap? in value.flatMap { (value: Variant) -> ResultMap in value.resultMap } } }, "categories": categories.flatMap { (value: [Category?]) -> [ResultMap?] in value.map { (value: Category?) -> ResultMap? in value.flatMap { (value: Category) -> ResultMap in value.resultMap } } }, "fulfilmentPoints": fulfilmentPoints.flatMap { (value: [FulfilmentPoint?]) -> [ResultMap?] in value.map { (value: FulfilmentPoint?) -> ResultMap? in value.flatMap { (value: FulfilmentPoint) -> ResultMap in value.resultMap } } }, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
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

    public var status: String? {
      get {
        return resultMap["status"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "status")
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

    public var externalId: String? {
      get {
        return resultMap["externalId"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "externalId")
      }
    }

    public var images: [Image?]? {
      get {
        return (resultMap["images"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Image?] in value.map { (value: ResultMap?) -> Image? in value.flatMap { (value: ResultMap) -> Image in Image(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }, forKey: "images")
      }
    }

    public var modifierLists: [ModifierList?]? {
      get {
        return (resultMap["modifierLists"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ModifierList?] in value.map { (value: ResultMap?) -> ModifierList? in value.flatMap { (value: ResultMap) -> ModifierList in ModifierList(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [ModifierList?]) -> [ResultMap?] in value.map { (value: ModifierList?) -> ResultMap? in value.flatMap { (value: ModifierList) -> ResultMap in value.resultMap } } }, forKey: "modifierLists")
      }
    }

    public var variants: [Variant?]? {
      get {
        return (resultMap["variants"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Variant?] in value.map { (value: ResultMap?) -> Variant? in value.flatMap { (value: ResultMap) -> Variant in Variant(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Variant?]) -> [ResultMap?] in value.map { (value: Variant?) -> ResultMap? in value.flatMap { (value: Variant) -> ResultMap in value.resultMap } } }, forKey: "variants")
      }
    }

    public var categories: [Category?]? {
      get {
        return (resultMap["categories"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Category?] in value.map { (value: ResultMap?) -> Category? in value.flatMap { (value: ResultMap) -> Category in Category(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Category?]) -> [ResultMap?] in value.map { (value: Category?) -> ResultMap? in value.flatMap { (value: Category) -> ResultMap in value.resultMap } } }, forKey: "categories")
      }
    }

    public var fulfilmentPoints: [FulfilmentPoint?]? {
      get {
        return (resultMap["fulfilmentPoints"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [FulfilmentPoint?] in value.map { (value: ResultMap?) -> FulfilmentPoint? in value.flatMap { (value: ResultMap) -> FulfilmentPoint in FulfilmentPoint(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [FulfilmentPoint?]) -> [ResultMap?] in value.map { (value: FulfilmentPoint?) -> ResultMap? in value.flatMap { (value: FulfilmentPoint) -> ResultMap in value.resultMap } } }, forKey: "fulfilmentPoints")
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

    public struct Image: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ProductImage"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("imageUrl", type: .scalar(String.self)),
          GraphQLField("position", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(imageUrl: String? = nil, position: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "ProductImage", "imageUrl": imageUrl, "position": position])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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

      public var position: Int? {
        get {
          return resultMap["position"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "position")
        }
      }
    }

    public struct ModifierList: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ProductModifierList"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("status", type: .scalar(String.self)),
          GraphQLField("externalId", type: .scalar(String.self)),
          GraphQLField("reference", type: .scalar(String.self)),
          GraphQLField("multipleSelect", type: .scalar(Bool.self)),
          GraphQLField("mandatorySelect", type: .scalar(Bool.self)),
          GraphQLField("maxAllowed", type: .scalar(Int.self)),
          GraphQLField("items", type: .list(.object(Item.selections))),
          GraphQLField("translations", type: .list(.object(Translation.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, status: String? = nil, externalId: String? = nil, reference: String? = nil, multipleSelect: Bool? = nil, mandatorySelect: Bool? = nil, maxAllowed: Int? = nil, items: [Item?]? = nil, translations: [Translation?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "ProductModifierList", "id": id, "status": status, "externalId": externalId, "reference": reference, "multipleSelect": multipleSelect, "mandatorySelect": mandatorySelect, "maxAllowed": maxAllowed, "items": items.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
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

      public var status: String? {
        get {
          return resultMap["status"] as? String
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

      public var reference: String? {
        get {
          return resultMap["reference"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reference")
        }
      }

      public var multipleSelect: Bool? {
        get {
          return resultMap["multipleSelect"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "multipleSelect")
        }
      }

      public var mandatorySelect: Bool? {
        get {
          return resultMap["mandatorySelect"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "mandatorySelect")
        }
      }

      public var maxAllowed: Int? {
        get {
          return resultMap["maxAllowed"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "maxAllowed")
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

      public var translations: [Translation?]? {
        get {
          return (resultMap["translations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Translation?] in value.map { (value: ResultMap?) -> Translation? in value.flatMap { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, forKey: "translations")
        }
      }

      public struct Item: GraphQLSelectionSet {
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

      public struct Translation: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductModifierListTranslation"]

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
          self.init(unsafeResultMap: ["__typename": "ProductModifierListTranslation", "language": language, "title": title])
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

    public struct Variant: GraphQLSelectionSet {
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

    public struct Category: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ProductCategory"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("externalId", type: .scalar(String.self)),
          GraphQLField("reference", type: .scalar(String.self)),
          GraphQLField("status", type: .scalar(String.self)),
          GraphQLField("position", type: .scalar(Int.self)),
          GraphQLField("translations", type: .list(.object(Translation.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, externalId: String? = nil, reference: String? = nil, status: String? = nil, position: Int? = nil, translations: [Translation?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "ProductCategory", "id": id, "externalId": externalId, "reference": reference, "status": status, "position": position, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
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

      public var status: String? {
        get {
          return resultMap["status"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
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
        public static let possibleTypes: [String] = ["ProductCategoryTranslation"]

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
          self.init(unsafeResultMap: ["__typename": "ProductCategoryTranslation", "language": language, "title": title])
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

    public struct Translation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ProductTranslation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("language", type: .scalar(String.self)),
          GraphQLField("title", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(language: String? = nil, title: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ProductTranslation", "language": language, "title": title])
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
    }
  }
}
