//
//  EOBUploadView.swift
//  TemplateApp
//
//  Created by meg- work on 3/19/24.
//

import SwiftUI
import PhotosUI

struct EOBUploadView: View {
    @StateObject private var viewModel = EOBVM()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var uploadImageClick = false
    @State var uploadFromPhotos = false
    @State var uploadFromCamera = false
    @State var showCameraSheet = false
    @State var imageSelected = UIImage()
    
    var body: some View {
        
        VStack {
            HStack {
                PageHeading(title: "Upload EOB")
                Spacer()
            }
            if(!uploadFromPhotos && !uploadFromCamera){
                VStack {
                    Text("Select")
                        .fontWeight(.semibold)
                        .padding(.bottom)
                    HStack {
                        PhotosPicker(selection: $viewModel.selectedItems,
                                     matching: .images) {
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
                            .frame(width: 100, height: 80)
                            .background(.gray.opacity(0.25))
                            .cornerRadius(5)
                        }.onChange(of: viewModel.selectedItems) { selectedItems in
                            uploadFromPhotos = true
                            viewModel.images = []
                            for item in selectedItems {
                                item.loadTransferable(type: Data.self) { result in
                                    switch result {
                                    case .success(let imageData):
                                        if let imageData {
                                            viewModel.images.append(UIImage(data: imageData)!)
                                        } else {
                                            print("No supported content type found.")
                                        }
                                    case .failure(let error):
                                        print(error)
                                    }
                                }
                            }
                        }
                        Button{
                            viewModel.cancelUpload()
                            uploadFromCamera = true
                            showCameraSheet = true
                        } label: {
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
                            .frame(width: 100, height: 80)
                            .background(.gray.opacity(0.25))
                            .cornerRadius(5)
                        }
                    }
                }
                .padding(30)
                .background(.lightGray)
                .cornerRadius(10)
                
            }
                
            VStack {
                if(uploadFromPhotos && !viewModel.images.isEmpty){
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(viewModel.images, id:\.cgImage){ image in
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame(.horizontal)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .contentMargins(50, for: .scrollContent)
                    .listRowInsets(EdgeInsets())
                    
                    if(viewModel.submissionLoading){
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint:  Color.black.opacity(0.5)))
                            .padding(15)
                    } else {
                        Button {
                            viewModel.submitPhotos(type: "photos")
                        } label: {
                            Text("Submit")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 300, height: 50)
                                .background(Color.companyButton1)
                                .cornerRadius(5)
                        }
                    }
                    Spacer()
                }
                if(uploadFromCamera && !viewModel.cameraImages.isEmpty){
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(viewModel.cameraImages, id: \.cgImage ) { item in
                                Image(uiImage: item)
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame(.horizontal)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .contentMargins(50, for: .scrollContent)
                    .listRowInsets(EdgeInsets())
                        Button {
                            viewModel.cameraIndex = viewModel.cameraIndex + 1
                            
                            showCameraSheet = true
                        } label: {
                            Text("add another image")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 300, height: 50)
                                .background(Color.gray)
                                .cornerRadius(5)
                        }
                    if(viewModel.submissionLoading){
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint:  Color.black.opacity(0.5)))
                            .padding(15)
                    } else {
                        Button {
                            viewModel.submitPhotos(type: "camera")
                        } label: {
                            Text("Submit")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 300, height: 50)
                                .background(Color.companyButton1)
                                .cornerRadius(5)
                        }
                    }
                    }
            }
            Spacer()
            
            
        }
        .sheet(isPresented: $showCameraSheet) {
            
            ImagePicker(selectedImage: $viewModel.cameraImages, sourceType: .camera)
                .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button {
            uploadFromPhotos = false
            uploadFromCamera = false
            viewModel.cancelUpload()
            presentationMode.wrappedValue.dismiss()
            
        } label: {
            Text("Cancel")
        } )
        .alert(isPresented: $viewModel.connectionErr) {
            Alert(
                title: Text("Connection Error"),
                message: Text("Would you like to try to submit again?"),
                primaryButton: .default(
                    Text("Ok"),
                    action: {
                        viewModel.connectionErr = false
                        viewModel.submitPhotos(type: "photos")
                        
                    }
                ),
                secondaryButton: .default(
                    Text("Cancel"),
                    action: {
                        viewModel.cancelUpload()
                        presentationMode.wrappedValue.dismiss()
                    }
                )
            )
        }

    }
    
}

#Preview {
    EOBUploadView()
}
