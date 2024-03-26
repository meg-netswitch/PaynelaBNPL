//
//  HomeVM.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import Foundation

class HomeVM: ObservableObject {
    
    let userModel = UserService.shared
    let eobModel = EOBService.shared
    
    func logout(){
        userModel.logout()
        eobModel.clearEOBList()
    }
}
