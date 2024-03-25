//
//  CommunicationsTable.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI



struct CommunicationsTable: View {

    @StateObject private var viewModel = CommunicationsVM()
    
    var body: some View {
        ScrollView {
            if(viewModel.communicationModel.communicationData != nil){
                ForEach(viewModel.communicationModel.communicationData!, id: \.communication_id) { item in
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
}

#Preview {
    CommunicationsTable()
}
