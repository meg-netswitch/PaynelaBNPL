//
//  CardView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI
import PassKit

struct CardView: View {
    @State private var passSheetVisible = false
    @StateObject private var viewModel = CardVM()
    var body: some View {
        VStack {
            //PageHeading(title: "Card")
            Spacer()
            Image("card")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .padding()
            Button {
                print("click")
                
            } label: {
                Text("Transactions")
                    .foregroundColor(.white)
                    .frame(width: 150, height: 50)
                    .background(Color.companyButton1)
                    .cornerRadius(5)
            }
            Spacer()
            AddPassToWalletButton {
                /*
                print(newPassLib?.passes() as Any)
                
                print(newPass?.serialNumber)
                print(newPassLib?.passes())
                newPass = newPassLib?.pass(withPassTypeIdentifier: "pass.test.passkit.paynela.netswitch.ai", serialNumber: "E5982H-I2")
                print(newPassLib?.pass(withPassTypeIdentifier: "pass.test.passkit.paynela.netswitch.ai", serialNumber: "E5982H-I2"))
                 */
                viewModel.getPass()
                
                self.passSheetVisible = true
            }
            .frame(width: 300, height: 50)
            Spacer()
        }
        .sheet(isPresented: self.$passSheetVisible) {
            AddPassView(pass: viewModel.passModel.pass)

        }
        
            
    }
}

#Preview {
    CardView()
}
