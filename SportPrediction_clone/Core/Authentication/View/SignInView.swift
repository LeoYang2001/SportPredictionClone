//
//  SignUpView.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 3/16/24.
//

import SwiftUI

struct SignInView: View {
    @Binding var loggedIn: Bool
    @Binding var viewState: String
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
       
        GeometryReader{
            geometry in
            VStack{
                Spacer()
                    .frame(height:geometry.size.height * 0.3)
                HStack{
                    Text("Welcome Back")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.green)
                    Spacer()
                }
                .padding(.horizontal)
                HStack{
                    Text("Ready to make your predictions?")
                        .font(.headline)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                .foregroundColor(.gray)
                
                //Email
                TextField("", text: $email, prompt: Text("Email").foregroundColor(Color.gray))
                              .padding()
                              .background(
                                RoundedRectangle(cornerRadius: 8) // Apply corner radius to background
                                    .stroke(Color.green, lineWidth: 3)
                              )
                              .foregroundColor(.white)
                              .cornerRadius(8)
                              .padding(.horizontal)
                              .padding(.bottom, 10)
                
                //Password
                SecureField("", text: $password, prompt: Text("Password").foregroundColor(Color.gray))
                                .padding()
                                .background(
                                  RoundedRectangle(cornerRadius: 8) // Apply corner radius to background
                                      .stroke(Color.green, lineWidth: 3)
                                )
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .padding(.horizontal)
                                .padding(.bottom, 10)
                
                
                HStack{
                    Button(action: {
                        signIn()
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
                .padding(.top, 20)
                .padding(.bottom, 8)
                HStack{
                    Button(action: {
                       
                    }, label: {
                        Text("Forgot your password?")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    })
                }
                
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
            .frame(maxWidth:.infinity)
            
        }
    }
    
    func signIn() {
            // Perform sign-in logic
        print("loggined!...")
            // Update loggedIn state to true
            loggedIn = true
        }
}


