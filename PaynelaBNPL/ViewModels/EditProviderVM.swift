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
    @Published var state: String = ""
    @Published var zip: String = ""
    @Published var updateErr: Bool = false
    @Published var missingFields: Bool = false
    @Published var dismiss = false
    
    
    
    init() {
        firstName = userModel.currentProvider?.first_name ?? ""
        lastName = userModel.currentProvider?.last_name ?? ""
        address = userModel.currentProvider?.address.address_1 ?? ""
        city = userModel.currentProvider?.address.city ?? ""
        state = userModel.currentProvider?.address.state ?? ""
        zip = userModel.currentProvider?.address.zip ?? ""
    }
    
    func updateProvider(){
        print("UPDATING Provider...")
        guard (firstName != "" && lastName != "" && address != "" && city != "" && state != "" && zip != "") else {
            self.missingFields = true
            return
        }
        
        userModel.updateProvider(first_name: self.firstName, last_name: self.lastName, address: self.address, city: self.city, state: self.state, zip: self.zip){ (result, provider)  in
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
