//
//  ProfileView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileVM()
    @State var showPatient = true

    var body: some View {
        VStack{
            HStack{
                PageHeading(title: "Profile")
                Spacer()
            }
            
            HStack {
                Button {
                    showPatient = true
                } label: {
                    HStack {
                        Spacer()
                        Text("Patient")
                            .padding(.vertical, 5)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .background(showPatient ? Color.companyButton1 : Color.gray)
                     .cornerRadius(5)
                    /*
                    Text("Patient")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 35)
                        .background(showPatient ? Color.paynelaBlue : Color.gray)
                         .cornerRadius(5)
                    */
                }
                .padding(.trailing, 2.5)
                Button {
                    showPatient = false
                } label: {
                    HStack {
                        Spacer()
                        Text("Provider")
                            .padding(.vertical, 5)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .background(showPatient ? Color.gray : Color.companyButton1)
                     .cornerRadius(5)
                    /*
                    Text("Provider")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 35)
                        .background(showPatient ? Color.gray : Color.paynelaBlue)
                        .cornerRadius(5)
                     */
                }
            }
            .padding()
            if(showPatient == true){
                PatientView()
            } else {
                ProviderView()
            }
            
        }
        //.background(Color.paynelaGrey)
        
    }
}

#Preview {
    ProfileView()
}
