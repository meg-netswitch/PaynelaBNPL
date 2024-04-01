//
//  CommunicationsService.swift
//  TemplateApp
//
//  Created by meg- work on 3/15/24.
//

import Foundation

class CommunicationsService {
    static let shared = CommunicationsService()
    var communicationList: [Communication]?
    
    func getAllCommunications(patient_id: Int, completionHandler: @escaping (Bool, [Communication?]) -> Void){
        
        //get communications from data source
        let communicationData: [Communication] = [Communication(id: 1, communication_id: 1, date: "02/12/24", subject: "Welcome Message", type: "Email: smith@company.com"), Communication(id: 2, communication_id: 2, date: "02/12/24", subject: "Follow up Loan Approval", type: "Email: smith@company.com"), Communication(id: 3, communication_id: 3, date: "02/12/24", subject: "Enquiry of Payment Schedule", type: "Email: smith@company.com"), Communication(id: 4, communication_id: 4, date: "02/12/24", subject: "Important Membership Info", type: "Email: smith@company.com")]
        //let communicationData: [Communication] = []
        
        self.communicationList = communicationData
        completionHandler(true, communicationData)
        /*
        Network.shared.apolloClient.fetch(query: CommunicationFindQuery(patient_id: patient_id)) {
            result in
            switch result {
            case .success (let graphQLResult):
                DispatchQueue.main.async {
                    if let response = graphQLResult.data?.communicationfind {
                        var communicationData : [Communication] = []
                        var id = 0
                        for communication in response {
                            id += 1
                            var date = communication?.generated_dt ?? ""
                            let char = Array(date)
                            let communicationDate = "\(char[5])\(char[6])/\(char[8])\(char[9])/\(char[2])\(char[3])"
                            let communication = Communication(id: id, communication_id: communication.communication_id, date: communicationDate, subject: communication.subject, type: communication.type)
                            communicationData.append(communication)
                        }
                        self.communicationList = communicationData
                        completionHandler(true, communicationData)
                    }
                }
            case .failure(let error):
                print ("error: \(error)")
                completionHandler(false, self.communicationList!)
            }
        }
         */
    }
    
}



