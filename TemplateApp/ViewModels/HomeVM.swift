//
//  HomeVM.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import Foundation


class HomeVM: ObservableObject {
    
    let userModel = UserService.shared
    
    func logout(){
        userModel.logout()
    }
}
