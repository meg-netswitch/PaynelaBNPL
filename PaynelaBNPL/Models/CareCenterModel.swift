//
//  CareCenterModel.swift
//  TemplateApp
//
//  Created by meg- work on 3/15/24.
//

import Foundation

struct CareCenter: Codable {
    var care_center_id: Int
    var practice: String
    var address: Address
    var phone: String
    var email: String
}
