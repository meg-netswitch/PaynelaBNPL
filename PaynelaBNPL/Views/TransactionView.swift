//
//  TransactionView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct TransactionView: View {
    var body: some View {
            VStack {
                HStack{
                    PageHeading(title: "Transactions")
                    Spacer()
                }
                HStack {
                    HStack{
                        Text("Date")
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .frame(width: 70)
                    HStack{
                        Text("Amount")
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .frame(width: 85)
                    HStack{
                        Text("Status")
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .frame(width: 85)
                    HStack{
                        Text("Balance")
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .frame(width: 80)

                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.top, 10)
                TransactionTable()
            }
            
    }
 
}

#Preview {
    TransactionView()
}
