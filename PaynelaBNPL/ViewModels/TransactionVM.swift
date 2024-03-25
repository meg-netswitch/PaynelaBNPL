//
//  RepaymentsVM.swift
//  TemplateApp
//
//  Created by meg- work on 3/15/24.
//

import Foundation
class TransactionsVM: ObservableObject {
    
    let transactionModel = TransactionsService.shared
    let userModel = UserService.shared
    
    init(){
        transactionModel.getAllTransactions(patient_id: userModel.currentUserID){(result, transaction) in
            if result {
                //self.currentPatient = patient
            }
            else {
            }
        }
    }
}
