//
//  AuthenticationView.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 3/16/24.
//

import SwiftUI
import AVKit

struct AuthenticationView: View {
    @Binding var loggedIn: Bool
    
    @State private var viewState = "welcome"

    var body: some View {
        ZStack{
            VStack{
                PlayerView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            
            GeometryReader { geometry in
                VStack{
                    Spacer()
                    VStack{
                        if viewState == "welcome" {
                            WelcomeView(viewState: $viewState)
                                .transition(.opacity)
                        } else if viewState == "signIn" {
                            SignInView(loggedIn: $loggedIn, viewState: $viewState)
                                .transition(.opacity)
                        }
                        else if viewState == "signUp" {
                           SignUpView(viewState: $viewState)
                                .transition(.opacity)
                       }

                    }
                    .frame(maxWidth:.infinity)
                    .frame(height: viewState == "welcome" ? geometry.size.height * 0.5 : geometry.size.height * 1)

                    .background(
                        ZStack {
                                           LinearGradient(
                                               gradient: Gradient(colors: [.clear, .black]),
                                               startPoint: .top,
                                               endPoint: .center
                                           )
                                           LinearGradient(
                                               gradient: Gradient(colors: [.clear, .clear, .black]),
                                               startPoint: .top,
                                               endPoint: .bottom
                                           )
                                       }
                        )
                    
                }
                
            }
            .frame(maxWidth:.infinity, maxHeight:.infinity)
            .edgesIgnoringSafeArea(.all)
        
        }
    }
    
}



