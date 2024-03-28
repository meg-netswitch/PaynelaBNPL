//
//  CommunicationsView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct CommunicationsView: View {
    var body: some View {

        VStack {
            HStack{
                PageHeading(title: "Communications")
                Spacer()
            }
            HStack {
                HStack{
                    Text("Date")
                        .fontWeight(.semibold)
                    Spacer()
                }
                .frame(width: 80)
                HStack{
                    Text("Subject")
                        .fontWeight(.semibold)
                    Spacer()
                }
                .frame(width: 120)
                HStack{
                    Text("Type")
                        .fontWeight(.semibold)
                    Spacer()
                }
                .frame(width: 120)

                Spacer()
            }
            .padding(.leading, 20)
            .padding(.top, 10)
            CommunicationsTable()
        }
        
        
    }
}

#Preview {
    CommunicationsView()
}
