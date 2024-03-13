//
//  AppService.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import Foundation

class AppService {
    static let shared = AppService()
    
    let companyName: String = "App Name"
    let companySlogan: String = "Company Slogan"
    let backgroundLight: Bool = true
    
    private init() {
        
    }
    
}
