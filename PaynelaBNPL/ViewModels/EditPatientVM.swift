//
//  EditPatientVM.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import Foundation
import SwiftUI

class EditPatientVM: ObservableObject {
    
    let userModel = UserService.shared
    let appModel = AppService.shared
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var address: String = ""
    @Published var city: String = ""
    @Published var state: String = ""
    @Published var zip: String = ""
    @Published var phone: String = ""
    @Published var email: String = ""
    @Published var updateErr: Bool = false
    @Published var missingFields: Bool = false
    @Published var dismiss = false

    
    init() {
        firstName = userModel.currentPatient?.patient_name.first ?? ""
        lastName = userModel.currentPatient?.patient_name.last ?? ""
        address = userModel.currentPatient?.address.address_1 ?? ""
        city = userModel.currentPatient?.address.city ?? ""
        state = userModel.currentPatient?.address.state ?? ""
        zip = userModel.currentPatient?.address.zip ?? ""
        phone = userModel.currentPatient?.phone.home ?? ""
        email = userModel.currentPatient?.email ?? ""
    }
    
    func updatePatient(){
        print("UPDATING PATIENT INFO...")
        guard (firstName != "" && lastName != "" && address != "" && city != "" && state != "" && zip != "" && phone != "" && email != "") else {
            self.missingFields = true
            return
        }
        
        userModel.updatePatient(first_name: self.firstName, last_name: self.lastName, address: self.address, city: self.city, state: self.state, zip: self.zip, phone: self.phone, email: self.email){ (result, patient)  in
            if result {
                print("UPDATE COMPLETE.")
                self.dismiss = true
            } else {
                //error updating
                self.updateErr = true
            }
        }
    }
}
