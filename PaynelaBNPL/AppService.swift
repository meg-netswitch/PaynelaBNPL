//
//  AppService.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import Foundation

class AppService {
    static let shared = AppService()
    
    let companyName: String = "Paynela"
    let companySlogan: String = "Buy Now Pay Later"
    let backgroundLight: Bool = false
    let backLink = "paynelabnpl://login"
    let cardID = "py0008"
    let accessCode = "123"
    let graphqlURL = "https://h4d3rx75vfejtmgih2bnp6ewya.appsync-api.us-east-2.amazonaws.com/graphql"
    let graphql_xapikey = "da2-xs7ywkferjfl3geijpdxzuuguu"
    let uploadEOBURL = "https://awttq5f0g5.execute-api.us-east-2.amazonaws.com/v1/"
    let uploadEOB_xapikey = "S9oITeHHGe88Lnfzwzant8JUIrKir4vNaNzv2JcD"
    
    
    private init() {
        
    }
    
}
