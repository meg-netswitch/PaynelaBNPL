// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CognitoUserloginQuery: GraphQLQuery {
  public static let operationName: String = "CognitoUserlogin"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query CognitoUserlogin($username: String!, $password: String!) { cognitoUserLogin(username: $username, password: $password) { __typename valid access_token username message } }"#
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
      .field("cognitoUserLogin", CognitoUserLogin?.self, arguments: [
        "username": .variable("username"),
        "password": .variable("password")
      ]),
    ] }

    public var cognitoUserLogin: CognitoUserLogin? { __data["cognitoUserLogin"] }

    /// CognitoUserLogin
    ///
    /// Parent Type: `CognitoAccess`
    public struct CognitoUserLogin: GraphQLSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { GraphQLSchema.Objects.CognitoAccess }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("valid", Bool?.self),
        .field("access_token", String?.self),
        .field("username", String?.self),
        .field("message", String?.self),
      ] }

      public var valid: Bool? { __data["valid"] }
      public var access_token: String? { __data["access_token"] }
      public var username: String? { __data["username"] }
      public var message: String? { __data["message"] }
    }
  }
}
