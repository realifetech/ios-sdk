// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  struct FragmentForm: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentForm on Form {
        __typename
        id
        reference
        imageUrl
        completionButtonUrl
        completionButtonTitle
        showCompletionDate
        allowUpdate
        refreshOnSuccess
        validationIntegration
        expiresIn
        translations {
          __typename
          language
          title
          description
          submitButtonTitle
          skipButtonTitle
          completionButtonTitle
          completionTitle
          completionDescription
        }
        fields {
          __typename
          type
          key
          validationRegex
          required
          sortId
          autoFill {
            __typename
            type
            field
          }
          translations {
            __typename
            title
            language
            description
            completionDescription
            skipButtonTitle
            completionTitle
            completionButtonTitle
            submitButtonTitle
          }
          selectOptions {
            __typename
            title
            value
            iconUrl
          }
        }
      }
      """

    public static let possibleTypes: [String] = ["Form"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("reference", type: .scalar(String.self)),
        GraphQLField("imageUrl", type: .scalar(String.self)),
        GraphQLField("completionButtonUrl", type: .scalar(String.self)),
        GraphQLField("completionButtonTitle", type: .scalar(String.self)),
        GraphQLField("showCompletionDate", type: .scalar(Bool.self)),
        GraphQLField("allowUpdate", type: .scalar(Bool.self)),
        GraphQLField("refreshOnSuccess", type: .scalar(Bool.self)),
        GraphQLField("validationIntegration", type: .scalar(String.self)),
        GraphQLField("expiresIn", type: .scalar(Int.self)),
        GraphQLField("translations", type: .nonNull(.list(.object(Translation.selections)))),
        GraphQLField("fields", type: .list(.object(Field.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, reference: String? = nil, imageUrl: String? = nil, completionButtonUrl: String? = nil, completionButtonTitle: String? = nil, showCompletionDate: Bool? = nil, allowUpdate: Bool? = nil, refreshOnSuccess: Bool? = nil, validationIntegration: String? = nil, expiresIn: Int? = nil, translations: [Translation?], fields: [Field?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Form", "id": id, "reference": reference, "imageUrl": imageUrl, "completionButtonUrl": completionButtonUrl, "completionButtonTitle": completionButtonTitle, "showCompletionDate": showCompletionDate, "allowUpdate": allowUpdate, "refreshOnSuccess": refreshOnSuccess, "validationIntegration": validationIntegration, "expiresIn": expiresIn, "translations": translations.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } }, "fields": fields.flatMap { (value: [Field?]) -> [ResultMap?] in value.map { (value: Field?) -> ResultMap? in value.flatMap { (value: Field) -> ResultMap in value.resultMap } } }])
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

    public var reference: String? {
      get {
        return resultMap["reference"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "reference")
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

    public var completionButtonUrl: String? {
      get {
        return resultMap["completionButtonUrl"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "completionButtonUrl")
      }
    }

    public var completionButtonTitle: String? {
      get {
        return resultMap["completionButtonTitle"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "completionButtonTitle")
      }
    }

    public var showCompletionDate: Bool? {
      get {
        return resultMap["showCompletionDate"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "showCompletionDate")
      }
    }

    public var allowUpdate: Bool? {
      get {
        return resultMap["allowUpdate"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "allowUpdate")
      }
    }

    public var refreshOnSuccess: Bool? {
      get {
        return resultMap["refreshOnSuccess"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "refreshOnSuccess")
      }
    }

    public var validationIntegration: String? {
      get {
        return resultMap["validationIntegration"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "validationIntegration")
      }
    }

    public var expiresIn: Int? {
      get {
        return resultMap["expiresIn"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "expiresIn")
      }
    }

    public var translations: [Translation?] {
      get {
        return (resultMap["translations"] as! [ResultMap?]).map { (value: ResultMap?) -> Translation? in value.flatMap { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } }, forKey: "translations")
      }
    }

    public var fields: [Field?]? {
      get {
        return (resultMap["fields"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Field?] in value.map { (value: ResultMap?) -> Field? in value.flatMap { (value: ResultMap) -> Field in Field(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Field?]) -> [ResultMap?] in value.map { (value: Field?) -> ResultMap? in value.flatMap { (value: Field) -> ResultMap in value.resultMap } } }, forKey: "fields")
      }
    }

    public struct Translation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FormTranslation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("language", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("submitButtonTitle", type: .scalar(String.self)),
          GraphQLField("skipButtonTitle", type: .scalar(String.self)),
          GraphQLField("completionButtonTitle", type: .scalar(String.self)),
          GraphQLField("completionTitle", type: .scalar(String.self)),
          GraphQLField("completionDescription", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(language: String, title: String? = nil, description: String? = nil, submitButtonTitle: String? = nil, skipButtonTitle: String? = nil, completionButtonTitle: String? = nil, completionTitle: String? = nil, completionDescription: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "FormTranslation", "language": language, "title": title, "description": description, "submitButtonTitle": submitButtonTitle, "skipButtonTitle": skipButtonTitle, "completionButtonTitle": completionButtonTitle, "completionTitle": completionTitle, "completionDescription": completionDescription])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var language: String {
        get {
          return resultMap["language"]! as! String
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

      public var submitButtonTitle: String? {
        get {
          return resultMap["submitButtonTitle"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "submitButtonTitle")
        }
      }

      public var skipButtonTitle: String? {
        get {
          return resultMap["skipButtonTitle"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "skipButtonTitle")
        }
      }

      public var completionButtonTitle: String? {
        get {
          return resultMap["completionButtonTitle"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "completionButtonTitle")
        }
      }

      public var completionTitle: String? {
        get {
          return resultMap["completionTitle"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "completionTitle")
        }
      }

      public var completionDescription: String? {
        get {
          return resultMap["completionDescription"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "completionDescription")
        }
      }
    }

    public struct Field: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FormField"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .scalar(String.self)),
          GraphQLField("key", type: .scalar(String.self)),
          GraphQLField("validationRegex", type: .scalar(String.self)),
          GraphQLField("required", type: .scalar(Bool.self)),
          GraphQLField("sortId", type: .scalar(Int.self)),
          GraphQLField("autoFill", type: .object(AutoFill.selections)),
          GraphQLField("translations", type: .list(.object(Translation.selections))),
          GraphQLField("selectOptions", type: .list(.object(SelectOption.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(type: String? = nil, key: String? = nil, validationRegex: String? = nil, `required`: Bool? = nil, sortId: Int? = nil, autoFill: AutoFill? = nil, translations: [Translation?]? = nil, selectOptions: [SelectOption?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "FormField", "type": type, "key": key, "validationRegex": validationRegex, "required": `required`, "sortId": sortId, "autoFill": autoFill.flatMap { (value: AutoFill) -> ResultMap in value.resultMap }, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, "selectOptions": selectOptions.flatMap { (value: [SelectOption?]) -> [ResultMap?] in value.map { (value: SelectOption?) -> ResultMap? in value.flatMap { (value: SelectOption) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var type: String? {
        get {
          return resultMap["type"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
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

      public var validationRegex: String? {
        get {
          return resultMap["validationRegex"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "validationRegex")
        }
      }

      public var `required`: Bool? {
        get {
          return resultMap["required"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "required")
        }
      }

      public var sortId: Int? {
        get {
          return resultMap["sortId"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "sortId")
        }
      }

      public var autoFill: AutoFill? {
        get {
          return (resultMap["autoFill"] as? ResultMap).flatMap { AutoFill(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "autoFill")
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

      public var selectOptions: [SelectOption?]? {
        get {
          return (resultMap["selectOptions"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SelectOption?] in value.map { (value: ResultMap?) -> SelectOption? in value.flatMap { (value: ResultMap) -> SelectOption in SelectOption(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [SelectOption?]) -> [ResultMap?] in value.map { (value: SelectOption?) -> ResultMap? in value.flatMap { (value: SelectOption) -> ResultMap in value.resultMap } } }, forKey: "selectOptions")
        }
      }

      public struct AutoFill: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AutoFill"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("field", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(type: String? = nil, field: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "AutoFill", "type": type, "field": field])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        public var field: String? {
          get {
            return resultMap["field"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }
      }

      public struct Translation: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FormTranslation"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("language", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .scalar(String.self)),
            GraphQLField("completionDescription", type: .scalar(String.self)),
            GraphQLField("skipButtonTitle", type: .scalar(String.self)),
            GraphQLField("completionTitle", type: .scalar(String.self)),
            GraphQLField("completionButtonTitle", type: .scalar(String.self)),
            GraphQLField("submitButtonTitle", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: String? = nil, language: String, description: String? = nil, completionDescription: String? = nil, skipButtonTitle: String? = nil, completionTitle: String? = nil, completionButtonTitle: String? = nil, submitButtonTitle: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "FormTranslation", "title": title, "language": language, "description": description, "completionDescription": completionDescription, "skipButtonTitle": skipButtonTitle, "completionTitle": completionTitle, "completionButtonTitle": completionButtonTitle, "submitButtonTitle": submitButtonTitle])
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

        public var language: String {
          get {
            return resultMap["language"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "language")
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

        public var completionDescription: String? {
          get {
            return resultMap["completionDescription"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "completionDescription")
          }
        }

        public var skipButtonTitle: String? {
          get {
            return resultMap["skipButtonTitle"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "skipButtonTitle")
          }
        }

        public var completionTitle: String? {
          get {
            return resultMap["completionTitle"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "completionTitle")
          }
        }

        public var completionButtonTitle: String? {
          get {
            return resultMap["completionButtonTitle"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "completionButtonTitle")
          }
        }

        public var submitButtonTitle: String? {
          get {
            return resultMap["submitButtonTitle"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "submitButtonTitle")
          }
        }
      }

      public struct SelectOption: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FormSelectOption"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("value", type: .scalar(String.self)),
            GraphQLField("iconUrl", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: String? = nil, value: String? = nil, iconUrl: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "FormSelectOption", "title": title, "value": value, "iconUrl": iconUrl])
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

        public var value: String? {
          get {
            return resultMap["value"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "value")
          }
        }

        public var iconUrl: String? {
          get {
            return resultMap["iconUrl"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "iconUrl")
          }
        }
      }
    }
  }
}
