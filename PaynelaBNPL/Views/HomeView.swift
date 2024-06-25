//
//  HomeView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeVM()
    @State var locationViewModel = LocationManagerViewModel()
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
            TransactionView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Transactions")
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
        .task {
            try? await locationViewModel.requestUserAuthorization()
            NotificationService.shared.requestAuthorization()
            ///NotificationService.shared.scheduleNotification(userID: viewModel.userModel.currentUserID.description)
        }
    }
}

#Preview {
    HomeView()
}
