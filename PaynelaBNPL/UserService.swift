//
//  UserService.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import Foundation
import GraphQLSchema

class UserService {
    
    static let shared = UserService()
    
    var currentUserID: Int = 0
    var currentUser: User?
    var currentPatient: Patient?
    var currentProvider: Provider?
    var currentCareCenter: CareCenter?
    
    private init() {
        self.findProvider(provider_id: 0001) { (result, provider)  in
            if result {
                self.currentProvider = provider
            } else {
                //err
                
            }
        }
        self.findCareCenter(care_center_id: 0001) { (result, careCenter)  in
            if result {
                self.currentCareCenter = careCenter
            } else {
                //err
                
            }
        }
    }
    
    func validateUser(username: String, withPassword password: String, completionHandler: @escaping (Bool) -> Void) {
      
        // call the external service to validate the user and return the result
        Network.shared.apolloClient.fetch(query: UserloginQuery(username: username, password: password)) {
            result in
            switch result {
            case .success (let graphQLResult):
                DispatchQueue.main.async {
                   
                    if let response = graphQLResult.data?.userlogin {
                        let currentUser = User(user_id: response.user_id, username: response.username, email: response.email, user_role: response.user_role, user_status: response.user_status, password: response.password, created_dt: response.created_dt, last_login: response.last_login)
                        self.currentUser = currentUser
                        self.currentUserID = response.user_id
                        print(currentUser)
                        self.findPatient(patient_id: response.user_id) {(result, patient) in
                            if result {
                                self.currentPatient = patient
                                completionHandler(true)
                            }
                            else {
                                completionHandler(false)
                            }
                        }
                        

                    }
                    

                }
                
                
            case .failure(let error):
                print ("error: \(error)")
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
    
    
    func updatePatient(first_name: String, last_name: String, address: String, city: String, state: String, zip: String, phone: String, email: String, completionHandler: @escaping (Bool, Patient?) -> Void){
        let currentPatient = Patient(patient_id: 0001, member_id: "123", patient_name: PatientName(first: first_name, middle: "S", last: last_name), name_suffix: "", name_title: "", gender: "M", dob: "03/11/76", email: email, patient_status: "Active", address: Address(address_1: address, address_2: "", city: city, state: state, zip: zip), phone: Phone(fax: "9998881111", home: "9998881111", mobile: "9998881111", work: "9998881111"), enroll_phase: "", consent_reason: "", kyc_id: "", loan_amount: "15000", modified_dt: "02/22/24", opt_in: OptIn(agreed_timesheet: "", optin_data: "", optin_type: "", product_id: ""), ssn: "", status: "", insurance: Insurance(medical: MedicalInsurance(bin: "", effective_date: "", group_number: "", member_number: "", name: "", pcn: "", plan_type: ""), rx: RxInsurance(bin: "", effective_date: "", group_number: "", member_number: "", name: "", pcn: "", plan_type: "")), created_by_user_id: "", created_dt: "", enroll_dt: "", enrolled_by: "", modified_by_user_id: "")
        
        
        completionHandler(true, currentPatient)
        
    }
    
    func findCareCenter(care_center_id: Int, completionHandler: @escaping (Bool, CareCenter?) -> Void){
        let currentCareCenter = CareCenter(care_center_id: 0001, practice: "ABC Practice", address: Address(address_1: "100 Main St", address_2: "", city: "New York", state: "NY", zip: "00000"), phone: "8889990000", email: "abc@testEmail.com")
        completionHandler(true, currentCareCenter)
    }
    
    func updateCareCenter(practice: String, address: String, city: String, state: String, zip: String, phone: String, email: String, completionHandler: @escaping (Bool, CareCenter?) -> Void){
        
    }
    
    func findProvider(provider_id: Int, completionHandler: @escaping (Bool, Provider?) -> Void){
        let currentProvider = Provider(provider_id: 0001, first_name: "John", last_name: "Doe", address: Address(address_1: "100 Main St", address_2: "", city: "New York", state: "NY", zip: "00000"), phone: "8889990000")
        completionHandler(true, currentProvider)
    }
    
    func updateProvider(first_name: String, last_name: String, address: String, city: String, state: String, zip: String, completionHandler: @escaping (Bool, Provider?) -> Void){
        
    }
    
    
    func validLogin(userID: Int) async -> Bool {
        if userID != 0 {
            return true
        } else {
            return false
        }
    }
    
    func registerNewUser(firstname: String, lastname: String, selectedDate: Date, ssn: String, completionHandler: @escaping (Bool) -> Void) {
        
        //call graphql mutation
        //return true/false
       
        
    }
    
}


