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
                WideCustomRow(title: "Name", value: "\(viewModel.userModel.currentPatient?.patient_name.first ?? "") \(viewModel.userModel.currentPatient?.patient_name.last ?? "")")
                WideCustomRow(title: "Address", value: "\(viewModel.userModel.currentPatient?.address.address_1 ?? "")")
                WideCustomRow(title: "City", value: "\(viewModel.userModel.currentPatient?.address.city ?? "")")
                WideCustomRow(title: "State", value: "\(viewModel.userModel.currentPatient?.address.state ?? "")")
                WideCustomRow(title: "Zip", value: "\(viewModel.userModel.currentPatient?.address.zip ?? "")")
                WideCustomRow(title: "Phone", value: "\(viewModel.userModel.currentPatient?.phone.home ?? "")")
                WideCustomRow(title: "Email", value: "\(viewModel.userModel.currentPatient?.email ?? "")")
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
        /*
        ScrollView{
            Form {
                FormCustomRow(title: "First Name", value: viewModel.firstName)
                FormCustomRow(title: "Last Name", value: viewModel.lastName)
                FormCustomRow(title: "Address", value: viewModel.address)
                FormCustomRow(title: "City", value: viewModel.city)
                HStack{
                    Text("State")
                    Spacer()
                    Picker("State", selection: $viewModel.state) {
                        ForEach(viewModel.statesArr, id: \.abbr){ item in
                            Text("\(item.name)").tag("\(item.abbr)")
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(.menu)
                    .accentColor(.black)
                    .foregroundColor(.black)
                }
                .padding()
                .background(Color("PaynelaGrey"))
                .cornerRadius(10)
                FormCustomRow(title: "Zip", value: viewModel.zip)
                FormCustomRow(title: "Phone", value: viewModel.phone)
                FormCustomRow(title: "Email", value: viewModel.email)
            }
            .padding()
            .formStyle(.columns)
            Spacer()
         
        }
         */
    }
}

#Preview {
    PatientView()
}
