// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class LoginMutation: GraphQLMutation {
  public static let operationName: String = "Login"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation Login($email: String) { login(email: $email) { __typename email id token } }"#
    ))

  public var email: GraphQLNullable<String>

  public init(email: GraphQLNullable<String>) {
    self.email = email
  }

  public var __variables: Variables? { ["email": email] }

  public struct Data: BookARocketAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { BookARocketAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("login", Login?.self, arguments: ["email": .variable("email")]),
    ] }

    public var login: Login? { __data["login"] }

    /// Login
    ///
    /// Parent Type: `User`
    public struct Login: BookARocketAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { BookARocketAPI.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("email", String.self),
        .field("id", BookARocketAPI.ID.self),
        .field("token", String?.self),
      ] }

      public var email: String { __data["email"] }
      public var id: BookARocketAPI.ID { __data["id"] }
      public var token: String? { __data["token"] }
    }
  }
}
