//
//  CardView.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import SwiftUI
import PassKit

struct CardView: View {
    
    @StateObject private var viewModel = CardVM()
    var body: some View {
        VStack {
            if(viewModel.cardLoaded){
                CardLoadedView()
            } else {
                ZStack{
                    CardLoadedView()
                        .blur(radius: 5)
                        .disabled(true)
                    VStack{
                        Spacer()
                        Button {
                            if(!viewModel.cardLoading){
                                viewModel.downloadPass()
                            }
                        } label: {
                            VStack {
                                if(viewModel.cardLoading){
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle(tint: Color.black.opacity(0.5)))
                                } else {
                                    Image(systemName: "creditcard")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50)
                                        .padding()
                                    Text("Get My Card")
                                        .bold()
                                        .font(.title2)
                                }
                            }
                        }
                        .frame(width: 180, height: 130)
                        .foregroundStyle(.black)
                        .background(.white)
                        .cornerRadius(10)
                        Spacer()
                        Spacer()
                    }
                        
                }
            }
        }
        
            
    }
}

#Preview {
    CardView()
}
