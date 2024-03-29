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
                if(viewModel.transactionModel.transactionList != nil){
                    List(viewModel.transactionModel.transactionList!, id: \.transaction_id) { item in
                        NavigationLink {
                            TransactionDetailsView(transactionDetail: item)
                        } label: {
                            HStack {
                                HStack{
                                    Text(item.date)
                                        .foregroundStyle(Color.black)
                                    Spacer()
                                }
                                .frame(width: 80)
                                HStack{
                                    Text("$\(item.amount)")
                                    Spacer()
                                }
                                .frame(width: 80)
                                HStack{
                                    Text(item.status)
                                    //Spacer()
                                }
                                .frame(width: 80)
                                HStack{
                                    Text("$\(item.balance)")
                                }
                                .frame(width: 80)
                                Spacer()
                            }
                            
                            
                        }
                        .padding(.vertical)
                        .listRowBackground(item.id % 2 == 0 ? Color.white : Color.lightGray)
                    }
                    .listStyle(.inset)
                } else {
                    Spacer()
                }
        
    }
}
#Preview {
    TransactionTable()
}
