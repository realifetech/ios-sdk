// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public extension ApolloType {
  struct FragmentSeatInfo: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentSeatInfo on SeatInfo {
        __typename
        row
        seat
        block
        table
      }
      """

    public static let possibleTypes: [String] = ["SeatInfo"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("row", type: .scalar(String.self)),
        GraphQLField("seat", type: .scalar(String.self)),
        GraphQLField("block", type: .scalar(String.self)),
        GraphQLField("table", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(row: String? = nil, seat: String? = nil, block: String? = nil, table: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "SeatInfo", "row": row, "seat": seat, "block": block, "table": table])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var row: String? {
      get {
        return resultMap["row"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "row")
      }
    }

    public var seat: String? {
      get {
        return resultMap["seat"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "seat")
      }
    }

    public var block: String? {
      get {
        return resultMap["block"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "block")
      }
    }

    public var table: String? {
      get {
        return resultMap["table"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "table")
      }
    }
  }
}
