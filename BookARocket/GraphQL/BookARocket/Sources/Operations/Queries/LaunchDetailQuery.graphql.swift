// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class LaunchDetailQuery: GraphQLQuery {
  public static let operationName: String = "LaunchDetail"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query LaunchDetail($launchId: ID!) { launch(id: $launchId) { __typename id isBooked mission { __typename name missionPatch } rocket { __typename id name type } site } }"#
    ))

  public var launchId: ID

  public init(launchId: ID) {
    self.launchId = launchId
  }

  public var __variables: Variables? { ["launchId": launchId] }

  public struct Data: BookARocket.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { BookARocket.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("launch", Launch?.self, arguments: ["id": .variable("launchId")]),
    ] }

    public var launch: Launch? { __data["launch"] }

    /// Launch
    ///
    /// Parent Type: `Launch`
    public struct Launch: BookARocket.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { BookARocket.Objects.Launch }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", BookARocket.ID.self),
        .field("isBooked", Bool.self),
        .field("mission", Mission?.self),
        .field("rocket", Rocket?.self),
        .field("site", String?.self),
      ] }

      public var id: BookARocket.ID { __data["id"] }
      public var isBooked: Bool { __data["isBooked"] }
      public var mission: Mission? { __data["mission"] }
      public var rocket: Rocket? { __data["rocket"] }
      public var site: String? { __data["site"] }

      /// Launch.Mission
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

      /// Launch.Rocket
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
