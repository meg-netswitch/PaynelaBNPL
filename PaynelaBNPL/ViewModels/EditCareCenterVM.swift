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
    
    
    
    init() {
        /*
         practice = userModel.currentPatient?. ?? ""
         address = userModel.currentPatient?.address.address_1 ?? ""
         city = userModel.currentPatient?.address.city ?? ""
         state = userModel.currentPatient?.address.state ?? ""
         zip = userModel.currentPatient?.address.zip ?? ""
         phone = userModel.currentPatient?.phone.home ?? ""
         email = userModel.currentPatient?.email ?? ""
         */
    }
    
    func updateCareCenter(){
        print("UPDATING CARE CENTER...")
        
        userModel.updateCareCenter(practice: self.practice, address: self.address, city: self.city, state: self.state, zip: self.zip, phone: self.phone, email: self.email){ (result, patient)  in
            if result {
                print("UPDATE COMPLETE.")
                
                //dismiss view
                
                
                
            } else {
                //error updating
                self.updateErr = true
                
            }
        }
    }
}
