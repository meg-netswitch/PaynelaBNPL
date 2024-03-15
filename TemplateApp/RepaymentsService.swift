//
//  RepaymentsService.swift
//  TemplateApp
//
//  Created by meg- work on 3/15/24.
//

import Foundation

class RepaymentsService {
    static let shared = RepaymentsService()
    var repaymentData: [Repayment]?
    
    func getAllRepayments(patient_id: Int, completionHandler: @escaping (Bool, [Repayment?]) -> Void){
        
        //get repayments from data source
        let repaymentData: [Repayment] = [Repayment(repayment_id: 1, date: "01/01/24", amount: "200", status: "Approved", balance: "2000"), Repayment(repayment_id: 2, date: "02/01/24", amount: "200", status: "Approved", balance: "1800"), Repayment(repayment_id: 3, date: "03/01/24", amount: "200", status: "Approved", balance: "1600"), Repayment(repayment_id: 4, date: "04/01/24", amount: "200", status: "Approved", balance: "1400"), Repayment(repayment_id: 5, date: "05/01/24", amount: "200", status: "Approved", balance: "1200"), Repayment(repayment_id: 6, date: "06/01/24", amount: "200", status: "Approved", balance: "1000"), Repayment(repayment_id: 7, date: "07/01/24", amount: "200", status: "Approved", balance: "800"), Repayment(repayment_id: 8, date: "08/01/24", amount: "200", status: "Approved", balance: "600"), Repayment(repayment_id: 9, date: "09/01/24", amount: "200", status: "Approved", balance: "400"), Repayment(repayment_id: 10, date: "10/1/24", amount: "200", status: "Approved", balance: "200"), Repayment(repayment_id: 11, date: "11/1/24", amount: "200", status: "Approved", balance: "0")]
        
        self.repaymentData = repaymentData
        completionHandler(true, repaymentData)
    }
}
