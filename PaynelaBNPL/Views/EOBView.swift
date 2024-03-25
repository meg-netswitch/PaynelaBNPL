//
//  EOBView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct EOBView: View {
    @StateObject private var viewModel = EOBVM()
    @State var uploadImageClick = false
    @State var uploadImage = false
    @State var uploadFromPhotos = false
    @State var uploadFromCamera = false
    @State var showCameraSheet = false
    @State var imageSelected = UIImage()
    
    var body: some View {
        VStack {
            HStack {
                PageHeading(title: "EOB")
                Spacer()
            }
            HStack {
                Text("Date")
                    .multilineTextAlignment(.leading)
                    .frame(width: 100)
                    .padding(.leading, 5)
                    .foregroundStyle(Color.black)
                Text("File Name")
                    .multilineTextAlignment(.leading)
                    .frame(width: 100)
                    .padding(.leading, 5)
                    .foregroundStyle(Color.black)
                Text("Status")
                    .multilineTextAlignment(.leading)
                    .frame(width: 100)
                    .padding(.leading, 5)
                    .foregroundStyle(Color.black)
                Spacer()
            }
            .padding()
            .padding(.top, 10)
            .background(.white)
            EOBTableView()
        }
    }
}
        
#Preview {
    EOBView()
}
