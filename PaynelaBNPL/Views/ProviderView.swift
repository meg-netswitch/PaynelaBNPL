//
//  ProviderView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct ProviderView: View {
    @StateObject private var viewModel = ProviderVM()
    @State private var passSheetVisible = false
    @State private var showPage = ""
    var body: some View {
        List {
            Section {
                WideCustomRow(title: "First Name", value: "\(viewModel.userModel.currentProvider?.first_name ?? " ")")
                WideCustomRow(title: "Last Name", value: "\(viewModel.userModel.currentProvider?.last_name ?? " ")")
                WideCustomRow(title: "Address", value: "\(viewModel.userModel.currentProvider?.address.address_1 ?? " ")")
                WideCustomRow(title: "City", value: "\(viewModel.userModel.currentProvider?.address.city ?? " ")")
                WideCustomRow(title: "State, Zip", value: "\(viewModel.userModel.currentProvider?.address.state ?? " "), \(viewModel.userModel.currentProvider?.address.zip ?? " ")")
                WideCustomRow(title: "Phone", value: "\(viewModel.userModel.currentProvider?.phone ?? " ")")
            } header: {
                Text("Primary")
            } footer: {
                HStack {
                    Spacer()
                    Button(action: {
                        self.showPage = "editprimary"
                        self.passSheetVisible = true
                    }, label: {
                        Text("edit")
                            .padding(.top, 10)
                    })
                }
            }
            Section {
                WideCustomRow(title: "Practice", value: "\(viewModel.userModel.currentCareCenter?.practice ?? " ")")
                WideCustomRow(title: "Address", value: "\(viewModel.userModel.currentCareCenter?.address.address_1 ?? " ")")
                WideCustomRow(title: "City", value: "\(viewModel.userModel.currentCareCenter?.address.city ?? " ")")
                WideCustomRow(title: "State, Zip", value: "\(viewModel.userModel.currentCareCenter?.address.state ?? " "), \(viewModel.userModel.currentCareCenter?.address.zip ?? " ")")
                WideCustomRow(title: "Phone", value: "\(viewModel.userModel.currentCareCenter?.phone ?? " ")")
                WideCustomRow(title: "Email", value: "\(viewModel.userModel.currentCareCenter?.email ?? " ")")
            } header: {
                Text("Care Center")
            } footer: {
                HStack {
                    Spacer()
                    Button(action: {
                        self.showPage = "editcarecenter"
                        self.passSheetVisible = true
                    }, label: {
                        Text("edit")
                            .padding(.top, 10)
                    })
                }
            }
            
            
        }
        .listStyle(.inset)
        .sheet(isPresented: self.$passSheetVisible) {
            if(self.showPage == "editcarecenter"){
                EditCareCenterView()
            } else {
                EditProviderView()
            }
            
        }
        /*
        List {
            Section {
                WideCustomRow(title: "First Name", value: "John")
                WideCustomRow(title: "Last Name", value: "Smith")
                WideCustomRow(title: "Address", value: "100 Main")
                WideCustomRow(title: "City", value: "Red Bank")
                WideCustomRow(title: "State, Zip", value: "NJ, 07701")
                WideCustomRow(title: "Phone", value: " ")
            } header: {
                Text("Primary")
            } footer: {
                NavigationLink {
                    EditProviderView()
                } label: {
                    Text("edit")
                        .padding(.leading)
                }
            }
            Section {
                CustomRow(title: "First Name", value: "John")
                CustomRow(title: "Last Name", value: "Smith")
                CustomRow(title: "Address", value: "100 Main")
                CustomRow(title: "Practice", value: "")
                CustomRow(title: "City", value: "Red Bank")
                CustomRow(title: "State, Zip", value: "NJ, 07701")
                CustomRow(title: "Phone", value: " ")
                CustomRow(title: "Email", value: " ")
            } header: {
                Text("Care Center")
            } footer: {
                NavigationLink {
                    EditCareCenterView()
                } label: {
                    Text("edit")
                        .padding(.leading)
                }
            }
        }
        .listStyle(.inset)
        Spacer()
         */
    }
}

#Preview {
    ProviderView()
}
