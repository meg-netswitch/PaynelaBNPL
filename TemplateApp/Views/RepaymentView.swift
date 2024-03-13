//
//  RepaymentView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct RepaymentView: View {
    var body: some View {
            VStack {
                HStack{
                    PageHeading(title: "Repayments")
                    Spacer()
                }
                HStack {
                    Text("Date")
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .frame(width: 50)
                    Text("Amount")
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .frame(width: 70)
                        .padding(.leading, 30)
                    Text("Status")
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .frame(width: 60)
                        .padding(.leading, 10)
                    Text("Balance")
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .frame(width: 70)
                        .padding(.leading, 25)
                    Text("")
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .frame(width: 20)
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.top, 10)
                RepaymentTable()
            }
            
    }
 
}

#Preview {
    RepaymentView()
}
