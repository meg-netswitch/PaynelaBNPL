//
//  UploadImageView.swift
//  TemplateApp
//
//  Created by meg- work on 3/17/24.
//

import SwiftUI
import PhotosUI


struct UploadImageView: View {
    // @State var images: [UIImage] = []
    //    @State var selectedItems: [PhotosPickerItem] = []
    
    @StateObject private var viewModel = EOBVM()
    
    
    var body: some View {
    
        ScrollView {
            
            ForEach(viewModel.images, id:\.cgImage){ image in
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
            
            Spacer()
            
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
            }
                         .onChange(of: viewModel.selectedItems) { selectedItems in
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
        }
        
    
        
}
}

#Preview {
    UploadImageView()
}
