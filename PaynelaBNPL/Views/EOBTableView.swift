//
//  EOBTableView.swift
//  TemplateApp
//
//  Created by meg- work on 3/13/24.
//

import SwiftUI

struct EOBTableView: View {
    @StateObject private var viewModel = EOBVM()
    
    var body: some View {
            if(viewModel.eobModel.eobList != nil){
                if(viewModel.eobModel.eobList!.count > 0){
                    List(viewModel.eobModel.eobList!, id: \.eob_id) { item in
                        HStack {
                            HStack{
                                Text("\(item.date)")
                                Spacer()
                            }
                            .frame(width: 80)
                            HStack{
                                Text("\(item.file_name)")
                                Spacer()
                            }
                            .frame(width: 120)
                            HStack{
                                Text("\(item.status)")
                                Spacer()
                            }
                            .frame(width: 120)
                            
                            Spacer()
                        }
                        .padding(.vertical)
                        .listRowBackground(item.id % 2 == 0 ? Color.white : Color.lightGray)
                    }
                    .listStyle(.inset)
                } else {
                    Text("no results")
                        .padding(.vertical, 30)
                    Spacer()
                }
            } else {
                ProgressView()
                    .padding()
                Spacer()
            }
        }
}

#Preview {
    EOBTableView()
}
