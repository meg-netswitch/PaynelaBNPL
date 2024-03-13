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
        HStack {
            HStack {
                Text("\(title)")
                    .multilineTextAlignment(.leading)
                    
                Spacer()
            }
            .frame(maxWidth: 100.0)
            Spacer()
            HStack{
                Spacer()
                Text("\(value)")
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.trailing)
                    
            }
            .frame(width: 150.0)
           
        }

    }
}

#Preview {
    WideCustomRow(title: "Name", value: "John Doe")
}
