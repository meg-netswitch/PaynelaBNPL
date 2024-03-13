//
//  LoginVM.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import Foundation
import LocalAuthentication

class LoginVM: ObservableObject {
    @Published var username = ""
    @Published var storedUsername = UserDefaults.standard.string(forKey: "USERNAME") ?? ""
    @Published var storedPassword = ""
    @Published var password = ""
    @Published var validLogin: Bool = false
    @Published var showAlert: Bool = false
    @Published var enableFaceID = false
    @Published var faceIDActive = UserDefaults.standard.string(forKey: "FACEID") ?? "false"
    @Published var storeNewPassword: Bool = false
    @Published var continueWithoutStoring: Bool = false
    @Published var loading = false
    

    let appModel = AppService.shared
    let userModel = UserService.shared

    func authenticateUser(username: String, password: String) {
        
        //check values are non-empty
        guard validateUser(username: username, password: password) else {
            return
        }
        
        //get stored keychain password
        getPasswordFromKeychain()
        
        //compare login, if new user prompt if they want to update stored login credentials
        if(((self.storedUsername == self.username) && (self.storedPassword == self.password)) || (self.enableFaceID == false)){
            loginWithoutUpdatingKeychain()
        } else {
            showAlert = true
        }
      
    }
    
    func loginWithoutUpdatingKeychain(){
        userModel.validateUser(username: username, withPassword: password) { result in
            if result {
                self.validLogin = true
                self.username = ""
                self.password = ""
                self.loading = false
            } else {
                self.loading = false
            }
        }
    }
    
    func loginUpdateKeychain(){
        userModel.validateUser(username: username, withPassword: password) { result in
            if result {
                if((self.enableFaceID == true) || (self.faceIDActive == "true")){
                    UserDefaults.standard.set(self.username, forKey: "USERNAME")
                    UserDefaults.standard.set("true", forKey: "FACEID")
                    self.faceIDActive = "true"
                    self.storedUsername = self.username
                    self.storedPassword = self.password
                    self.saveToKeychain()
                    
                } else {
                    self.loading = false
                }

                self.validLogin = true
                self.username = ""
                self.password = ""
                self.loading = false
            } else {
                self.loading = false
            }
        }
    }
    func validateUser(username: String, password: String) -> Bool{
        
        //check valid username and password
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            self.loading = false
            return false
        }
        
        //if valid credentials, send true
        return true
    }
    
  
    func faceIDAuthenticate() {
        let context = LAContext()
        var error: NSError?
        
        
        //if has biometrics
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "This is for sercurity") { success,
                authenticationError in
                //if face id was successful
                if success {
                    self.getPasswordFromKeychain()
                    //check valid username and password were sent (non-empty)
                    guard self.validateUser(username: self.storedUsername, password: self.storedPassword) else {
                        return
                    }
                    self.getPasswordFromKeychain()
                    //check credentials with database
                    self.userModel.validateUser(username: self.storedUsername, withPassword: self.storedPassword) { result in
                        //if valid username and password
                        if result {
                            self.validLogin = true
                        } else {
                        }
                    }
                    
                } else {
                    //not successful
                    self.loading = false
                }
            }
        } else {
            //does not have biometrics
            self.loading = false
        }
    }
    
    func saveToKeychain(){
        do {
            try KeychainManager.save(service: appModel.companyName, account: "\(appModel.companyName)Login", password: storedPassword.data(using: .utf8) ?? Data())
        } catch {
            self.loading = false
        }
    }
    
    func getPasswordFromKeychain() {
        do {
            let data = try KeychainManager.get(
                service: appModel.companyName,
                account: "\(appModel.companyName)Login"
            )
            self.storedPassword = String(decoding: data ?? Data(), as: UTF8.self)
        } catch {
            self.loading = false
        }
    }
}
