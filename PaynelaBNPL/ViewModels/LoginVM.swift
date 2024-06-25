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
    @Published var invalidCredentials = false
    

    let appModel = AppService.shared
    let userModel = UserService.shared

    func authenticateUser(username: String, password: String) {
        print("authenticate user")
        
        self.invalidCredentials = false
        self.showAlert = false
        
        //check values are non-empty
        guard validateUser(username: username, password: password) else {
            return
        }
        
        print("get stored password")
        //get stored keychain password
        getPasswordFromKeychain()
        
        print("compare stored credentials")
        //compare login, if new user prompt if they want to update stored login credentials
        if(((self.storedUsername == self.username) && (self.storedPassword == self.password)) || (self.enableFaceID == false)){
            loginWithoutUpdatingKeychain()
        } else {
            print("show update credentials alert")
            self.showAlert = true
        }
      
    }
    
    func loginWithoutUpdatingKeychain(){
        userModel.validateUser(username: username, withPassword: password) { result in
            print(result)
            if result {
                self.validLogin = true
                self.username = ""
                self.password = ""
                self.loading = false
            } else {
                self.invalidLogin()
            }
        }
    }
    
    func loginUpdateKeychain(){
        print("update keychain")
        userModel.validateUser(username: username, withPassword: password) { result in
            if result {
                print(result)
                if((self.enableFaceID == true) || (self.faceIDActive == "true")){
                    UserDefaults.standard.set(self.username, forKey: "USERNAME")
                    UserDefaults.standard.set("true", forKey: "FACEID")
                    self.faceIDActive = "true"
                    self.storedUsername = self.username
                    self.storedPassword = self.password
                    self.saveToKeychain()
                    
                } else {
                    self.invalidLogin()
                }

                self.validLogin = true
                self.username = ""
                self.password = ""
                self.loading = false
            } else {
                print("error")
                self.invalidLogin()
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
                        print("check stored values are non-empty")
                        return
                    }
                    self.getPasswordFromKeychain()
                    //check credentials with database
                    self.userModel.validateUser(username: self.storedUsername, withPassword: self.storedPassword) { result in
                        //if valid username and password
                        if result {
                            print("valid face id login")
                            self.validLogin = true
                        } else {
                            print("invalid face id login")
                        }
                    }
                    
                } else {
                    //not successful
                    print("faceid not successful")
                    self.invalidLogin()
                }
            }
        } else {
            //does not have biometrics
            print("does not have biometrics")
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
            print("get password from keychain")
            let data = try KeychainManager.get(
                service: appModel.companyName,
                account: "\(appModel.companyName)Login"
            )
            self.storedPassword = String(decoding: data ?? Data(), as: UTF8.self)
        } catch {
            print("err getting password from keychain")
            self.loading = false
        }
    }
    
    func invalidLogin(){
        self.username = ""
        self.password = ""
        self.loading = false
        self.invalidCredentials = true
        self.showAlert = true
    }
    
    
    
}
