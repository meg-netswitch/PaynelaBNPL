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
    @State var selectedTab = 1
    
    var body: some View {

            TabView(selection: $selectedTab){
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }.tag(1)
                CardView()
                    .tabItem {
                        Image(systemName: "creditcard")
                        Text("Card")
                    }.tag(2)
                RepaymentView()
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Repayment")
                    }.tag(3)
                CommunicationsView()
                    .tabItem {
                        Image(systemName: "envelope")
                        Text("Communication")
                    }.tag(4)
                EOBView()
                    .tabItem {
                        Image(systemName: "doc")
                        Text("EOB")
                    }.tag(5)
            }
            .onChange(of: selectedTab) { newValue in
                print(newValue)
                print(selectedTab)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                if(selectedTab == 5){
                    NavigationLink {
                        EOBUploadView()
                    } label: {
                        Text("Upload EOB")
                    }
                } else {
                    Button {
                        viewModel.logout()
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("logout")
                    }
                }
            }
    }
}

#Preview {
    HomeView()
}
