//
//  EOBVM.swift
//  TemplateApp
//
//  Created by meg- work on 3/15/24.
//

import Foundation
import SwiftUI
import PhotosUI
import PDFKit

class EOBVM: ObservableObject {

    let eobModel = EOBService.shared
    let userModel = UserService.shared
    
    @Published var cameraImages = [UIImage()]
    @Published var cameraIndex = 0
    
    @Published var images: [UIImage] = []
    @Published var selectedItems: [PhotosPickerItem] = []
    
    init(){
        eobModel.getAllEOB(patient_id: userModel.currentUserID){(result, eob) in
            if result {
                
            } else {
                
            }
        }
    }
    
    func cancelUpload(){
        cameraImages.removeAll()
        images.removeAll()
        selectedItems.removeAll()
    }
    
    func submitPhotos(type: String){
        //get all photos to upload
        let getImages: [UIImage]
        if (type == "camera"){
            getImages = self.cameraImages
        } else {
            getImages = self.images
        }
        
        //convert to pdf
        let pdfDocument = PDFDocument()
        var index = 0

        for (index,image) in getImages.enumerated() {
            let pdfPage = PDFPage(image: image)
            pdfDocument.insert(pdfPage!, at: index)
        }
        
        let data = pdfDocument.dataRepresentation()

        //call gateway api and get back presigned url
        let urlTest = URL(string: "https://awttq5f0g5.execute-api.us-east-2.amazonaws.com/v1/")
        var request = URLRequest(url: urlTest!)
        request.setValue("S9oITeHHGe88Lnfzwzant8JUIrKir4vNaNzv2JcD", forHTTPHeaderField: "x-api-key")
        request.httpMethod = "PUT"
        let postData = "{ \"member_id\" : \"1234\" }".data(using: String.Encoding.utf8)
        request.httpBody = postData
        let session = URLSession(configuration: .default)
        
        let task : URLSessionDataTask = session.dataTask(with: request) { [self] (data, response, error) in
                let statusCode = (response as! HTTPURLResponse).statusCode
                if statusCode == 200{
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: String]
                        guard (json != nil) else {
                            //error in lambda
                            print("err in lambda")
                            
                            
                            return
                        }
                        
                        
                    } catch {
                        print("error")
                        
                    }
                    
                    
                    
                    
                } else {
                    print("ERR RESPONSE: \(statusCode)")
                    
                }
            }
            task.resume()
        
        
        //post pdf to presigned url
        //let url = URL(fileURLWithPath: "/Path/To/Your/PDF")
        //try! data!.write(to: url)
        
        
    }
    
}
