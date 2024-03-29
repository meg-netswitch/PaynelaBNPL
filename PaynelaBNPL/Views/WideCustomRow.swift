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
            HStack{
                Text("\(value)")
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.trailing)
                Spacer()
            }
        }
    }
}

#Preview {
    WideCustomRow(title: "Name", value: "John Doe")
}
