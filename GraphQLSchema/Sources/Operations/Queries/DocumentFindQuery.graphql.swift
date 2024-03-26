// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class DocumentFindQuery: GraphQLQuery {
  public static let operationName: String = "DocumentFind"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query DocumentFind($patient_id: Int!) { documentfind(patient_id: $patient_id) { __typename assign_to attached_to document_id document_type fax file_type filename generated_dt patient_id patient_product_id program reviewed signed_data signed_dt signed_name source } }"#
    ))

  public var patient_id: Int

  public init(patient_id: Int) {
    self.patient_id = patient_id
  }

  public var __variables: Variables? { ["patient_id": patient_id] }

  public struct Data: GraphQLSchema.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { GraphQLSchema.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("documentfind", [Documentfind?]?.self, arguments: ["patient_id": .variable("patient_id")]),
    ] }

    public var documentfind: [Documentfind?]? { __data["documentfind"] }

    /// Documentfind
    ///
    /// Parent Type: `Document`
    public struct Documentfind: GraphQLSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { GraphQLSchema.Objects.Document }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("assign_to", String.self),
        .field("attached_to", String.self),
        .field("document_id", Int.self),
        .field("document_type", String.self),
        .field("fax", String.self),
        .field("file_type", String.self),
        .field("filename", String.self),
        .field("generated_dt", String.self),
        .field("patient_id", Int.self),
        .field("patient_product_id", Int.self),
        .field("program", String.self),
        .field("reviewed", String.self),
        .field("signed_data", String.self),
        .field("signed_dt", String.self),
        .field("signed_name", String.self),
        .field("source", String.self),
      ] }

      public var assign_to: String { __data["assign_to"] }
      public var attached_to: String { __data["attached_to"] }
      public var document_id: Int { __data["document_id"] }
      public var document_type: String { __data["document_type"] }
      public var fax: String { __data["fax"] }
      public var file_type: String { __data["file_type"] }
      public var filename: String { __data["filename"] }
      public var generated_dt: String { __data["generated_dt"] }
      public var patient_id: Int { __data["patient_id"] }
      public var patient_product_id: Int { __data["patient_product_id"] }
      public var program: String { __data["program"] }
      public var reviewed: String { __data["reviewed"] }
      public var signed_data: String { __data["signed_data"] }
      public var signed_dt: String { __data["signed_dt"] }
      public var signed_name: String { __data["signed_name"] }
      public var source: String { __data["source"] }
    }
  }
}
