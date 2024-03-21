//
//  RepaymentTable.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct TransactionTable: View {
    
    @StateObject private var viewModel = TransactionsVM()
    
    var body: some View {
            ScrollView {
                if(viewModel.transactionModel.transactionData != nil){
                    ForEach(viewModel.transactionModel.transactionData!, id: \.transaction_id) { item in
                        NavigationLink {
                            TransactionDetailsView(transactionDetail: item)
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
                            .background(item.transaction_id % 2 == 0 ? Color.white : Color.lightGray)
                            
                        }

                        
                    }
                }
                
                
                
            
        }
        
        
    }
}
#Preview {
    TransactionTable()
}
