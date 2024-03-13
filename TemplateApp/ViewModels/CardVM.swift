//
//  CardVM.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import Foundation
import PassKit

class CardVM: ObservableObject {
    
    @Published var library: PKPassLibrary = PKPassLibrary()
    @Published var pass: PKPass?
    
    func getPass() {
        print("get pass")
    }
}
