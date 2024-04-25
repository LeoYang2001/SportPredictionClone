//
//  PredictedCardCloneView.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 4/25/24.
//

import SwiftUI

struct PredictedCardCloneView: View {
    
    var ifComplete: Bool
    var ifWin: Bool
    
    var body: some View {
        VStack{
            HStack{
                Text("Thu Apr 23, 10:00pm")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .fontWeight(.semibold)
                Spacer()
                if(ifComplete)
                {
                    Image(systemName: "trophy.fill")
                        .foregroundColor(ifWin && ifComplete  ? Color.yellow : Color.gray)
                }
            }
            .padding(.top)
            .padding(.horizontal)
            Spacer()
            if(ifComplete)
            {
                HStack{
                    HStack{
                        Text("Lakers")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                            .frame(width: 100)
                            .foregroundStyle(.white)
                        HStack{
                            Text("Home")
                                .font(.footnote)
                                .padding(.vertical,2)
                                .padding(.horizontal,2)
                                .background(
                                 RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.red)
                                )
                                .foregroundColor(.white)
                               
                        }
                        Spacer()
                        Text("101")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                            .foregroundStyle(.white)
                    }
                }
                HStack {
                    HStack{
                        Text("")
                        .frame(width: 85)
                    }
                    Spacer()
                    HStack{
                        Text("vs")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                            .padding(.horizontal, 10)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color.gray)
                    }
                    
                        
                }
                .padding(.horizontal)
                
                HStack{
                    HStack{
                        Text("Nuggets")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                            .frame(width: 100)
                            .foregroundStyle(.white)
                        HStack{
                            Text("Guest")
                                .font(.footnote)
                                .padding(.vertical,2)
                                .padding(.horizontal,2)
                                .background(
                                 RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.blue)
                                )
                                .foregroundColor(.white)
                               
                        }
                        Spacer()
                        Text("102")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                            .foregroundStyle(.white)
                    }
                }
            }
            else{
                HStack{
                    VStack{
                        
                      
                        Text("Lakers")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                            .frame(width: 150)
                            .foregroundStyle(.white)
                        HStack{
                            Text("Home")
                                .font(.subheadline)
                                .padding(.vertical,2)
                                .padding(.horizontal,4)
                                .background(
                                 RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.red)
                                )
                                .foregroundColor(.white)
                               
                        }
                        
                    }
                    VStack{
                        Text("")
                        Spacer()
                        Rectangle()
                            .frame(width: 1, height: 20)
                                   .foregroundColor(Color.black)
                        Spacer()
                        
                        Text("LAL")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.vertical,2)
                            .padding(.horizontal,4)
                            .background(
                             RoundedRectangle(cornerRadius: 2)
                                .fill(Color.red)
                            )
                            .foregroundColor(.white)
                            .cornerRadius(4)
                    }
                    .padding(.bottom)
                    VStack{
                        Text("Nuggets")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                            .frame(width: 150)
                            .foregroundStyle(.white)
                        HStack{
                            Text("Visitor")
                                .font(.subheadline)
                                .padding(.vertical,2)
                                .padding(.horizontal,4)
                                .background(
                                 RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.blue)
                                )
                                .foregroundColor(.white)
                               
                        }
                        
                    }
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 220)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(ifWin && ifComplete ? Color.yellow :Color.secondColor(0.45), lineWidth: 4)
        )
        .background(Color.secondColor(0.45))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.7), radius: 10, x: 2, y: 2)
    }
}

#Preview {
    PredictedCardCloneView(ifComplete: false, ifWin: true)
}
