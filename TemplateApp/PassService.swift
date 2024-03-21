//
//  PassService.swift
//  TemplateApp
//
//  Created by meg- work on 3/20/24.
//

import Foundation
import PassKit


class PassService {
    static let shared = PassService()
    
    var selectedEntity: Pass?
    var passData: Data?
    var pass: PKPass?
    var passURL: String?
    var newCardImgData: Data = Data()
    var program: String = ""
    var memberID: String = ""
    var name: String = ""
    var cardNum: String = ""
    var expDate: String = ""
    var cvv: String = ""
    
    private init() {
        
    }
    
    
}
