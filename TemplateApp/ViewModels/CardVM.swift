//
//  CardVM.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import Foundation
import PassKit

class CardVM: ObservableObject {
    
    @Published var library: PKPassLibrary = PKPassLibrary()
    @Published var pass: PKPass?
    
    let userModel = UserService.shared
    let passModel = PassService.shared

    
    func getPass(){
        print("getting card..")
        
        let error: ErrorPointer = ErrorPointer(nilLiteral: ())
        guard self.passModel.passData != nil else { return }
        do {
            print("creating pass...")
            let pass = try PKPass(data: passModel.passData!)
            
            
            let passLibrary = PKPassLibrary()
            passLibrary.addPasses([pass]) { (status) in
                print(passLibrary.containsPass(pass))
            }
            self.passModel.pass = pass
        } catch {
            print("pass error")
        }
    }
}
