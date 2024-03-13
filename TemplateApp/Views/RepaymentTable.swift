//
//  RepaymentTable.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct RepaymentData {
    var repayment_id: Int
    var date: String
    var amount: String
    var status: String
    var balance: String

}
struct RepaymentTable: View {
    /*
     in Repayment Service, create a shared instance,
     then create var that holds array of repayment data
     create VM for this view
     in VM get access to shared value
     foreach calls viewModel.shared.arrayOfData
     */
    let repaymentData: [RepaymentData] = [RepaymentData(repayment_id: 1, date: "01/01/24", amount: "200", status: "Approved", balance: "2000"), RepaymentData(repayment_id: 2, date: "02/01/24", amount: "200", status: "Approved", balance: "1800"), RepaymentData(repayment_id: 3, date: "03/01/24", amount: "200", status: "Approved", balance: "1600"), RepaymentData(repayment_id: 4, date: "04/01/24", amount: "200", status: "Approved", balance: "1400"), RepaymentData(repayment_id: 5, date: "05/01/24", amount: "200", status: "Approved", balance: "1200"), RepaymentData(repayment_id: 6, date: "06/01/24", amount: "200", status: "Approved", balance: "1000"), RepaymentData(repayment_id: 7, date: "07/01/24", amount: "200", status: "Approved", balance: "800"), RepaymentData(repayment_id: 8, date: "08/01/24", amount: "200", status: "Approved", balance: "600"), RepaymentData(repayment_id: 9, date: "09/01/24", amount: "200", status: "Approved", balance: "400"), RepaymentData(repayment_id: 10, date: "10/1/24", amount: "200", status: "Approved", balance: "200"), RepaymentData(repayment_id: 11, date: "11/1/24", amount: "200", status: "Approved", balance: "0")]
    var body: some View {
            ScrollView {
                ForEach(repaymentData, id: \.repayment_id) { item in
                    NavigationLink {
                        RepaymentDetailsView(repaymentDetail: item)
                    } label: {
                        HStack {
                            Text(item.date)
                                .multilineTextAlignment(.leading)
                                .frame(width: 70)
                                .padding(.leading, 5)
                                .foregroundStyle(Color.black)
                            Text("$\(item.amount).00")
                                .multilineTextAlignment(.leading)
                                .frame(width: 80)
                                .padding(.leading, 5)
                                .foregroundStyle(Color.black)
                            Text(item.status)
                                .multilineTextAlignment(.leading)
                                .frame(width: 80)
                                .padding(.leading, 5)
                                .foregroundStyle(Color.black)
                            Text("$\(item.balance).00")
                                .multilineTextAlignment(.leading)
                                .frame(width: 80)
                                .padding(.leading, 5)
                                .foregroundStyle(Color.black)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color.black)
                                .padding(.trailing, 5)
                        }
                        .padding()
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        .background(item.repayment_id % 2 == 0 ? Color.white : Color.lightGray)
                        
                    }

                    
                }
                
                
            
        }
        
        
    }
}

#Preview {
    RepaymentTable()
}
