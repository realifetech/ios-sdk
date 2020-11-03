// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// Apollo namespace
public extension Apollo {
  final class BelongsToAudienceByExternalIdQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query belongsToAudienceByExternalId($externalAudienceId: String!) {
        me {
          __typename
          device {
            __typename
            belongsToAudienceByExternalId(externalAudienceId: $externalAudienceId)
          }
        }
      }
      """

    public let operationName: String = "belongsToAudienceByExternalId"

    public var externalAudienceId: String

    public init(externalAudienceId: String) {
      self.externalAudienceId = externalAudienceId
    }

    public var variables: GraphQLMap? {
      return ["externalAudienceId": externalAudienceId]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("me", type: .object(Me.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(me: Me? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "me": me.flatMap { (value: Me) -> ResultMap in value.resultMap }])
      }

      public var me: Me? {
        get {
          return (resultMap["me"] as? ResultMap).flatMap { Me(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "me")
        }
      }

      public struct Me: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Context"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("device", type: .object(Device.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(device: Device? = nil) {
          self.init(unsafeResultMap: ["__typename": "Context", "device": device.flatMap { (value: Device) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var device: Device? {
          get {
            return (resultMap["device"] as? ResultMap).flatMap { Device(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "device")
          }
        }

        public struct Device: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Device"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("belongsToAudienceByExternalId", arguments: ["externalAudienceId": GraphQLVariable("externalAudienceId")], type: .scalar(Bool.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(belongsToAudienceByExternalId: Bool? = nil) {
            self.init(unsafeResultMap: ["__typename": "Device", "belongsToAudienceByExternalId": belongsToAudienceByExternalId])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var belongsToAudienceByExternalId: Bool? {
            get {
              return resultMap["belongsToAudienceByExternalId"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "belongsToAudienceByExternalId")
            }
          }
        }
      }
    }
  }
}
