//
//  RegisterView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var viewModel = RegisterVM()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color(Color.companyColor1)
                .ignoresSafeArea()
            VStack{
                LoggedOutHeader()
                VStack {

                    TextField("", text: $viewModel.firstname, prompt: Text("First Name")
                        .foregroundColor(viewModel.appModel.backgroundLight ? Color.black.opacity(0.5) : Color.white.opacity(0.5)))
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(viewModel.appModel.backgroundLight ? Color.white.opacity(0.1) : Color.black.opacity(0.1))
                        .foregroundStyle(viewModel.appModel.backgroundLight ? .black : .white)
                        .cornerRadius(5)
                    TextField("", text: $viewModel.lastname, prompt: Text("Last Name")
                        .foregroundColor(viewModel.appModel.backgroundLight ? Color.black.opacity(0.5) : Color.white.opacity(0.5)))
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(viewModel.appModel.backgroundLight ? Color.white.opacity(0.1) : Color.black.opacity(0.1))
                        .foregroundStyle(viewModel.appModel.backgroundLight ? .black : .white)
                        .cornerRadius(5)
                    DatePicker(selection: $viewModel.selectedDate,displayedComponents: [.date], label: {
                        Text("DOB")
                            .foregroundColor(viewModel.appModel.backgroundLight ? Color.black.opacity(0.5) : Color.white.opacity(0.5))
                        
                    })
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(viewModel.appModel.backgroundLight ? Color.white.opacity(0.1) : Color.black.opacity(0.1))
                    .foregroundStyle(viewModel.appModel.backgroundLight ? .black : .white)
                    .environment(\.colorScheme, viewModel.appModel.backgroundLight ? .light : .dark)
                    .cornerRadius(5)
                    TextField("", text: $viewModel.ssn, prompt: Text("Last 4 SSN")
                        .foregroundColor(viewModel.appModel.backgroundLight ? Color.black.opacity(0.5) : Color.white.opacity(0.5)))
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(viewModel.appModel.backgroundLight ? Color.white.opacity(0.1) : Color.black.opacity(0.1))
                        .foregroundStyle(viewModel.appModel.backgroundLight ? .black : .white)
                        .cornerRadius(5)
                    Button {
                        Task {
                            viewModel.register(firstname: viewModel.firstname, lastname: viewModel.lastname, selectedDate: viewModel.selectedDate, ssn: viewModel.ssn)
                        }
                    } label: {
                        Text("REGISTER")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.companyButton1)
                            .cornerRadius(5)
                    }
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Touch here to login")
                            .foregroundStyle(viewModel.appModel.backgroundLight ? .black : .white)
                    }
                    .padding()
                    Spacer()
                }
                Spacer()
            }
         
            
        }
        
    }
}
#Preview {
    RegisterView()
}
