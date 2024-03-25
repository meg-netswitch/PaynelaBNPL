//
//  EditProviderVM.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import Foundation
class EditProviderVM: ObservableObject {
    
    let userModel = UserService.shared
    let appModel = AppService.shared
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var address: String = ""
    @Published var city: String = ""
    @Published var state: String = "RI"
    @Published var zip: String = ""

    @Published var updateErr: Bool = false
    
    
    
    init() {
        /*
         firstName = userModel.currentPatient?.patient_name.first ?? ""
         lastName = userModel.currentPatient?.patient_name.last ?? ""
         address = userModel.currentPatient?.address.address_1 ?? ""
         city = userModel.currentPatient?.address.city ?? ""
         state = userModel.currentPatient?.address.state ?? ""
         zip = userModel.currentPatient?.address.zip ?? ""

         */
    }
    
    func updateProvider(){
        print("UPDATING Provider...")
        
        userModel.updateProvider(first_name: self.firstName, last_name: self.lastName, address: self.address, city: self.city, state: self.state, zip: self.zip){ (result, provider)  in
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
