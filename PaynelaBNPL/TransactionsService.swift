//
//  TransacitonsService.swift
//  TemplateApp
//
//  Created by meg- work on 3/15/24.
//

import Foundation

class TransactionsService {
    static let shared = TransactionsService()
    var transactionData: [Transaction]?
    
    func getAllTransactions(patient_id: Int, completionHandler: @escaping (Bool, [Transaction?]) -> Void){
        
        //get transactions from data source
        let transactionData: [Transaction] = [Transaction(transaction_id: 1, date: "01/01/24", amount: "200", status: "Approved", balance: "2000"), Transaction(transaction_id: 2, date: "02/01/24", amount: "200", status: "Approved", balance: "1800"), Transaction(transaction_id: 3, date: "03/01/24", amount: "200", status: "Approved", balance: "1600"), Transaction(transaction_id: 4, date: "04/01/24", amount: "200", status: "Approved", balance: "1400"), Transaction(transaction_id: 5, date: "05/01/24", amount: "200", status: "Approved", balance: "1200"), Transaction(transaction_id: 6, date: "06/01/24", amount: "200", status: "Approved", balance: "1000"), Transaction(transaction_id: 7, date: "07/01/24", amount: "200", status: "Approved", balance: "800"), Transaction(transaction_id: 8, date: "08/01/24", amount: "200", status: "Approved", balance: "600"), Transaction(transaction_id: 9, date: "09/01/24", amount: "200", status: "Approved", balance: "400"), Transaction(transaction_id: 10, date: "10/1/24", amount: "200", status: "Approved", balance: "200"), Transaction(transaction_id: 11, date: "11/1/24", amount: "200", status: "Approved", balance: "0")]
        
        self.transactionData = transactionData
        completionHandler(true, transactionData)
    }
}
