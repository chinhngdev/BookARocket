// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == BookARocketAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == BookARocketAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == BookARocketAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == BookARocketAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Launch": return BookARocketAPI.Objects.Launch
    case "LaunchConnection": return BookARocketAPI.Objects.LaunchConnection
    case "Mission": return BookARocketAPI.Objects.Mission
    case "Mutation": return BookARocketAPI.Objects.Mutation
    case "Query": return BookARocketAPI.Objects.Query
    case "Rocket": return BookARocketAPI.Objects.Rocket
    case "Subscription": return BookARocketAPI.Objects.Subscription
    case "TripUpdateResponse": return BookARocketAPI.Objects.TripUpdateResponse
    case "User": return BookARocketAPI.Objects.User
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
