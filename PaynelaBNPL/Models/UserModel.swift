//
//  UserModel.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import Foundation
struct User: Codable {
    var user_id: Int
    var username: String
    var email: String
    var user_role: String
    var user_status: String
    var password: String
    var created_dt: String
    var last_login: String
    
    
}
