// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UserloginQuery: GraphQLQuery {
  public static let operationName: String = "Userlogin"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Userlogin($username: String!, $password: String!) { userlogin(username: $username, password: $password) { __typename user_id username email user_role user_status password created_dt last_login } }"#
    ))

  public var username: String
  public var password: String

  public init(
    username: String,
    password: String
  ) {
    self.username = username
    self.password = password
  }

  public var __variables: Variables? { [
    "username": username,
    "password": password
  ] }

  public struct Data: GraphQLSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { GraphQLSchema.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("userlogin", Userlogin?.self, arguments: [
        "username": .variable("username"),
        "password": .variable("password")
      ]),
    ] }

    public var userlogin: Userlogin? { __data["userlogin"] }

    /// Userlogin
    ///
    /// Parent Type: `User`
    public struct Userlogin: GraphQLSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { GraphQLSchema.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("user_id", Int.self),
        .field("username", String?.self),
        .field("email", String?.self),
        .field("user_role", String?.self),
        .field("user_status", String?.self),
        .field("password", String?.self),
        .field("created_dt", String?.self),
        .field("last_login", String?.self),
      ] }

      public var user_id: Int { __data["user_id"] }
      public var username: String? { __data["username"] }
      public var email: String? { __data["email"] }
      public var user_role: String? { __data["user_role"] }
      public var user_status: String? { __data["user_status"] }
      public var password: String? { __data["password"] }
      public var created_dt: String? { __data["created_dt"] }
      public var last_login: String? { __data["last_login"] }
    }
  }
}
