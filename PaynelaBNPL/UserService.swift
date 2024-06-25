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
    let statesArr: [StateInfo] = [StateInfo(abbr: "AL", name: "Alabama"), StateInfo(abbr: "AK", name: "Alaska"), StateInfo(abbr: "AZ", name: "Arizona"), StateInfo(abbr: "AR", name: "Arkansas"), StateInfo(abbr: "CA", name: "California"), StateInfo(abbr: "CO", name: "Colorado"), StateInfo(abbr: "CT", name: "Connecticut"), StateInfo(abbr: "DE", name: "Delaware"), StateInfo(abbr: "FL", name: "Florida"), StateInfo(abbr: "GA", name: "Georgia"), StateInfo(abbr: "HI", name: "Hawaii"), StateInfo(abbr: "ID", name: "Idaho"), StateInfo(abbr: "IL", name: "Illinois"), StateInfo(abbr: "IN", name: "Indiana"), StateInfo(abbr: "IA", name: "Iowa"), StateInfo(abbr: "KS", name: "Kansas"), StateInfo(abbr: "KY", name: "Kentucky"), StateInfo(abbr: "LA", name: "Louisiana"), StateInfo(abbr: "ME", name: "Maine"), StateInfo(abbr: "MD", name: "Maryland"), StateInfo(abbr: "MA", name: "Massachusetts"), StateInfo(abbr: "MI", name: "Michigan"), StateInfo(abbr: "MN", name: "Minnesota"), StateInfo(abbr: "MS", name: "Mississippi"), StateInfo(abbr: "MO", name: "Missouri"), StateInfo(abbr: "MT", name: "Montana"), StateInfo(abbr: "NE", name: "Nebraska"), StateInfo(abbr: "NV", name: "Nevada"), StateInfo(abbr: "NH", name: "New Hampshire"), StateInfo(abbr: "NJ", name: "New Jersey"), StateInfo(abbr: "NM", name: "New Mexico"), StateInfo(abbr: "NY", name: "New York"), StateInfo(abbr: "NC", name: "North Carolina"), StateInfo(abbr: "ND", name: "North Dakota"), StateInfo(abbr: "OH", name: "Ohio"), StateInfo(abbr: "OK", name: "Oklahoma"), StateInfo(abbr: "OR", name: "Oregon"), StateInfo(abbr: "PA", name: "Pennsylvania"), StateInfo(abbr: "RI", name: "Rhode Island"), StateInfo(abbr: "SC", name: "South Carolina"), StateInfo(abbr: "SD", name: "South Dakota"), StateInfo(abbr: "TN", name: "Tennessee"), StateInfo(abbr: "TX", name: "Texas"), StateInfo(abbr: "UT", name: "Utah"), StateInfo(abbr: "VT", name: "Vermont"), StateInfo(abbr: "VA", name: "Virginia"), StateInfo(abbr: "WA", name: "Washington"), StateInfo(abbr: "WV", name: "West Virginia"), StateInfo(abbr: "WI", name: "Wisconsin"), StateInfo(abbr: "WY", name: "Wyoming")]
    
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
      
        print("validate user")
        // call the external service to validate the user and return the result
        Network.shared.apolloClient.fetch(query: UserloginQuery(username: username, password: password)) {
            result in
            switch result {
            case .success (let graphQLResult):
                DispatchQueue.main.async {
                   
                    if let response = graphQLResult.data?.userlogin {
                        print(response)
                        let currentUser = User(user_id: response.user_id, username: response.username ?? "", email: response.email ?? "", user_role: response.user_role ?? "", user_status: response.user_status ?? "", password: response.password ?? "", created_dt: response.created_dt ?? "", last_login: response.last_login ?? "")
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
                        
                        
                    } else {
                        completionHandler(false)
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
        Network.shared.apolloClient.fetch(query: PatientFindQuery(patient_id: patient_id)) {
            result in
            switch result {
            case .success (let graphQLResult):
                DispatchQueue.main.async {
                    if let response = graphQLResult.data?.patientfind {
                        
                        let currentPatient = Patient(patient_id: response.patient_id, member_id: response.member_id, patient_name: PatientName(first: response.patient_name.first ?? "", middle: response.patient_name.middle ?? "", last: response.patient_name.last ?? ""), name_suffix: response.name_title, name_title: response.name_title, gender: response.gender, dob: response.dob, email: response.email, patient_status: response.patient_status, address: Address(address_1: response.address.address_1 ?? "", address_2: response.address.address_2 ?? "", city: response.address.city ?? "", state: response.address.state ?? "", zip: response.address.zip ?? ""), phone: Phone(fax: response.phone.fax ?? "", home: response.phone.home ?? "", mobile: response.phone.mobile ?? "", work: response.phone.work ?? ""), enroll_phase: response.enroll_phase, consent_reason: response.consent_reason, kyc_id: response.kyc_id, loan_amount: response.loan_amount, modified_dt: response.modified_dt, opt_in: OptIn(agreed_timesheet: response.opt_in[0]?.agreed_timesheet ?? "", optin_data: response.opt_in[0]!.optin_data ?? "", optin_type: response.opt_in[0]?.optin_type ?? "", product_id: response.opt_in[0]?.product_id ?? ""), ssn: response.ssn, status: response.status, insurance: Insurance(medical: MedicalInsurance(bin: response.insurance.medical?.bin ?? "", effective_date: response.insurance.medical?.effective_date ?? "", group_number: response.insurance.medical?.group_number ?? "", member_number: response.insurance.medical?.member_number ?? "", name: response.insurance.medical?.name ?? "", pcn: response.insurance.medical?.pcn ?? "", plan_type: response.insurance.medical?.plan_type ?? ""), rx: RxInsurance(bin: response.insurance.rx?.bin ?? "", effective_date: response.insurance.rx?.effective_date ?? "", group_number: response.insurance.rx?.group_number ?? "", member_number: response.insurance.rx?.member_number ?? "", name: response.insurance.rx?.name ?? "", pcn: response.insurance.rx?.pcn ?? "", plan_type: response.insurance.rx?.plan_type ?? "")), created_by_user_id: response.created_by_user_id, created_dt: response.created_dt ?? "", enroll_dt: response.enroll_dt, enrolled_by: response.enrolled_by, modified_by_user_id: response.modified_by_user_id)
                         
                        /*
                        let currentPatient: Patient = Patient(patient_id: 0, member_id: "", patient_name: PatientName(first: "", middle: "", last: ""), name_suffix: "", name_title: "", gender: "", dob: "", email: "", patient_status: "", address: Address(address_1: "", address_2: "", city: "", state: "", zip: ""), phone: Phone(fax: "", home: "", mobile: "", work: ""), enroll_phase: "", consent_reason: "", kyc_id: "", loan_amount: "", modified_dt: "", opt_in: OptIn(agreed_timesheet: "", optin_data: "", optin_type: "", product_id: ""), ssn: "", status: "", insurance: Insurance(medical: MedicalInsurance(bin: "", effective_date: "", group_number: "", member_number: "", name: "", pcn: "", plan_type: ""), rx: RxInsurance(bin: "", effective_date: "", group_number: "", member_number: "", name: "", pcn: "", plan_type: "")), created_by_user_id: "", created_dt: "", enroll_dt: "", enrolled_by: "", modified_by_user_id: "")*/
                        completionHandler(true, currentPatient)
                    }
                }
            case .failure(let error):
                print ("error: \(error)")
                completionHandler(false, self.currentPatient)
                
            }
         
        }
        
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
        completionHandler(true, currentCareCenter)
        
    }
    
    func findProvider(provider_id: Int, completionHandler: @escaping (Bool, Provider?) -> Void){
        let currentProvider = Provider(provider_id: 0001, first_name: "John", last_name: "Doe", address: Address(address_1: "100 Main St", address_2: "", city: "New York", state: "NY", zip: "00000"), phone: "8889990000")
        completionHandler(true, currentProvider)
    }
    
    func updateProvider(first_name: String, last_name: String, address: String, city: String, state: String, zip: String, completionHandler: @escaping (Bool, Provider?) -> Void){
        completionHandler(true, currentProvider)
    }
    
    
    func validLogin(userID: Int) async -> Bool {
        if userID != 0 {
            return true
        } else {
            return false
        }
    }
    
    func registerNewUser(firstname: String, lastname: String, selectedDate: String, ssn: String, completionHandler: @escaping (Bool) -> Void) {
        
        //call graphql mutation
        //return true/false

        completionHandler(true)
        /*
        
        Network.shared.apolloClient.fetch(query: RegisterPatientQuery(first_name: firstname, last_name: lastname, dob: selectedDate, ssn: ssn)) {
            result in
            switch result {
            case .success (let graphQLResult):
                DispatchQueue.main.async {
                    if let response = graphQLResult.data?.registerpatient {
                        
                        completionHandler(true)
                    }
                }
            case .failure(let error):
                print ("error: \(error)")
                //returning false shows error message
                completionHandler(false)
            }
        }
        */
    }
    
}
