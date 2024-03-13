//
//  LoginView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct LoginView: View {
    //@State private var unlocked = false
    @StateObject private var viewModel = LoginVM()
    @FocusState private var fieldIsFocused: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(Color.companyColor1)
                    .ignoresSafeArea()
                VStack {
                    LoggedOutHeader()
                    VStack {
                        
                        TextField("", text: $viewModel.username, prompt: Text("Username")
                            .foregroundColor(.gray))
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.05))
                        .foregroundStyle(Color.white)
                        .cornerRadius(5)
                        .textInputAutocapitalization(TextInputAutocapitalization.never)
                        .focused($fieldIsFocused)
                        SecureField("", text: $viewModel.password, prompt: Text("Password")
                            .foregroundColor(.gray))
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.05))
                        .foregroundStyle(Color.white)
                        .cornerRadius(5)
                        .textInputAutocapitalization(TextInputAutocapitalization.never)
                        .focused($fieldIsFocused)
                        if(viewModel.loading){
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                                .padding(15)
                        } else {
                            VStack {
                                Button {
                                    Task {
                                        fieldIsFocused = false
                                        viewModel.loading = true
                                        viewModel.authenticateUser(username: viewModel.username, password: viewModel.password)
                                    }
                                } label: {
                                    Text("LOGIN")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .frame(width: 300, height: 50)
                                        .background(Color.companyButton1)
                                        .cornerRadius(5)
                                }
                                
                                
                                if (viewModel.faceIDActive == "true"){
                                    VStack {
                                        Button {
                                            Task {
                                                viewModel.faceIDAuthenticate()
                                            }
                                        } label: {
                                            ZStack{
                                                Text("Login with FaceID")
                                                HStack {
                                                    Spacer()
                                                    Image(systemName: "faceid")
                                                        .imageScale(.large)
                                                        .padding(.trailing)
                                                }
                                                
                                            }
                                            .foregroundColor(.white)
                                            .frame(width: 300, height: 50)
                                            .background(Color.gray)
                                            .cornerRadius(5)
                                            
                                        }
                                    }
                                }
                                else {
                                    VStack {
                                        Toggle(isOn: $viewModel.enableFaceID) {
                                            Text("Enable FaceID")
                                                .foregroundStyle(Color.white)
                                        }
                                        .frame(width: 300, height: 50)
                                    }
                                    
                                }
                                
                                NavigationLink {
                                    RegisterView()
                                        .navigationBarBackButtonHidden(true)
                                } label: {
                                    Text("Touch here to register")
                                    
                                }
                                .padding()
                                
                                
                            }
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        if(viewModel.validLogin){
                            NavigationLink("", destination: HomeView(), isActive: $viewModel.validLogin)
                            
                        } else {
                            EmptyView()
                        }
                        
                    }
                    
                    Spacer()
                }
                
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Would you like to update stored user credentials?"),
                    message: Text("If not you can still login but the credentials will not be saved"),
                    primaryButton: .default(
                        Text("Yes"),
                        action: {
                            viewModel.loginUpdateKeychain()
                        }
                    ),
                    secondaryButton: .default(
                        Text("No"),
                        action: {
                            viewModel.loginWithoutUpdatingKeychain()
                        }
                    )
                )
            }
                
            
        }
        
    }
        
    
    
}


#Preview {
    LoginView()
}
