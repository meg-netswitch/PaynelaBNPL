//
//  HomeView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeVM()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {

            TabView{
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                CardView()
                    .tabItem {
                        Image(systemName: "creditcard")
                        Text("Card")
                    }
                RepaymentView()
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Repayment")
                    }
                CommunicationsView()
                    .tabItem {
                        Image(systemName: "envelope")
                        Text("Communication")
                    }
                EOBView()
                    .tabItem {
                        Image(systemName: "doc")
                        Text("EOB")
                    }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                Button {
                    viewModel.logout()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("logout")
                }
            }
    }
}

#Preview {
    HomeView()
}
