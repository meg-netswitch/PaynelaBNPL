//
//  RepaymentTable.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI


struct RepaymentTable: View {
    
    @StateObject private var viewModel = RepaymentsVM()
    
    var body: some View {
            ScrollView {
                if(viewModel.repaymentModel.repaymentData != nil){
                    ForEach(viewModel.repaymentModel.repaymentData!, id: \.repayment_id) { item in
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
}

#Preview {
    RepaymentTable()
}
