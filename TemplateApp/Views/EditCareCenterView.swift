//
//  EditCareCenterView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct EditCareCenterView: View {
    @StateObject private var viewModel = EditCareCenterVM()
    @State private var firstname = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            PageHeading(title: "Edit Care Center")
            Form {
                Section(header: Text("Care Center"), footer:
                    HStack {
                    Spacer()
                    Button {
                        viewModel.updateCareCenter()
                        dismiss()
                    } label: {
                        Text("save")
                            .padding(.vertical)
                    }
                }
                ) {
                    TextField("Practice", text: $viewModel.practice)
                    TextField("Address", text: $viewModel.address)
                    TextField("City", text: $viewModel.city)
                    Picker("State", selection: $viewModel.state) {
                        ForEach(viewModel.appModel.statesArr, id: \.abbr){ item in
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
        }
        .background(.white)
    }
}

#Preview {
    EditCareCenterView()
}
