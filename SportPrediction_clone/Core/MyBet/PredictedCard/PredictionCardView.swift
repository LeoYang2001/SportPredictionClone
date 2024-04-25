//
//  PredictionCardView.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 4/10/24.
//

import SwiftUI

struct PredictionCardView: View {
    var ifComplete: Bool
    var ifWin: Bool
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    VStack{
                        Spacer()
                        ZStack{
                            Circle()
                                .foregroundStyle(.white)
                                .frame(width: 70, height: 70)
                            ImageDisplay("https://assets-sports.thescore.com/basketball/team/13/w72xh72_logo.png", imgSize: 65)
                           
                        }

                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    Spacer()
                    VStack{
                        
//                        Image("NBAlogo")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 35, height: 35)
//                            .padding()
                        Text("NBA")
                            .font(.title)
                            .foregroundStyle(.white)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.top)
                       Spacer()
                        if(ifComplete)
                        {
                            HStack{
                                Text("110")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.semibold)
                                Spacer()
                                Text("104")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.semibold)
                            }
                            Spacer()
                        }
                        else{
                            VStack{
                                Text("Today 7:00pm")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)

                            }
//                            .padding(.horizontal,20)
                            Spacer()
                        }
                       
                        ZStack{
                            Text("Picked MIA")
                                .font(.subheadline)
                                .padding(.vertical,8)
                                .padding(.horizontal,12)
                                .background(
                                 RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.secondColor(0.38))
                                )
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.vertical)
                    }
                    Spacer()
                    VStack{
                        Spacer()
                        ZStack{
                            Circle()
                                .foregroundStyle(.white)
                                .frame(width: 70, height: 70)
                            ImageDisplay("https://assets-sports.thescore.com/basketball/team/8/w72xh72_logo.png", imgSize: 65)
                           
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                }
            }
            .frame(height: 200)
            .frame(maxWidth:.infinity)
            if(ifComplete)
            {
                Rectangle()
                    .foregroundColor(ifWin ? .green : .red)
                       .frame(height: 50)
                       .frame(maxWidth:.infinity)
                       .offset(y: 120) // Adjust the offset to position the rectangle properly
                       .zIndex(1)
            }
        }
        .foregroundColor(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black, lineWidth: 0)
        )
        .background(Color.secondColor(0.45))
        .cornerRadius(32)
        .shadow(color: Color.black.opacity(0.7), radius: 10, x: 2, y: 2)
       
        
       
        
        
    }
}

#Preview {
    PredictionCardView(ifComplete: false, ifWin: false)
}
