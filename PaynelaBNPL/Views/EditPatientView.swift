//
//  EditPatientView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct EditPatientView: View {
    @StateObject private var viewModel = EditPatientVM()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
            Form {
                Section(header: Text("Patient Information"), footer:
                    HStack {
                    Spacer()
                    Button {
                        viewModel.updatePatient()
                        if(viewModel.dismiss){
                            dismiss()
                        }
                        
                    } label: {
                        Text("save")
                            .padding(.vertical)
                    }
                }
                ) {
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                    TextField("Address", text: $viewModel.address)
                    TextField("City", text: $viewModel.city)
                    Picker("State", selection: $viewModel.state) {
                        ForEach(viewModel.userModel.statesArr, id: \.abbr){ item in
                            Text("\(item.name)").tag("\(item.abbr)")
                        }
                    }
                    .pickerStyle(.menu)
                    .accentColor(.black)
                    TextField("ZIP", text: $viewModel.zip)
                    TextField("Phone", text: $viewModel.phone)
                    TextField("Email", text: $viewModel.email)
                }
            }
            .alert(isPresented: $viewModel.updateErr, content: {
                Alert(title: Text("Error updating profile."))
            })
            .alert(isPresented: $viewModel.missingFields, content: {
                Alert(title: Text("Missing fields."))
            })
        }
}

#Preview {
    EditPatientView()
}
