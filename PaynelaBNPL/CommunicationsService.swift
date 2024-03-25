//
//  CommunicationsService.swift
//  TemplateApp
//
//  Created by meg- work on 3/15/24.
//

import Foundation

class CommunicationsService {
    static let shared = CommunicationsService()
    var communicationData: [Communication]?
    
    func getAllCommunications(patient_id: Int, completionHandler: @escaping (Bool, [Communication?]) -> Void){
        
        //get communications from data source
        let communicationData: [Communication] = [Communication(communication_id: 1, date: "02/12/24", subject: "Welcome Message", type: "Email: smith@company.com"), Communication(communication_id: 2, date: "02/12/24", subject: "Follow up Loan Approval", type: "Email: smith@company.com"), Communication(communication_id: 3, date: "02/12/24", subject: "Enquiry of Payment Schedule", type: "Email: smith@company.com"), Communication(communication_id: 4, date: "02/12/24", subject: "Important Membership Info", type: "Email: smith@company.com")]
        
        self.communicationData = communicationData
        
        completionHandler(true, communicationData)
    }
    
}



