//
//  TransactionDetailsView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct TransactionDetailsView: View {
    let transactionDetail: Transaction

    var body: some View {
        VStack {
            HStack {
                PageHeading(title: "Transaction Details")
                Spacer()
            }
            List{
                WideCustomRow(title: "Name", value: "John Doe")
                WideCustomRow(title: "Address", value: "100 Main Street Boston, MA")
                WideCustomRow(title: "Date", value: "\(transactionDetail.date)")
                WideCustomRow(title: "Amount", value: "$\(transactionDetail.amount)")
                WideCustomRow(title: "Balance", value: "$\(transactionDetail.balance)")
                WideCustomRow(title: "Status", value: "\(transactionDetail.status)")
            }
            
        }
    }
}

#Preview {
    TransactionDetailsView(transactionDetail: Transaction(transaction_id: 1, date: "02/10/24", amount: "200", status: "Accepted", balance: "1800"))
}
