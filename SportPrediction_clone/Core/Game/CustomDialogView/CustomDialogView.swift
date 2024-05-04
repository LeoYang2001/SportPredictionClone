//
//  CustomDialogView.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 4/29/24.
//

import SwiftUI

struct CustomDialogView: View {
    
    @Binding var isActive: Bool
    
    let title: String
    let message: String
    let buttonTitle: String
    let action: () -> ()
    
    
    @State private var offset: CGFloat = 1000
    
    var body: some View {
        ZStack{
            Color(.black)
                .opacity(0.2)
                .onTapGesture {
                    close()
                }
            VStack{
                Text(title)
                    .font(.title2)
                    .bold()
                    .padding()
                
                Text(message)
                    .font(.body)
                    
                
                VStack{
                    Button{
                        action()
                    }label:{
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.green)
                            
                            Text("Confirm")
                                .font(.system(size:16, weight: .bold))
                                .foregroundColor(.white)
                                .padding()
                        }
                       
                    }
                    Button{
                        action()
                    }label:{
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.clear)
                            
                            Text("Cancel")
                                .font(.system(size:16, weight: .bold))
                                .foregroundColor(.black)
                                .padding()
                        }
                       
                    }
                }
                .padding(.top)
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay{
                VStack{
                    HStack{
                        Spacer()
                        Button{
                            close()
                        }label: {
                            Image(systemName: "xmark")
                                .font(.title2)
                                .fontWeight(.medium)
                        }
                        .tint(.black)
                    }
                    Spacer()
                }
                .padding()
            }
            .shadow(radius: 20)
            .padding()
            .offset(x: 0, y: offset)
            .onAppear{
                withAnimation(.spring()){
                    offset = 50
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func close() {
        withAnimation(.spring()){
            offset = 1000
            isActive = false
        }
    }
    
    
}

#Preview {
    CustomDialogView( isActive: .constant(true),
        title: "Access photo", message: "This lets you choose which photo you want to add to this project", buttonTitle: "Give Access") {
    }
}
