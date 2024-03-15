//
//  RepaymentsVM.swift
//  TemplateApp
//
//  Created by meg- work on 3/15/24.
//

import Foundation
class RepaymentsVM: ObservableObject {
    
    let repaymentModel = RepaymentsService.shared
    let userModel = UserService.shared
    
    init(){
        repaymentModel.getAllRepayments(patient_id: userModel.currentUserID){(result, repayment) in
            if result {
                //self.currentPatient = patient
            }
            else {
            }
        }
    }
}
