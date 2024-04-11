//
//  MyBetView.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 3/30/24.
//

import SwiftUI

struct MyBetView: View {
   
 
    var body: some View {
        ZStack{
            Color.themeColor(1).ignoresSafeArea()
                .overlay{
                    VStack{
                        HStack(content: {
                            Text("My Predictions")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Spacer()
                        })
                        .padding(.horizontal)
                        HStack{
                            MyBetFilterView()
                        }.padding()
                        Spacer()
                        ScrollView{
                           
                                VStack(spacing: 0) {
                                    ForEach(0..<5, id: \.self) { index in
                                        let ifComplete = index != 1 ? true : false
                                        let ifWin = index == 2 ? false : true
                                        
                                        ZStack{
                                            PredictionCardView(ifComplete:ifComplete, ifWin: ifWin)
                                        }
                                        .padding()
                                    }
                                }
                            
                        }
                    }
                }
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    MyBetView()
}
