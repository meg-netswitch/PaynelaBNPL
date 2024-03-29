//
//  RegisterVM.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import Foundation

class RegisterVM: ObservableObject {
    @Published var firstname = ""
    @Published var lastname = ""
    @Published var dob = ""
    @Published var ssn = ""
    @Published var selectedDate = Date()
    @Published var loading = false
    @Published var registerErr = false
    @Published var errMsg = "Regiser error."
    
    let appModel = AppService.shared
    let userModel = UserService.shared
    

    func register(firstname: String, lastname: String, selectedDate: Date, ssn: String){
        guard (firstname != "" && lastname != "" && ssn != "") else {
            print("register user values are empty")
            registerError(errReason: "Missing fields.")
            return
        }
        let dob = selectedDate.formatted(date: .numeric, time: .omitted)
        print(firstname, lastname, dob, ssn)
        userModel.registerNewUser(firstname: firstname, lastname: lastname, selectedDate: dob, ssn: ssn) { result in
            if result {
                self.registerSuccess()
            } else {
                self.registerError(errReason: "Error registering. Try again.")
            }
        }
        
        
    }
    
    func registerSuccess(){
        self.firstname = ""
        self.lastname = ""
        self.selectedDate = Date()
        self.ssn = ""
        self.loading = false
    }
    func registerError(errReason: String){
        self.loading = false
        self.registerErr = true
        self.errMsg = errReason
    }
}
