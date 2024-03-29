//
//  TransacitonsService.swift
//  TemplateApp
//
//  Created by meg- work on 3/15/24.
//

import Foundation

class TransactionsService {
    static let shared = TransactionsService()
    var transactionList: [Transaction]?
    
    func getAllTransactions(patient_id: Int, completionHandler: @escaping (Bool, [Transaction?]) -> Void){
        
        //get transactions from data source
        let transactionData: [Transaction] = [Transaction(id: 1, transaction_id: 1, date: "01/01/24", amount: "200", status: "Approved", balance: "2000"), Transaction(id: 2, transaction_id: 2, date: "02/01/24", amount: "200", status: "Approved", balance: "1800"), Transaction(id: 3, transaction_id: 3, date: "03/01/24", amount: "200", status: "Approved", balance: "1600"), Transaction(id: 4, transaction_id: 4, date: "04/01/24", amount: "200", status: "Approved", balance: "1400"), Transaction(id: 5, transaction_id: 5, date: "05/01/24", amount: "200", status: "Approved", balance: "1200"), Transaction(id: 6, transaction_id: 6, date: "06/01/24", amount: "200", status: "Approved", balance: "1000"), Transaction(id: 7, transaction_id: 7, date: "07/01/24", amount: "200", status: "Approved", balance: "800"), Transaction(id: 8, transaction_id: 8, date: "08/01/24", amount: "200", status: "Approved", balance: "600"), Transaction(id: 9, transaction_id: 9, date: "09/01/24", amount: "200", status: "Approved", balance: "400"), Transaction(id: 10, transaction_id: 10, date: "10/1/24", amount: "200", status: "Approved", balance: "200"), Transaction(id: 11, transaction_id: 11, date: "11/1/24", amount: "200", status: "Approved", balance: "0")]
        
        self.transactionList = transactionData
        completionHandler(true, transactionData)
        /*
        Network.shared.apolloClient.fetch(query: TransactionFindQuery(patient_id: patient_id)) {
            result in
            switch result {
            case .success (let graphQLResult):
                DispatchQueue.main.async {
                    if let response = graphQLResult.data?.transactionfind {
                        var transactionData : [Transaction] = []
                        var id = 0
                        for transaction in response {
                            id += 1
                            var date = transaction?.generated_dt ?? ""
                            let char = Array(date)
                            let transactionDate = "\(char[5])\(char[6])/\(char[8])\(char[9])/\(char[2])\(char[3])"
                            let transaction = Transaction(id: id, transaction_id: transaction.transaction_id, date: transactionDate, amount: transaction.amount, status: transaction.status, balance: transaction.balance)
                            transactionData.append(transaction)
                        }
                        self.transactionList = transactionData
                        completionHandler(true, transactionData)
                    }
                }
            case .failure(let error):
                print ("error: \(error)")
                completionHandler(false, self.transactionList!)
            }
        }
        */
    }
}
