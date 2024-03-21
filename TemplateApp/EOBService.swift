//
//  EOBService.swift
//  TemplateApp
//
//  Created by meg- work on 3/15/24.
//

import Foundation
class EOBService {
    static let shared = EOBService()
    var eobList: [EOB]?
    
    
    func getAllEOB(patient_id: Int, completionHandler: @escaping (Bool, [EOB?]) -> Void){
        
        //get eobData from data source
        let eobData:  [EOB] = [EOB(eob_id: 1, file_name: "EOB1", date: "03/12/23", status: "Pending Review"), EOB(eob_id: 2, file_name: "EOB2", date: "07/09/23", status: "Pending Review")]
        
        self.eobList = eobData
        completionHandler(true, eobData)
    }
}
