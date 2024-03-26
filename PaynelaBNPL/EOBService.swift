//
//  EOBService.swift
//  TemplateApp
//
//  Created by meg- work on 3/15/24.
//

import Foundation
import GraphQLSchema

class EOBService {
    
    static let shared = EOBService()
    var eobList: [EOB]?
    let userModel = UserService.shared
    
    func getAllEOB(patient_id: Int, completionHandler: @escaping (Bool, [EOB?]) -> Void){
        Network.shared.apolloClient.fetch(query: DocumentFindQuery(patient_id: patient_id)) {
            result in
            switch result {
            case .success (let graphQLResult):
                DispatchQueue.main.async {
                    if let response = graphQLResult.data?.documentfind {
                        var eobData : [EOB] = []
                        var id = 0
                        for document in response {
                            id += 1
                            var date = document?.generated_dt ?? ""
                            let char = Array(date)
                            let eobDate = "\(char[5])\(char[6])/\(char[8])\(char[9])/\(char[2])\(char[3])"
                            let eob = EOB(id: id, eob_id: document?.document_id ?? 0, file_name: document?.filename ?? "", date: eobDate, status: document?.reviewed ?? "")
                            eobData.append(eob)
                        }
                        self.eobList = eobData
                        completionHandler(true, eobData)
                    }
                }
            case .failure(let error):
                print ("error: \(error)")
                completionHandler(false, self.eobList!)
            }
        }
    }
    
    func clearEOBList(){
        eobList?.removeAll()
    }
}
