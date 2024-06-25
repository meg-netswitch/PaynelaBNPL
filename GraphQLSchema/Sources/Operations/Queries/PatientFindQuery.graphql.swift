// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PatientFindQuery: GraphQLQuery {
  public static let operationName: String = "PatientFind"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query PatientFind($patient_id: Int!) { patientfind(patient_id: $patient_id) { __typename patient_id member_id patient_name { __typename first middle last } name_suffix name_title gender dob email patient_status address { __typename address_1 address_2 city state zip } phone { __typename fax home mobile work } enroll_phase consent_reason kyc_id loan_amount modified_dt opt_in { __typename agreed_timesheet optin_data optin_type product_id } ssn status insurance { __typename medical { __typename bin effective_date group_number member_number name pcn plan_type } rx { __typename bin effective_date group_number member_number name pcn plan_type } } created_by_user_id created_dt enroll_dt enrolled_by modified_by_user_id } }"#
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
      .field("patientfind", Patientfind?.self, arguments: ["patient_id": .variable("patient_id")]),
    ] }

    public var patientfind: Patientfind? { __data["patientfind"] }

    /// Patientfind
    ///
    /// Parent Type: `Patient`
    public struct Patientfind: GraphQLSchema.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { GraphQLSchema.Objects.Patient }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("patient_id", Int.self),
        .field("member_id", String.self),
        .field("patient_name", Patient_name.self),
        .field("name_suffix", String.self),
        .field("name_title", String.self),
        .field("gender", String.self),
        .field("dob", String.self),
        .field("email", String.self),
        .field("patient_status", String.self),
        .field("address", Address.self),
        .field("phone", Phone.self),
        .field("enroll_phase", String.self),
        .field("consent_reason", String.self),
        .field("kyc_id", String.self),
        .field("loan_amount", String.self),
        .field("modified_dt", String.self),
        .field("opt_in", [Opt_in?].self),
        .field("ssn", String.self),
        .field("status", String.self),
        .field("insurance", Insurance.self),
        .field("created_by_user_id", String.self),
        .field("created_dt", String.self),
        .field("enroll_dt", String.self),
        .field("enrolled_by", String.self),
        .field("modified_by_user_id", String.self),
      ] }

      public var patient_id: Int { __data["patient_id"] }
      public var member_id: String { __data["member_id"] }
      public var patient_name: Patient_name { __data["patient_name"] }
      public var name_suffix: String { __data["name_suffix"] }
      public var name_title: String { __data["name_title"] }
      public var gender: String { __data["gender"] }
      public var dob: String { __data["dob"] }
      public var email: String { __data["email"] }
      public var patient_status: String { __data["patient_status"] }
      public var address: Address { __data["address"] }
      public var phone: Phone { __data["phone"] }
      public var enroll_phase: String { __data["enroll_phase"] }
      public var consent_reason: String { __data["consent_reason"] }
      public var kyc_id: String { __data["kyc_id"] }
      public var loan_amount: String { __data["loan_amount"] }
      public var modified_dt: String { __data["modified_dt"] }
      public var opt_in: [Opt_in?] { __data["opt_in"] }
      public var ssn: String { __data["ssn"] }
      public var status: String { __data["status"] }
      public var insurance: Insurance { __data["insurance"] }
      public var created_by_user_id: String { __data["created_by_user_id"] }
      public var created_dt: String { __data["created_dt"] }
      public var enroll_dt: String { __data["enroll_dt"] }
      public var enrolled_by: String { __data["enrolled_by"] }
      public var modified_by_user_id: String { __data["modified_by_user_id"] }

      /// Patientfind.Patient_name
      ///
      /// Parent Type: `PatientName`
      public struct Patient_name: GraphQLSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GraphQLSchema.Objects.PatientName }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("first", String?.self),
          .field("middle", String?.self),
          .field("last", String?.self),
        ] }

        public var first: String? { __data["first"] }
        public var middle: String? { __data["middle"] }
        public var last: String? { __data["last"] }
      }

      /// Patientfind.Address
      ///
      /// Parent Type: `Address`
      public struct Address: GraphQLSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GraphQLSchema.Objects.Address }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("address_1", String?.self),
          .field("address_2", String?.self),
          .field("city", String?.self),
          .field("state", String?.self),
          .field("zip", String?.self),
        ] }

        public var address_1: String? { __data["address_1"] }
        public var address_2: String? { __data["address_2"] }
        public var city: String? { __data["city"] }
        public var state: String? { __data["state"] }
        public var zip: String? { __data["zip"] }
      }

      /// Patientfind.Phone
      ///
      /// Parent Type: `Phone`
      public struct Phone: GraphQLSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GraphQLSchema.Objects.Phone }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("fax", String?.self),
          .field("home", String?.self),
          .field("mobile", String?.self),
          .field("work", String?.self),
        ] }

        public var fax: String? { __data["fax"] }
        public var home: String? { __data["home"] }
        public var mobile: String? { __data["mobile"] }
        public var work: String? { __data["work"] }
      }

      /// Patientfind.Opt_in
      ///
      /// Parent Type: `OptIn`
      public struct Opt_in: GraphQLSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GraphQLSchema.Objects.OptIn }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("agreed_timesheet", String?.self),
          .field("optin_data", String?.self),
          .field("optin_type", String?.self),
          .field("product_id", String?.self),
        ] }

        public var agreed_timesheet: String? { __data["agreed_timesheet"] }
        public var optin_data: String? { __data["optin_data"] }
        public var optin_type: String? { __data["optin_type"] }
        public var product_id: String? { __data["product_id"] }
      }

      /// Patientfind.Insurance
      ///
      /// Parent Type: `Insurance`
      public struct Insurance: GraphQLSchema.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { GraphQLSchema.Objects.Insurance }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("medical", Medical?.self),
          .field("rx", Rx?.self),
        ] }

        public var medical: Medical? { __data["medical"] }
        public var rx: Rx? { __data["rx"] }

        /// Patientfind.Insurance.Medical
        ///
        /// Parent Type: `Medical`
        public struct Medical: GraphQLSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { GraphQLSchema.Objects.Medical }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("bin", String?.self),
            .field("effective_date", String?.self),
            .field("group_number", String?.self),
            .field("member_number", String?.self),
            .field("name", String?.self),
            .field("pcn", String?.self),
            .field("plan_type", String?.self),
          ] }

          public var bin: String? { __data["bin"] }
          public var effective_date: String? { __data["effective_date"] }
          public var group_number: String? { __data["group_number"] }
          public var member_number: String? { __data["member_number"] }
          public var name: String? { __data["name"] }
          public var pcn: String? { __data["pcn"] }
          public var plan_type: String? { __data["plan_type"] }
        }

        /// Patientfind.Insurance.Rx
        ///
        /// Parent Type: `Rx`
        public struct Rx: GraphQLSchema.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { GraphQLSchema.Objects.Rx }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("bin", String?.self),
            .field("effective_date", String?.self),
            .field("group_number", String?.self),
            .field("member_number", String?.self),
            .field("name", String?.self),
            .field("pcn", String?.self),
            .field("plan_type", String?.self),
          ] }

          public var bin: String? { __data["bin"] }
          public var effective_date: String? { __data["effective_date"] }
          public var group_number: String? { __data["group_number"] }
          public var member_number: String? { __data["member_number"] }
          public var name: String? { __data["name"] }
          public var pcn: String? { __data["pcn"] }
          public var plan_type: String? { __data["plan_type"] }
        }
      }
    }
  }
}
