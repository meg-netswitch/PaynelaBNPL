//
//  ProviderModel.swift
//  TemplateApp
//
//  Created by meg- work on 3/15/24.
//

import Foundation

struct Provider: Codable {
    var provider_id: Int
    var first_name: String
    var last_name: String
    var address: Address
    var phone: String
}
