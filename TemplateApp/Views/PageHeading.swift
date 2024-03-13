//
//  PageHeading.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct PageHeading: View {
    let title: String

    var body: some View {
        HStack {
            Text("\(title)")
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .padding(.top, 30)
        .padding(.leading, 15)
        .padding(.trailing, 15)
        
    }
}

#Preview {
    PageHeading(title: "Heading")
}
