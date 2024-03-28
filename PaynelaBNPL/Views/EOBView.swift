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
                HStack{
                    Text("Date")
                        .fontWeight(.semibold)
                    Spacer()
                }
                .frame(width: 80)
                HStack{
                    Text("File Name")
                        .fontWeight(.semibold)
                    Spacer()
                }
                .frame(width: 120)
                HStack{
                    Text("Status")
                        .fontWeight(.semibold)
                    Spacer()
                }
                .frame(width: 120)
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.top, 10)
            EOBTableView()
        }
    }
}
        
#Preview {
    EOBView()
}
