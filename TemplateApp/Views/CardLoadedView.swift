//
//  CardLoadedView.swift
//  TemplateApp
//
//  Created by meg- work on 3/23/24.
//

import SwiftUI
import PassKit

struct CardLoadedView: View {
    @StateObject private var viewModel = CardVM()
    var body: some View {
        VStack{
            Spacer()
            Image("card")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .padding()
            Spacer()
            Spacer()
            AddPassToWalletButton {
                viewModel.getPass()
                viewModel.passSheetVisible = true
            }
            .frame(width: 300, height: 50)
            
        }
        .padding()
        .sheet(isPresented: $viewModel.passSheetVisible) {
            AddPassView(pass: viewModel.passModel.pass)

        }
    }
       
}

#Preview {
    CardLoadedView()
}
