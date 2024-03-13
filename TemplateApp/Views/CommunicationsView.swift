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
                Text("Date")
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .frame(width: 80)
                Text("Subject")
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .frame(width: 110)
                Text("Type")
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .frame(width: 50)
                Text("")
                    .fontWeight(.semibold)
                    .frame(width: 20)
                Spacer()
            }
            .padding(.top, 20)
            CommunicationsTable()
        }
        
        
    }
}

#Preview {
    CommunicationsView()
}
