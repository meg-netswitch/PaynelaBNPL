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
            if(viewModel.cardLoaded){
                Image("card")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Spacer()
                AddPassToWalletButton {
                    viewModel.getPass()
                    self.passSheetVisible = true
                }
                .frame(width: 300, height: 50)
                Spacer()
            } else {
                if(viewModel.cardLoading){
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.black.opacity(0.5)))
                        .padding(15)
                } else {
                    Button{
                        viewModel.downloadPass()
                    } label: {
                        Text("Get My Card")
                    }
                }
            }
            
            //PageHeading(title: "Card")
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
