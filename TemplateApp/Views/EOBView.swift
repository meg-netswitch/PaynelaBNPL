//
//  EOBView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct EOBView: View {
    
    @State var uploadImageClick = false
    @State var uploadImage = false
    @State var uploadFromCamera = false
    @State var imageSelected = UIImage()
    
    var body: some View {
       
            VStack {
                HStack {
                    PageHeading(title: "EOB")
                    Spacer()
                    if(uploadImageClick){
                        Button {
                            uploadImageClick = false
                        } label: {
                            Text("Cancel")
                                .font(.title2)
                            .padding(.top, 30)
                            .padding(.trailing, 15)
                        }
                    } else {
                            Button {
                                uploadImageClick = true
                            } label: {
                                Text("Upload")
                                    .font(.title2)
                                .padding(.top, 30)
                                .padding(.trailing, 15)
                            }
                        }
                    
                }
                
                if(uploadImageClick){
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
                                        .font(.caption)
                                        .foregroundStyle(.black)
                                    
                                }
                                .frame(width: 100, height: 80)
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
                                        .font(.caption)
                                        .foregroundStyle(.black)
                                    
                                }
                                .frame(width: 100, height: 80)
                                .background(Color.lightGray)
                                .cornerRadius(5)
                            }
                            
                        }
                    }
                }
                /*
                Image(uiImage: imageSelected)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                 */
                ScrollView {
                    EOBTableView()
                  
                    
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
