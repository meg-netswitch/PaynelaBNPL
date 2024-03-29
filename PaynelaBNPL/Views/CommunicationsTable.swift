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
        if(viewModel.communicationModel.communicationList != nil){
            List(viewModel.communicationModel.communicationList!, id: \.communication_id) { item in
                NavigationLink {
                    CommunicationsDetailView(communicationsDetail: item)
                } label: {
                    HStack{
                        HStack{
                            Text("\(item.date)")
                            Spacer()
                        }
                        .frame(width: 80)
                        HStack{
                            Text("\(item.subject)")
                            
                            Spacer()
                        }
                        .frame(width: 120)
                        HStack{
                            Text("\(item.type)")
                        }
                        .frame(width: 120)
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
    CommunicationsTable()
}
