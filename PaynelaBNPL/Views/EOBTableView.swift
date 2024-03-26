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
        ScrollView {
            if(viewModel.eobModel.eobList != nil){
                ForEach(viewModel.eobModel.eobList!, id: \.eob_id) { item in
                    HStack {
                        Text("\(item.date)")
                            .multilineTextAlignment(.leading)
                            .frame(width: 70)
                            .padding(.leading, 5)
                            .foregroundStyle(Color.black)
                        Text("\(item.file_name)")
                            .multilineTextAlignment(.leading)
                            .frame(width: 120)
                            .padding(.leading, 5)
                            .foregroundStyle(Color.black)
                        Text("\(item.status)")
                            .multilineTextAlignment(.leading)
                            .frame(width: 130)
                            .padding(.leading, 5)
                            .foregroundStyle(Color.black)
                       
                        Spacer()
                    }
                    .padding()
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .background(item.id % 2 == 0 ? Color.white : Color.lightGray)
                }
                
                
            }
            
        }
        
    }
    
}


#Preview {
    EOBTableView()
}
