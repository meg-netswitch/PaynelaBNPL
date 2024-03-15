//
//  CommunicationsService.swift
//  TemplateApp
//
//  Created by meg- work on 3/15/24.
//

import Foundation

class CommunicationsService {
    static let shared = CommunicationsService()
    
    func getAllCommunications(patient_id: Int, completionHandler: @escaping (Bool, [CommunicationsData?]) -> Void){
        let communicationData: [CommunicationsData] = [CommunicationsData(communication_id: 1, date: "02/12/24", subject: "Welcome Message", type: "Email: smith@company.com"), CommunicationsData(communication_id: 2, date: "02/12/24", subject: "Follow up Loan Approval", type: "Email: smith@company.com"), CommunicationsData(communication_id: 3, date: "02/12/24", subject: "Enquiry of Payment Schedule", type: "Email: smith@company.com"), CommunicationsData(communication_id: 4, date: "02/12/24", subject: "Important Membership Info", type: "Email: smith@company.com")]
        completionHandler(true, communicationData)
    }
    
}



