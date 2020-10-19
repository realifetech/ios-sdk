// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct AnalyticEvent: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - type
  ///   - action
  ///   - new
  ///   - old
  ///   - version
  public init(type: String, action: String, new: Swift.Optional<String?> = nil, old: Swift.Optional<String?> = nil, version: String) {
    graphQLMap = ["type": type, "action": action, "new": new, "old": old, "version": version]
  }

  public var type: String {
    get {
      return graphQLMap["type"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var action: String {
    get {
      return graphQLMap["action"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "action")
    }
  }

  public var new: Swift.Optional<String?> {
    get {
      return graphQLMap["new"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "new")
    }
  }

  public var old: Swift.Optional<String?> {
    get {
      return graphQLMap["old"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "old")
    }
  }

  public var version: String {
    get {
      return graphQLMap["version"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "version")
    }
  }
}
