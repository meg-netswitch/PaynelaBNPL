//
//  EOBView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI
import PhotosUI


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
            if(!uploadImage){
                Button {
                    viewModel.cancelUpload()
                    withAnimation{
                        uploadImage.toggle()
                    }
                } label: {
                    Text("Upload EOB")
                    .font(.headline)
                    .padding(.vertical, 10)
                    
                }
            }
            if(uploadImage){
                Button {
                    viewModel.cancelUpload()
                    uploadFromPhotos = false
                    uploadFromCamera = false
                    withAnimation{
                        uploadImage.toggle()
                    }
                } label: {
                    Text("Cancel")
                        .font(.headline)
                        .padding(.vertical, 10)
                }
            }
            
            if(uploadImage && !uploadFromPhotos && !uploadFromCamera){
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
                if(uploadFromPhotos){
                    ForEach(viewModel.images, id:\.cgImage){ image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                    }
                    Button {
                        viewModel.submitPhotos(type: "photos")
                    } label: {
                        Text("Submit")
                    }
                    Spacer()
                }
                if(uploadFromCamera){
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
                        }
                    Button {
                        viewModel.submitPhotos(type: "camera")
                    } label: {
                        Text("Submit")
                    }
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
        .sheet(isPresented: $showCameraSheet) {
            
            ImagePicker(selectedImage: $viewModel.cameraImages, sourceType: .camera)
                .ignoresSafeArea()
        }
            
    }
        
}
        
#Preview {
    EOBView()
}
