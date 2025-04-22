// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class LaunchHistoriesQuery: GraphQLQuery {
  public static let operationName: String = "LaunchHistories"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query LaunchHistories { launches { __typename cursor hasMore launches { __typename id site mission { __typename name missionPatch } rocket { __typename id name type } } } }"#
    ))

  public init() {}

  public struct Data: BookARocketAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { BookARocketAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("launches", Launches.self),
    ] }

    public var launches: Launches { __data["launches"] }

    /// Launches
    ///
    /// Parent Type: `LaunchConnection`
    public struct Launches: BookARocketAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { BookARocketAPI.Objects.LaunchConnection }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("cursor", String.self),
        .field("hasMore", Bool.self),
        .field("launches", [Launch?].self),
      ] }

      public var cursor: String { __data["cursor"] }
      public var hasMore: Bool { __data["hasMore"] }
      public var launches: [Launch?] { __data["launches"] }

      /// Launches.Launch
      ///
      /// Parent Type: `Launch`
      public struct Launch: BookARocketAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { BookARocketAPI.Objects.Launch }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", BookARocketAPI.ID.self),
          .field("site", String?.self),
          .field("mission", Mission?.self),
          .field("rocket", Rocket?.self),
        ] }

        public var id: BookARocketAPI.ID { __data["id"] }
        public var site: String? { __data["site"] }
        public var mission: Mission? { __data["mission"] }
        public var rocket: Rocket? { __data["rocket"] }

        /// Launches.Launch.Mission
        ///
        /// Parent Type: `Mission`
        public struct Mission: BookARocketAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { BookARocketAPI.Objects.Mission }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String?.self),
            .field("missionPatch", String?.self),
          ] }

          public var name: String? { __data["name"] }
          public var missionPatch: String? { __data["missionPatch"] }
        }

        /// Launches.Launch.Rocket
        ///
        /// Parent Type: `Rocket`
        public struct Rocket: BookARocketAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { BookARocketAPI.Objects.Rocket }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", BookARocketAPI.ID.self),
            .field("name", String?.self),
            .field("type", String?.self),
          ] }

          public var id: BookARocketAPI.ID { __data["id"] }
          public var name: String? { __data["name"] }
          public var type: String? { __data["type"] }
        }
      }
    }
  }
}
