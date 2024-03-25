//
//  CommunicationsVM.swift
//  TemplateApp
//
//  Created by meg- work on 3/15/24.
//

import Foundation
class CommunicationsVM: ObservableObject {
    
    let communicationModel = CommunicationsService.shared
    let userModel = UserService.shared
    
    init(){
        communicationModel.getAllCommunications(patient_id: userModel.currentUserID){(result, communication) in
            if result {
                //self.currentPatient = patient
            }
            else {
            }
        }
            
        
    }
}
