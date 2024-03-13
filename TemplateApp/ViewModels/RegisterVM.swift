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
    
    let appModel = AppService.shared
    

    func register(firstname: String, lastname: String, selectedDate: Date, ssn: String){
        
        let dob = selectedDate.formatted(date: .numeric, time: .omitted)
        print(firstname, lastname, dob, ssn)
    }
   
}
