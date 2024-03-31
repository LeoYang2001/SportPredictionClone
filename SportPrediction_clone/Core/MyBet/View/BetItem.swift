//
//  BetItem.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 3/30/24.
//

import SwiftUI

struct BetItem: View {
    var ifComplete: Bool
    var ifWin: Bool
    var body: some View {
        ZStack{
            VStack{
                if (!ifComplete)
                {
                    HStack{
                        if (ifWin){
                            Text("You won 10 points")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .padding()
                                .foregroundColor(.green)
                        }
                        else{
                            Text("You lost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .padding()
                                .foregroundColor(.red)
                        }
                        Spacer()
                    }
                }
                else{
                    HStack{
                        Text("Your prediction")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding()
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }
               
                HStack{
                    VStack{
                        ImageDisplay("https://assets-sports.thescore.com/basketball/team/13/w72xh72_logo.png", imgSize: 60)
                        Text("MIA Heat")
                            .font(.footnote)
                            .frame(width:100)
                    }
                    
                    VStack{
                        if (!ifComplete){
                            Text("101 : 89")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                        }
                        else{
                            Text("Today")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.green)
                            Text(" 7:00pm")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.green)
                        }
//                        Text("Today")
//                            .font(.footnote)
//                            .foregroundStyle(.white)
//                            .padding(.vertical, 1)
                           
                    }
                    VStack{
                        ImageDisplay("https://assets-sports.thescore.com/basketball/team/8/w72xh72_logo.png", imgSize: 60)
                        Text("DET Pistons")
                            .font(.footnote)
                            .frame(width:100)
                        
                    }
                }
                Spacer()
                HStack{
                    Text("You picked Team MIA")
                        .padding()
                        .foregroundColor(.gray)
                }
               
               
            }
            .frame(height: 200)
            .frame(maxWidth:.infinity)
        }
        .foregroundColor(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black, lineWidth: 0)
        )
        .background(Color.thirdColor(1))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.7), radius: 10, x: 2, y: 2)
       
        
       
        
        
    }
}

#Preview {
    BetItem(ifComplete: true, ifWin: true)
}
