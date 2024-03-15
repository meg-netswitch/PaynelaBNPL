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

                }
                HStack {
                    Spacer()
                    if(uploadImageClick){
                        Button {
                            withAnimation{
                                uploadImageClick.toggle()
                            }
                        } label: {
                            Text("Cancel")
                                .font(.headline)
                                .padding(.vertical, 10)
                        }
                    } else {
                            Button {
                                withAnimation{
                                    uploadImageClick.toggle()
                                }
                            } label: {
                                Text("Upload EOB")
                                .font(.headline)
                                .padding(.vertical, 10)
                                
                            }
                        }
                    
                }
                .padding(.horizontal)
               ScrollView {
                if(uploadImageClick){
                    VStack {
                        HStack {
                            Spacer()
                            Button {
                                uploadImage = true
                                
                            } label: {
                                if (!uploadImage && !uploadFromCamera) {
                                    VStack {
                                        Image(systemName: "photo")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundStyle(.black)
                                            .frame(height: 20)
                                        Text("Photo Library")
                                            .fontWeight(.semibold)
                                            .font(.caption)
                                            .foregroundStyle(.black)
                                        
                                    }
                                    .frame(width: 100, height: 60)
                                    .background(.white)
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
                                            .frame(height: 20)
                                        Text("Camera")
                                            .fontWeight(.semibold)
                                            .font(.caption)
                                            .foregroundStyle(.black)
                                        
                                    }
                                    .frame(width: 100, height: 60)
                                    .background(.white)
                                    .cornerRadius(5)
                                }
                                
                            }
                            Spacer()
                        }
                        .padding()
                        if(imageSelected.size != CGSize(width: 0, height: 0)){
                            VStack {
                                Image(uiImage: imageSelected)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                                Button {
                                    
                                } label: {
                                    Text("Submit")
                                        .fontWeight(.semibold)
                                        .font(.caption)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal)
                                        .background(.white)
                                        .foregroundStyle(.black)
                                        .cornerRadius(5)
                                }
                                
                            }
                            .padding(.bottom)
                        }
                        
                    }
                    .animation(.spring)
                    .background(Color.lightGray)
                    .cornerRadius(5)
                    .padding()
                    
                }
                
                
                    VStack {
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
