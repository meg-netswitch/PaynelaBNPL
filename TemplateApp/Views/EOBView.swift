//
//  EOBView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct EOBView: View {
    
    @State var uploadImage = false
    @State var uploadFromCamera = false
    @State var imageSelected = UIImage()
    
    var body: some View {
       
            VStack {
                PageHeading(title: "Upload EOB")
                HStack {
                    Button {
                        uploadImage = true
                        
                    } label: {
                        if (!uploadImage && !uploadFromCamera) {
                            VStack {
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundStyle(.black)
                                    .frame(height: 30)
                                Text("Photo Library")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black)
                                
                            }
                            .frame(width: 150, height: 100)
                            .background(Color.lightGray)
                            .cornerRadius(5)
                        }
                        
                    }
                    Button {
                        uploadFromCamera = true
                        
                    } label: {
                        if (!uploadImage && !uploadFromCamera) {
                            VStack {
                                Image(systemName: "camera")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundStyle(.black)
                                    .frame(height: 30)
                                Text("Camera")
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black)
                                
                            }
                            .frame(width: 150, height: 100)
                            .background(Color.lightGray)
                            .cornerRadius(5)
                        }
                        
                    }
                }
                ScrollView {
                    
                    Image(uiImage: imageSelected)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
            }
            
        .sheet(isPresented: $uploadImage) {
            ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
                .ignoresSafeArea()
        }
        .sheet(isPresented: $uploadFromCamera) {
            ImagePicker(selectedImage: $imageSelected, sourceType: .camera)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    EOBView()
}
