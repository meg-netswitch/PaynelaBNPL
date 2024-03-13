//
//  CommunicationsTable.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI


struct CommunicationsData {
    var communication_id: Int
    var date: String
    var subject: String
    var type: String

}
struct CommunicationsTable: View {
    /*
     in Communications Service, create a shared instance,
     then create var that holds array of communication data
     create VM for this view
     in VM get access to shared value
     foreach calls viewModel.shared.arrayOfData
     */
    let communicationData: [CommunicationsData] = [CommunicationsData(communication_id: 1, date: "02/12/24", subject: "Welcome Message", type: "Email: smith@company.com"), CommunicationsData(communication_id: 2, date: "02/12/24", subject: "Follow up Loan Approval", type: "Email: smith@company.com"), CommunicationsData(communication_id: 3, date: "02/12/24", subject: "Enquiry of Payment Schedule", type: "Email: smith@company.com"), CommunicationsData(communication_id: 4, date: "02/12/24", subject: "Important Membership Info", type: "Email: smith@company.com")]
    var body: some View {
        ScrollView {
            ForEach(communicationData, id: \.communication_id) { item in
                NavigationLink {
                    CommunicationsDetailView(communicationsDetail: item)
                } label: {
                    HStack {
                        Text(item.date)
                            .multilineTextAlignment(.leading)
                            .frame(width: 80)
                            .foregroundStyle(Color.black)
                        Text(item.subject)
                            .multilineTextAlignment(.leading)
                            .frame(width: 100)
                            .foregroundStyle(Color.black)
                            .foregroundStyle(Color.black)
                        Text(item.type)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: 200)
                            .foregroundStyle(Color.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(Color.black)
                    }
                    .padding()
                    .background(item.communication_id % 2 == 0 ? Color.white : Color.lightGray)
                }
                
            }
            
            
        }
    }
}

#Preview {
    CommunicationsTable()
}
