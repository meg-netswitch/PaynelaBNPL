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
            if(!uploadFromPhotos && !uploadFromCamera){
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
                                .frame(width: 100, height: 60)
                                .background(.white)
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
                        .frame(width: 100, height: 60)
                        .background(.white)
                        .cornerRadius(5)
                    }
                }
            }
            ScrollView {
                if(uploadFromPhotos && !viewModel.images.isEmpty){
                    ForEach(viewModel.images, id:\.cgImage){ image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                    }
                    if(viewModel.submissionLoading){
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint:  Color.black.opacity(0.5)))
                            .padding(15)
                    } else {
                        Button {
                            viewModel.submitPhotos(type: "photos")
                        } label: {
                            Text("Submit")
                        }
                    }
                    Spacer()
                }
                if(uploadFromCamera && !viewModel.cameraImages.isEmpty){
                        ForEach(viewModel.cameraImages, id: \.cgImage ) { item in
                            Image(uiImage: item)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                        }
                        Button {
                            viewModel.cameraIndex = viewModel.cameraIndex + 1
                            
                            showCameraSheet = true
                        } label: {
                            Text("add another image")
                                .foregroundColor(.white)
                                .frame(width: 150, height: 50)
                                .background(Color.black)
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
                                .foregroundColor(.white)
                                .frame(width: 150, height: 50)
                                .background(Color.companyButton1)
                                .cornerRadius(5)
                        }
                    }
                    }
            }
            
            
            
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

    }
    
}

#Preview {
    EOBUploadView()
}
