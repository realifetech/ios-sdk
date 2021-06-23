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
          description
          collectionNote
          collectionNotes {
            __typename
            VIRTUAL_QUEUE_PREORDER
            VIRTUAL_QUEUE_CHECKIN
          }
        }
        seatForm {
          __typename
          ...FragmentForm
        }
        categories {
          __typename
          ...FragmentFulfilmentPointCategory
        }
        venue {
          __typename
          ...FragmentVenue
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
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("collectionNote", type: .scalar(String.self)),
          GraphQLField("collectionNotes", type: .list(.object(CollectionNote.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(language: Language? = nil, title: String? = nil, description: String? = nil, collectionNote: String? = nil, collectionNotes: [CollectionNote?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "FulfilmentPointTranslation", "language": language, "title": title, "description": description, "collectionNote": collectionNote, "collectionNotes": collectionNotes.flatMap { (value: [CollectionNote?]) -> [ResultMap?] in value.map { (value: CollectionNote?) -> ResultMap? in value.flatMap { (value: CollectionNote) -> ResultMap in value.resultMap } } }])
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

      public var collectionNotes: [CollectionNote?]? {
        get {
          return (resultMap["collectionNotes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [CollectionNote?] in value.map { (value: ResultMap?) -> CollectionNote? in value.flatMap { (value: ResultMap) -> CollectionNote in CollectionNote(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [CollectionNote?]) -> [ResultMap?] in value.map { (value: CollectionNote?) -> ResultMap? in value.flatMap { (value: CollectionNote) -> ResultMap in value.resultMap } } }, forKey: "collectionNotes")
        }
      }

      public struct CollectionNote: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CollectionNotes"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("VIRTUAL_QUEUE_PREORDER", type: .scalar(String.self)),
            GraphQLField("VIRTUAL_QUEUE_CHECKIN", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(virtualQueuePreorder: String? = nil, virtualQueueCheckin: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "CollectionNotes", "VIRTUAL_QUEUE_PREORDER": virtualQueuePreorder, "VIRTUAL_QUEUE_CHECKIN": virtualQueueCheckin])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var virtualQueuePreorder: String? {
          get {
            return resultMap["VIRTUAL_QUEUE_PREORDER"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "VIRTUAL_QUEUE_PREORDER")
          }
        }

        public var virtualQueueCheckin: String? {
          get {
            return resultMap["VIRTUAL_QUEUE_CHECKIN"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "VIRTUAL_QUEUE_CHECKIN")
          }
        }
      }
    }

    public struct SeatForm: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Form"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragmentForm.self),
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

        public var fragmentForm: FragmentForm {
          get {
            return FragmentForm(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
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
          GraphQLFragmentSpread(FragmentVenue.self),
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

        public var fragmentVenue: FragmentVenue {
          get {
            return FragmentVenue(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
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
