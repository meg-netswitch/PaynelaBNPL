// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ProviderNameQuery: GraphQLQuery {
  public static let operationName: String = "ProviderName"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query ProviderName { providerfind(provider_id: 10) { __typename provider_type first_name last_name } }"#
    ))

  public init() {}

  public struct Data: GraphQLSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { GraphQLSchema.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("providerfind", Providerfind?.self, arguments: ["provider_id": 10]),
    ] }

    public var providerfind: Providerfind? { __data["providerfind"] }

    /// Providerfind
    ///
    /// Parent Type: `Provider`
    public struct Providerfind: GraphQLSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { GraphQLSchema.Objects.Provider }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("provider_type", String.self),
        .field("first_name", String.self),
        .field("last_name", String.self),
      ] }

      public var provider_type: String { __data["provider_type"] }
      public var first_name: String { __data["first_name"] }
      public var last_name: String { __data["last_name"] }
    }
  }
}
