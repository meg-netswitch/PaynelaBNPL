//
//  EOBVM.swift
//  TemplateApp
//
//  Created by meg- work on 3/15/24.
//

import Foundation
class EOBVM: ObservableObject {

    let eobModel = EOBService.shared
    let userModel = UserService.shared
    
    init(){
        eobModel.getAllEOB(patient_id: userModel.currentUserID){(result, eob) in
            if result {
                
            } else {
                
            }
        }
    }
    
}
