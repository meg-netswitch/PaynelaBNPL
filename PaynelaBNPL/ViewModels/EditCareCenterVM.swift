//
//  EditCareCenterVM.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import Foundation
class EditCareCenterVM: ObservableObject {
    
    let userModel = UserService.shared
    let appModel = AppService.shared
    
    @Published var practice: String = ""
    @Published var address: String = ""
    @Published var city: String = ""
    @Published var state: String = "NJ"
    @Published var zip: String = ""
    @Published var phone: String = ""
    @Published var email: String = ""
    @Published var updateErr: Bool = false
    @Published var missingFields: Bool = false
    @Published var dismiss = false
    
    
    init() {
        practice = userModel.currentCareCenter?.practice ?? ""
        address = userModel.currentCareCenter?.address.address_1 ?? ""
        city = userModel.currentCareCenter?.address.city ?? ""
        state = userModel.currentCareCenter?.address.state ?? ""
        zip = userModel.currentCareCenter?.address.zip ?? ""
        phone = userModel.currentCareCenter?.phone ?? ""
        email = userModel.currentCareCenter?.email ?? ""
    }
    
    func updateCareCenter(){
        print("UPDATING CARE CENTER...")
        guard (practice != "" && address != "" && city != "" && state != "" && zip != "" && phone != "" && email != "") else {
            self.missingFields = true
            return
        }
        
        userModel.updateCareCenter(practice: self.practice, address: self.address, city: self.city, state: self.state, zip: self.zip, phone: self.phone, email: self.email){ (result, patient)  in
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
