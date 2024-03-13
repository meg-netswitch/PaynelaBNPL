//
//  CommunicationsDetailView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct CommunicationsDetailView: View {
    let communicationsDetail: CommunicationsData
    var body: some View {
       ScrollView {
            HStack{
                VStack(alignment: .leading){
                    Text("\(communicationsDetail.subject)")
                    Text("\(communicationsDetail.type)")
                    Text("\(communicationsDetail.date)")
                }
                Spacer()
            }
            .padding()
           Rectangle()
               .foregroundStyle(.lightGray)
               .frame(height: 600)
               .cornerRadius(5)
        }
       .padding()
        
    }
}

#Preview {
    CommunicationsDetailView(communicationsDetail: CommunicationsData(communication_id: 1, date: "02/10/24", subject: "Welcome Message", type: "Email: smith@company.com"))
}
