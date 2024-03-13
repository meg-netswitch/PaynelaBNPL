//
//  UserService.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import Foundation
class UserService {
    
    static let shared = UserService()
    
    var currentUserID: Int = 0
    var currentUser: User?
    var currentPatient: Patient?
    
    private init() {
        
    }
    
    func validateUser(username: String, withPassword password: String, completionHandler: @escaping (Bool) -> Void) {
        let currentUser = User(user_id: 0001, username: "testUser", email: "test@email.com", user_role: "Patient", user_status: "Active", password: password, created_dt: "02/22/24", last_login: "02/22/24")
        self.currentUser = currentUser
        self.currentUserID = 0001
        self.findPatient(patient_id: self.currentUserID) {(result, patient) in
            if result {
                self.currentPatient = patient
                completionHandler(true)
            }
            else {
                completionHandler(false)
            }
        }
        
        

    }
    
    func logout(){
        self.currentUserID = 0
        self.currentUser = User(user_id: 0, username: "", email: "", user_role: "", user_status: "", password: "", created_dt: "", last_login: "")
        self.currentPatient = Patient(patient_id: 0, member_id: "", patient_name: PatientName(first: "", middle: "", last: ""), name_suffix: "", name_title: "", gender: "", dob: "", email: "", patient_status: "", address: Address(address_1: "", address_2: "", city: "", state: "", zip: ""), phone: Phone(fax: "", home: "", mobile: "", work: ""), enroll_phase: "", consent_reason: "", kyc_id: "", loan_amount: "", modified_dt: "", opt_in: OptIn(agreed_timesheet: "", optin_data: "", optin_type: "", product_id: ""), ssn: "", status: "", insurance: Insurance(medical: MedicalInsurance(bin: "", effective_date: "", group_number: "", member_number: "", name: "", pcn: "", plan_type: ""), rx: RxInsurance(bin: "", effective_date: "", group_number: "", member_number: "", name: "", pcn: "", plan_type: "")), created_by_user_id: "", created_dt: "", enroll_dt: "", enrolled_by: "", modified_by_user_id: "")
    }
    
    func findPatient(patient_id: Int, completionHandler: @escaping (Bool, Patient?) -> Void) {
        //sample patient data
        let currentPatient = Patient(patient_id: 0001, member_id: "123", patient_name: PatientName(first: "John", middle: "S", last: "Doe"), name_suffix: "", name_title: "", gender: "M", dob: "03/11/76", email: "test@email.com", patient_status: "Active", address: Address(address_1: "100 Main St", address_2: "", city: "Boston", state: "MA", zip: "00000"), phone: Phone(fax: "9998881111", home: "9998881111", mobile: "9998881111", work: "9998881111"), enroll_phase: "", consent_reason: "", kyc_id: "", loan_amount: "15000", modified_dt: "02/22/24", opt_in: OptIn(agreed_timesheet: "", optin_data: "", optin_type: "", product_id: ""), ssn: "", status: "", insurance: Insurance(medical: MedicalInsurance(bin: "", effective_date: "", group_number: "", member_number: "", name: "", pcn: "", plan_type: ""), rx: RxInsurance(bin: "", effective_date: "", group_number: "", member_number: "", name: "", pcn: "", plan_type: "")), created_by_user_id: "", created_dt: "", enroll_dt: "", enrolled_by: "", modified_by_user_id: "")
        completionHandler(true, currentPatient)
        
    }
    
    
    func validLogin(userID: Int) async -> Bool {
        if userID != 0 {
            return true
        } else {
            return false
        }
    }
    
}


