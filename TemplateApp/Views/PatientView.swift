//
//  PatientView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct PatientView: View {
    @StateObject private var viewModel = PatientVM()
    @State private var passSheetVisible = false
    var body: some View {
        List {
            Section {
                
                WideCustomRow(title: "Name", value: "\(viewModel.userModel.currentPatient?.patient_name.first ?? " ") \(viewModel.userModel.currentPatient?.patient_name.last ?? " ")")
                
                WideCustomRow(title: "Address", value: "\(viewModel.userModel.currentPatient?.address.address_1 ?? " ")")
                WideCustomRow(title: "City", value: "\(viewModel.userModel.currentPatient?.address.city ?? " ")")
                WideCustomRow(title: "State", value: "\(viewModel.userModel.currentPatient?.address.state ?? " ")")
                WideCustomRow(title: "Zip", value: "\(viewModel.userModel.currentPatient?.address.zip ?? " ")")
                WideCustomRow(title: "Phone", value: "\(viewModel.userModel.currentPatient?.phone.home ?? " ")")
                WideCustomRow(title: "Email", value: "\(viewModel.userModel.currentPatient?.email ?? " ")")
                 
            } header: {
                Text("Patient Information")
            } footer: {
                HStack {
                    Spacer()
                    Button(action: {
                        self.passSheetVisible = true
                    }, label: {
                        Text("edit")
                    })
                }
            }
            
        }
        .sheet(isPresented: self.$passSheetVisible) {
            EditPatientView()
        }
       
    }
}

#Preview {
    PatientView()
}
