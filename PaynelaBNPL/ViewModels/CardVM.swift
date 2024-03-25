//
//  CardVM.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import Foundation
import PassKit

class CardVM: ObservableObject {
    
    @Published var library: PKPassLibrary = PKPassLibrary()
    @Published var pass: PKPass?
    @Published var cardLoading = false
    @Published var cardLoaded = false
    @Published var cardError = false
    
    @Published var passSheetVisible = false
    
    
    let userModel = UserService.shared
    let passModel = PassService.shared

    func downloadPass() {

        cardLoading = true
        print("loading...")
        
        //aws gateway api
        let urlTest = URL(string: "https://60yo3ykln3.execute-api.us-east-2.amazonaws.com/v1/generate-pass")
        var request = URLRequest(url: urlTest!)
        request.setValue("S9oITeHHGe88Lnfzwzant8JUIrKir4vNaNzv2JcD", forHTTPHeaderField: "x-api-key")
        request.httpMethod = "PUT"
        let data = "{ \"memberID\" : \"py0008\", \"verificationCode\" : \"123\" }".data(using: String.Encoding.utf8)
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
                            
                            
                            cardLoading = false
                            cardLoaded = true
                            
                            
                        } else if (json!["message"] != nil){
                            let message = json!["message"]
                            print(message)
                            cardLoading = false
                            cardError = true
                   
                    
                         
                        } else {
                            print("json err")
                            cardLoading = false
                            cardError = true
                
                          
                        }
                        
                        
                    } catch {
                        print("error")
                        cardLoading = false
                        cardError = true
                   
                        
                    }
                    
                    
                    
                    
                } else {
                    print("ERR RESPONSE: \(statusCode)")
                    cardLoading = false
                    cardError = true
                    
                }
            }
            task.resume()
      }
    
    func getPass(){
        print("getting card..")
        
        let error: ErrorPointer = ErrorPointer(nilLiteral: ())
        guard self.passModel.passData != nil else { return }
        do {
            print("creating pass...")
            let pass = try PKPass(data: passModel.passData!)
            
            
            let passLibrary = PKPassLibrary()
            passLibrary.addPasses([pass]) { (status) in
                print(passLibrary.containsPass(pass))
            }
            self.passModel.pass = pass
        } catch {
            print("pass error")
        }
    }
}
