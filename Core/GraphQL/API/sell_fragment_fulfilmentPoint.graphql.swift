// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  struct FragmentFulfilmentPoint: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentFulfilmentPoint on FulfilmentPoint {
        __typename
        id
        externalId
        reference
        type
        status
        imageUrl
        mapImageUrl
        lat
        long
        waitTime
        prepTime
        position
        translations {
          __typename
          language
          title
        }
        seatForm {
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
        categories {
          __typename
          ...FragmentFulfilmentPointCategory
        }
        venue {
          __typename
          id
          label
          name
          status
          isDefault
          description
          imageUrl
          mapImageUrl
          geoLat
          geoLong
          geoLatNorthWest
          geoLongNorthWest
          geoLatSouthEast
          geoLongSouthEast
          city
          externalId
          createdAt
          updatedAt
          venueIconUrl
        }
        timeslots {
          __typename
          ...FragmentTimeslot
        }
      }
      """

    public static let possibleTypes: [String] = ["FulfilmentPoint"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("externalId", type: .scalar(String.self)),
        GraphQLField("reference", type: .scalar(String.self)),
        GraphQLField("type", type: .scalar(FulfilmentPointType.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("imageUrl", type: .scalar(String.self)),
        GraphQLField("mapImageUrl", type: .scalar(String.self)),
        GraphQLField("lat", type: .scalar(Double.self)),
        GraphQLField("long", type: .scalar(Double.self)),
        GraphQLField("waitTime", type: .scalar(Int.self)),
        GraphQLField("prepTime", type: .scalar(Int.self)),
        GraphQLField("position", type: .scalar(Int.self)),
        GraphQLField("translations", type: .list(.object(Translation.selections))),
        GraphQLField("seatForm", type: .object(SeatForm.selections)),
        GraphQLField("categories", type: .list(.object(Category.selections))),
        GraphQLField("venue", type: .object(Venue.selections)),
        GraphQLField("timeslots", type: .list(.object(Timeslot.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, externalId: String? = nil, reference: String? = nil, type: FulfilmentPointType? = nil, status: String? = nil, imageUrl: String? = nil, mapImageUrl: String? = nil, lat: Double? = nil, long: Double? = nil, waitTime: Int? = nil, prepTime: Int? = nil, position: Int? = nil, translations: [Translation?]? = nil, seatForm: SeatForm? = nil, categories: [Category?]? = nil, venue: Venue? = nil, timeslots: [Timeslot?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "FulfilmentPoint", "id": id, "externalId": externalId, "reference": reference, "type": type, "status": status, "imageUrl": imageUrl, "mapImageUrl": mapImageUrl, "lat": lat, "long": long, "waitTime": waitTime, "prepTime": prepTime, "position": position, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, "seatForm": seatForm.flatMap { (value: SeatForm) -> ResultMap in value.resultMap }, "categories": categories.flatMap { (value: [Category?]) -> [ResultMap?] in value.map { (value: Category?) -> ResultMap? in value.flatMap { (value: Category) -> ResultMap in value.resultMap } } }, "venue": venue.flatMap { (value: Venue) -> ResultMap in value.resultMap }, "timeslots": timeslots.flatMap { (value: [Timeslot?]) -> [ResultMap?] in value.map { (value: Timeslot?) -> ResultMap? in value.flatMap { (value: Timeslot) -> ResultMap in value.resultMap } } }])
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

    public var type: FulfilmentPointType? {
      get {
        return resultMap["type"] as? FulfilmentPointType
      }
      set {
        resultMap.updateValue(newValue, forKey: "type")
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

    public var imageUrl: String? {
      get {
        return resultMap["imageUrl"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "imageUrl")
      }
    }

    public var mapImageUrl: String? {
      get {
        return resultMap["mapImageUrl"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "mapImageUrl")
      }
    }

    public var lat: Double? {
      get {
        return resultMap["lat"] as? Double
      }
      set {
        resultMap.updateValue(newValue, forKey: "lat")
      }
    }

    public var long: Double? {
      get {
        return resultMap["long"] as? Double
      }
      set {
        resultMap.updateValue(newValue, forKey: "long")
      }
    }

    public var waitTime: Int? {
      get {
        return resultMap["waitTime"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "waitTime")
      }
    }

    public var prepTime: Int? {
      get {
        return resultMap["prepTime"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "prepTime")
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

    public var seatForm: SeatForm? {
      get {
        return (resultMap["seatForm"] as? ResultMap).flatMap { SeatForm(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "seatForm")
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

    public var venue: Venue? {
      get {
        return (resultMap["venue"] as? ResultMap).flatMap { Venue(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "venue")
      }
    }

    public var timeslots: [Timeslot?]? {
      get {
        return (resultMap["timeslots"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Timeslot?] in value.map { (value: ResultMap?) -> Timeslot? in value.flatMap { (value: ResultMap) -> Timeslot in Timeslot(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Timeslot?]) -> [ResultMap?] in value.map { (value: Timeslot?) -> ResultMap? in value.flatMap { (value: Timeslot) -> ResultMap in value.resultMap } } }, forKey: "timeslots")
      }
    }

    public struct Translation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FulfilmentPointTranslation"]

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
        self.init(unsafeResultMap: ["__typename": "FulfilmentPointTranslation", "language": language, "title": title])
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

    public struct SeatForm: GraphQLSelectionSet {
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

    public struct Category: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FulfilmentPointCategory"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragmentFulfilmentPointCategory.self),
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

        public var fragmentFulfilmentPointCategory: FragmentFulfilmentPointCategory {
          get {
            return FragmentFulfilmentPointCategory(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public struct Venue: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Venue"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("label", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("status", type: .scalar(String.self)),
          GraphQLField("isDefault", type: .scalar(Bool.self)),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("imageUrl", type: .scalar(String.self)),
          GraphQLField("mapImageUrl", type: .scalar(String.self)),
          GraphQLField("geoLat", type: .scalar(Double.self)),
          GraphQLField("geoLong", type: .scalar(Double.self)),
          GraphQLField("geoLatNorthWest", type: .scalar(Double.self)),
          GraphQLField("geoLongNorthWest", type: .scalar(Double.self)),
          GraphQLField("geoLatSouthEast", type: .scalar(Double.self)),
          GraphQLField("geoLongSouthEast", type: .scalar(Double.self)),
          GraphQLField("city", type: .scalar(String.self)),
          GraphQLField("externalId", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
          GraphQLField("venueIconUrl", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, label: String? = nil, name: String? = nil, status: String? = nil, isDefault: Bool? = nil, description: String? = nil, imageUrl: String? = nil, mapImageUrl: String? = nil, geoLat: Double? = nil, geoLong: Double? = nil, geoLatNorthWest: Double? = nil, geoLongNorthWest: Double? = nil, geoLatSouthEast: Double? = nil, geoLongSouthEast: Double? = nil, city: String? = nil, externalId: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, venueIconUrl: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Venue", "id": id, "label": label, "name": name, "status": status, "isDefault": isDefault, "description": description, "imageUrl": imageUrl, "mapImageUrl": mapImageUrl, "geoLat": geoLat, "geoLong": geoLong, "geoLatNorthWest": geoLatNorthWest, "geoLongNorthWest": geoLongNorthWest, "geoLatSouthEast": geoLatSouthEast, "geoLongSouthEast": geoLongSouthEast, "city": city, "externalId": externalId, "createdAt": createdAt, "updatedAt": updatedAt, "venueIconUrl": venueIconUrl])
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

      public var label: String? {
        get {
          return resultMap["label"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "label")
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

      public var status: String? {
        get {
          return resultMap["status"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var isDefault: Bool? {
        get {
          return resultMap["isDefault"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isDefault")
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

      public var imageUrl: String? {
        get {
          return resultMap["imageUrl"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "imageUrl")
        }
      }

      public var mapImageUrl: String? {
        get {
          return resultMap["mapImageUrl"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "mapImageUrl")
        }
      }

      public var geoLat: Double? {
        get {
          return resultMap["geoLat"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "geoLat")
        }
      }

      public var geoLong: Double? {
        get {
          return resultMap["geoLong"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "geoLong")
        }
      }

      public var geoLatNorthWest: Double? {
        get {
          return resultMap["geoLatNorthWest"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "geoLatNorthWest")
        }
      }

      public var geoLongNorthWest: Double? {
        get {
          return resultMap["geoLongNorthWest"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "geoLongNorthWest")
        }
      }

      public var geoLatSouthEast: Double? {
        get {
          return resultMap["geoLatSouthEast"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "geoLatSouthEast")
        }
      }

      public var geoLongSouthEast: Double? {
        get {
          return resultMap["geoLongSouthEast"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "geoLongSouthEast")
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

      public var externalId: String? {
        get {
          return resultMap["externalId"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "externalId")
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

      public var venueIconUrl: String? {
        get {
          return resultMap["venueIconUrl"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "venueIconUrl")
        }
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
  }
}
