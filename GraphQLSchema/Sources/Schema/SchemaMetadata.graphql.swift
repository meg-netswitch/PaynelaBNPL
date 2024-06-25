// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == GraphQLSchema.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == GraphQLSchema.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == GraphQLSchema.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == GraphQLSchema.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Query": return GraphQLSchema.Objects.Query
    case "Provider": return GraphQLSchema.Objects.Provider
    case "User": return GraphQLSchema.Objects.User
    case "CognitoAccess": return GraphQLSchema.Objects.CognitoAccess
    case "Patient": return GraphQLSchema.Objects.Patient
    case "PatientName": return GraphQLSchema.Objects.PatientName
    case "Address": return GraphQLSchema.Objects.Address
    case "Phone": return GraphQLSchema.Objects.Phone
    case "OptIn": return GraphQLSchema.Objects.OptIn
    case "Insurance": return GraphQLSchema.Objects.Insurance
    case "Medical": return GraphQLSchema.Objects.Medical
    case "Rx": return GraphQLSchema.Objects.Rx
    case "MockDocument": return GraphQLSchema.Objects.MockDocument
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
