//
//  RepaymentDetailsView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct RepaymentDetailsView: View {
    let repaymentDetail: RepaymentData

    var body: some View {
        VStack {
            HStack {
                PageHeading(title: "Transaction Details")
                Spacer()
            }
            List{
                WideCustomRow(title: "Name", value: "John Doe")
                WideCustomRow(title: "Address", value: "100 Main Street Boston, MA")
                WideCustomRow(title: "Date", value: "\(repaymentDetail.date)")
                WideCustomRow(title: "Amount", value: "$\(repaymentDetail.amount)")
                WideCustomRow(title: "Balance", value: "$\(repaymentDetail.balance)")
                WideCustomRow(title: "Status", value: "\(repaymentDetail.status)")
            }
            
        }
    }
}

#Preview {
    RepaymentDetailsView(repaymentDetail: RepaymentData(repayment_id: 1, date: "02/10/24", amount: "200", status: "Accepted", balance: "1800"))
}
