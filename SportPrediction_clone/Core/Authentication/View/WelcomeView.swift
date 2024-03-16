//
//  WelcomeView.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 3/16/24.
//

import SwiftUI

struct WelcomeView: View{
    
    @Binding var viewState: String
    
    var body: some View{
        HStack{
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40,height: 40)
        }
        HStack{
            Text("become the master of your predictions. Are you ready to conquer the game?")
                .multilineTextAlignment(.center)
        }
        .padding()
        .foregroundColor(.gray)
        HStack{
            Button(action: {
                withAnimation {
                   viewState = "signIn"
               }
            }, label: {
                Text("Sign In")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 140)
                    .foregroundColor(Color.themeColor(1))
            })
            .background(
                .green
            )
            .cornerRadius(8)
        }
        .padding(.vertical, 20)
        Spacer()
        VStack{
            Text("Haven't signed up yet?")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Button {
                withAnimation {
                       viewState = "signUp"
                   }
            } label: {
                Text("Sign Up")
                    .foregroundColor(.green)
                    .font(.headline)
                    .fontWeight(.semibold)
            }

        }
        Spacer()
            .frame(height:40)
       
    }
}
