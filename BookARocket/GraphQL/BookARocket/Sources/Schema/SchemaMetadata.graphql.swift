// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == BookARocket.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == BookARocket.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == BookARocket.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == BookARocket.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Launch": return BookARocket.Objects.Launch
    case "LaunchConnection": return BookARocket.Objects.LaunchConnection
    case "Mission": return BookARocket.Objects.Mission
    case "Mutation": return BookARocket.Objects.Mutation
    case "Query": return BookARocket.Objects.Query
    case "Rocket": return BookARocket.Objects.Rocket
    case "Subscription": return BookARocket.Objects.Subscription
    case "TripUpdateResponse": return BookARocket.Objects.TripUpdateResponse
    case "User": return BookARocket.Objects.User
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
