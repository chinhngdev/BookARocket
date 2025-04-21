// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class TripsUpdatedSubscription: GraphQLSubscription {
  public static let operationName: String = "TripsUpdated"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"subscription TripsUpdated { tripsBooked }"#
    ))

  public init() {}

  public struct Data: BookARocket.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { BookARocket.Objects.Subscription }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("tripsBooked", Int?.self),
    ] }

    public var tripsBooked: Int? { __data["tripsBooked"] }
  }
}
