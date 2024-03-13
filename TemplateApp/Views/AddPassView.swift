//
//  AddPassView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import Foundation
import PassKit
import SwiftUI
import UIKit


struct AddPassView: UIViewControllerRepresentable {

    
    typealias UIViewControllerType = PKAddPassesViewController
    
    @Environment(\.presentationMode) var presentationMode
    
    var pass: PKPass?
    
    
    
    func makeUIViewController(context: Context) -> PKAddPassesViewController {
        let passVC = PKAddPassesViewController(pass: self.pass!)
        return passVC!
    }
    
    func updateUIViewController(_ uiViewController: PKAddPassesViewController, context: Context) {
        // Nothing goes here
    }
}
