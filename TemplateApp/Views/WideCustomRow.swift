//
//  WideCustomRow.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct WideCustomRow: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack {
            HStack {
                Text("\(title)")
                    .multilineTextAlignment(.leading)
                    
                Spacer()
            }
            .frame(maxWidth: 150.0)
            //Spacer()
            HStack{
                //Spacer()
                Text("\(value)")
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.trailing)
                Spacer()
                    
            }
            .frame(width: 150.0)
           
        }

    }
}

#Preview {
    WideCustomRow(title: "Name", value: "John Doe")
}
