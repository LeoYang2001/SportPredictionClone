//
//  SignUpView.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 3/16/24.
//

import SwiftUI

struct SignUpView: View {
    @Binding var viewState: String
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var cfmPassword: String = ""
    
    
    var body: some View {
       
        GeometryReader{
            geometry in
            VStack{
                Spacer()
                    .frame(height:geometry.size.height * 0.3)
                HStack{
                    Text("Welcome To Predictor")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.green)
                    Spacer()
                }
                .padding(.horizontal)
                HStack{
                    Text("Join us and become a prediction master!")
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
                
                SecureField("", text: $cfmPassword, prompt: Text("Confirm Passowrd").foregroundColor(Color.gray))
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
                      
                    }, label: {
                        Text("Sign Up")
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
               
                
                Spacer()
                VStack{
                    Text("Already have an account?")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Button {
                        withAnimation {
                               viewState = "signIn"
                           }
                    } label: {
                        Text("Sign In")
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
}


