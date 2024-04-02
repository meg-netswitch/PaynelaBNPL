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
    let appModel = AppService.shared
    let userModel = UserService.shared
    
    @Published var eobList: [EOB] = []
    @Published var cameraImages = [UIImage()]
    @Published var cameraIndex = 0
    @Published var submissionLoading = false
    @Published var connectionErr = false
    @Published var uploadComplete = false
    
    @Published var images: [UIImage] = []
    @Published var selectedItems: [PhotosPickerItem] = []
    @Published var presignedUrl: String = ""

    init(){
        eobModel.getAllEOB(patient_id: userModel.currentUserID) { result, eobs in
            if result {
                for eob in eobs {
                    self.eobList.append(eob!)
                }
                
            }
            
        }
    }
    
    
    func cancelUpload(){
        cameraImages.removeAll()
        images.removeAll()
        selectedItems.removeAll()
        self.uploadComplete = false
        submissionLoading = false
    }
    
    func submitPhotos(type: String){
        submissionLoading = true
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

        if(pdfDocument.pageCount != 0){
            let pdfData = pdfDocument.dataRepresentation()
     

            //call gateway api and get back presigned url
            let urlTest = URL(string: "\(appModel.uploadEOBURL)")
            var request = URLRequest(url: urlTest!)
            request.setValue("\(appModel.uploadEOB_xapikey)", forHTTPHeaderField: "x-api-key")
            request.httpMethod = "PUT"
            let postData = "{ \"member_id\" : \"\(userModel.currentUserID)\" }".data(using: String.Encoding.utf8)
            request.httpBody = postData
            let session = URLSession(configuration: .default)
            
            let task : URLSessionDataTask = session.dataTask(with: request) { [self] (data, response, error) in
                guard let response = response as? HTTPURLResponse else {
                    connectionErr = true
                    return
                }
                    let statusCode = (response as! HTTPURLResponse).statusCode
                    if statusCode == 200{
                        do {
                            let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: String]
                            guard (json != nil) else {
                                //error in lambda
                                print("err in lambda")
                                
                                return
                            }
                            if(json!["url"] != nil){
                                self.presignedUrl = json!["url"]!
                                let pdfurl = URL(string: presignedUrl)
                                
                                var pdfrequest = URLRequest(url: pdfurl!)
                                
                                pdfrequest.httpMethod = "PUT"
                                
                                pdfrequest.httpBody = pdfData
                                let pdfsession = URLSession(configuration: .default)
                                let pdftask : URLSessionDataTask = session.dataTask(with: pdfrequest) { [self] (data, response, error) in
                                    let statusCode = (response as! HTTPURLResponse).statusCode
                                    if statusCode == 200{
                                        print("success")
                                        submissionLoading = false
                                        cancelUpload()
                                        self.uploadComplete = true
                                    } else {
                                        print("error pdf upload")
                                    }
                                }
                                pdftask.resume()
                               
                            }
                            
                        } catch {
                            print("error")
                            
                        }
                        
                        
                        
                        
                    } else {
                        print("ERR RESPONSE: \(statusCode)")
                        
                    }
                }
                task.resume()
        } else {
            print("no images")
        }
        
  
        
    }
    
}
