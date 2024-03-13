//
//  PatientModel.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import Foundation

struct Patient: Codable {
    var patient_id: Int
    var member_id: String
    var patient_name: PatientName
    var name_suffix: String
    var name_title: String
    var gender: String
    var dob: String
    var email: String
    var patient_status: String
    var address: Address
    var phone: Phone
    var enroll_phase: String
    var consent_reason: String
    var kyc_id: String
    var loan_amount: String
    var modified_dt: String
    var opt_in: OptIn
    var ssn: String
    var status: String
    var insurance: Insurance
    var created_by_user_id: String
    var created_dt: String
    var enroll_dt: String
    var enrolled_by: String
    var modified_by_user_id: String
}

struct PatientName: Codable {
    var first: String
    var middle: String
    var last: String
}

struct Address: Codable {
    var address_1: String
    var address_2: String
    var city: String
    var state: String
    var zip: String
}

struct Phone: Codable {
    var fax: String
    var home: String
    var mobile: String
    var work: String
}

struct OptIn: Codable {
    var agreed_timesheet: String
    var optin_data: String
    var optin_type: String
    var product_id: String
}

struct Insurance: Codable{
    var medical: MedicalInsurance
    var rx: RxInsurance
}

struct MedicalInsurance: Codable {
    var bin: String
    var effective_date: String
    var group_number: String
    var member_number: String
    var name: String
    var pcn: String
    var plan_type: String
}

struct RxInsurance: Codable {
    var bin: String
    var effective_date: String
    var group_number: String
    var member_number: String
    var name: String
    var pcn: String
    var plan_type: String
}
