//
//  ContentVM.swift
//  PaynelaBNPL
//
//  Created by Meghan Granit on 4/4/24.
//

import Foundation

class ContentVM: ObservableObject {
    @Published var storedUserID = UserDefaults.standard.string(forKey: "USERID") ?? ""
}
