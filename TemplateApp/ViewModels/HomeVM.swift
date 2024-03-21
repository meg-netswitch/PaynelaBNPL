//
//  HomeVM.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import Foundation
import PassKit

class HomeVM: ObservableObject {
    
    @Published var pass: PKPass?
    
    let userModel = UserService.shared
    let passModel = PassService.shared
    
    init(){
        self.downloadPass()
    }
    
    func logout(){
        userModel.logout()
    }
    
    func downloadPass() {

        print("loading...")
        //aws gateway api
        let urlTest = URL(string: "https://60yo3ykln3.execute-api.us-east-2.amazonaws.com/v1/generate-pass")
        var request = URLRequest(url: urlTest!)
        request.setValue("S9oITeHHGe88Lnfzwzant8JUIrKir4vNaNzv2JcD", forHTTPHeaderField: "x-api-key")
        request.httpMethod = "PUT"
        let data = "{ \"memberID\" : \"bt0007\", \"verificationCode\" : \"123\" }".data(using: String.Encoding.utf8)
        request.httpBody = data
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
                        if((json!["url"] != nil) && (json!["img"] != nil) && (json!["companyName"] != nil) && (json!["cardNum"] != nil) && (json!["expDate"] != nil) && (json!["name"] != nil) && (json!["cvv"] != nil)){
                            let presignedURL = json!["url"]
                            let result = try Data(contentsOf: URL(string: presignedURL!)!)
                            let pass = try PKPass(data: result as Data)
                            self.passModel.pass = pass
                            let imageURL = json!["img"]
                            let imageData = try Data(contentsOf: URL(string: imageURL!)!)
                            let image = try UIImage(data: imageData)
                            self.passModel.newCardImgData = imageData

                            
                            let program = json!["companyName"] ?? ""
                            self.passModel.program = program
                            
                            let cardNum = json!["cardNum"] ?? ""
                            self.passModel.cardNum = cardNum
                            
                            let expDate = json!["expDate"] ?? ""
                            self.passModel.expDate = expDate
                            
                            let cvv = json!["cvv"] ?? ""
                            self.passModel.cvv = cvv
                            
                            let name = json!["name"] ?? ""
                            self.passModel.name = name
                            
                            //stop loading sympbol, reset memberid field, send to next page
                  
                        } else if (json!["message"] != nil){
                            let message = json!["message"]
                            print(message)
                   
                    
                         
                        } else {
                            print("json err")
            
                
                          
                        }
                        
                        
                    } catch {
                        print("error")
                    
                   
                        
                    }
                    
                    
                    
                    
                } else {
                    print("ERR RESPONSE: \(statusCode)")
                    
                }
            }
            task.resume()
      }
}
