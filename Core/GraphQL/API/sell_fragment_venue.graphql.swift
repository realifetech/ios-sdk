// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  struct FragmentVenue: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentVenue on Venue {
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
      """

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
}
