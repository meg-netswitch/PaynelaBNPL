//
//  LoggedOutHeader.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct LoggedOutHeader: View {
    let appModel = AppService.shared
    var body: some View {
        VStack {
            Image("companyLogo")
                .padding(.vertical)
                .frame(width: 300, height: 100)
            Text("\(appModel.companySlogan)")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(appModel.backgroundLight ? .black : .white)
                .multilineTextAlignment(.center)
                
                
        }
        .padding(.bottom, 0)
        .padding(.top, 30)
        .padding(.bottom, 30)
    }
}

#Preview {
    LoggedOutHeader()
}
