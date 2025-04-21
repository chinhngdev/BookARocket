// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class LaunchHistoriesQuery: GraphQLQuery {
  public static let operationName: String = "LaunchHistories"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query LaunchHistories($pageSize: Int) { launches(pageSize: $pageSize) { __typename cursor hasMore launches { __typename id site mission { __typename name missionPatch } rocket { __typename id name type } } } }"#
    ))

  public var pageSize: GraphQLNullable<Int>

  public init(pageSize: GraphQLNullable<Int>) {
    self.pageSize = pageSize
  }

  public var __variables: Variables? { ["pageSize": pageSize] }

  public struct Data: BookARocket.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { BookARocket.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("launches", Launches.self, arguments: ["pageSize": .variable("pageSize")]),
    ] }

    public var launches: Launches { __data["launches"] }

    /// Launches
    ///
    /// Parent Type: `LaunchConnection`
    public struct Launches: BookARocket.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { BookARocket.Objects.LaunchConnection }
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
      public struct Launch: BookARocket.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { BookARocket.Objects.Launch }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", BookARocket.ID.self),
          .field("site", String?.self),
          .field("mission", Mission?.self),
          .field("rocket", Rocket?.self),
        ] }

        public var id: BookARocket.ID { __data["id"] }
        public var site: String? { __data["site"] }
        public var mission: Mission? { __data["mission"] }
        public var rocket: Rocket? { __data["rocket"] }

        /// Launches.Launch.Mission
        ///
        /// Parent Type: `Mission`
        public struct Mission: BookARocket.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { BookARocket.Objects.Mission }
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
        public struct Rocket: BookARocket.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { BookARocket.Objects.Rocket }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", BookARocket.ID.self),
            .field("name", String?.self),
            .field("type", String?.self),
          ] }

          public var id: BookARocket.ID { __data["id"] }
          public var name: String? { __data["name"] }
          public var type: String? { __data["type"] }
        }
      }
    }
  }
}
