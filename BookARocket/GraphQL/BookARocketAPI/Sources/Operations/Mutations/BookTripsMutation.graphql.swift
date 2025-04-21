// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class BookTripsMutation: GraphQLMutation {
  public static let operationName: String = "BookTrips"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation BookTrips($launchIds: [ID]!) { bookTrips(launchIds: $launchIds) { __typename success message launches { __typename id isBooked } } }"#
    ))

  public var launchIds: [ID?]

  public init(launchIds: [ID?]) {
    self.launchIds = launchIds
  }

  public var __variables: Variables? { ["launchIds": launchIds] }

  public struct Data: BookARocketAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { BookARocketAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("bookTrips", BookTrips.self, arguments: ["launchIds": .variable("launchIds")]),
    ] }

    public var bookTrips: BookTrips { __data["bookTrips"] }

    /// BookTrips
    ///
    /// Parent Type: `TripUpdateResponse`
    public struct BookTrips: BookARocketAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { BookARocketAPI.Objects.TripUpdateResponse }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("success", Bool.self),
        .field("message", String?.self),
        .field("launches", [Launch?]?.self),
      ] }

      public var success: Bool { __data["success"] }
      public var message: String? { __data["message"] }
      public var launches: [Launch?]? { __data["launches"] }

      /// BookTrips.Launch
      ///
      /// Parent Type: `Launch`
      public struct Launch: BookARocketAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { BookARocketAPI.Objects.Launch }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", BookARocketAPI.ID.self),
          .field("isBooked", Bool.self),
        ] }

        public var id: BookARocketAPI.ID { __data["id"] }
        public var isBooked: Bool { __data["isBooked"] }
      }
    }
  }
}
