//
//  GameCellView.swift
//  sports_prediction
//
//  Created by 杨嘉煌 on 2/12/24.
//

import SwiftUI

struct GameCellFinished: View {
    
 
    var Game: GameClone

   
    var body: some View {
        VStack{
            HStack(alignment: .center){
                VStack(alignment:.leading){
                    if let edtTimeString = convertToEDT(timeString: Game.date.start) {
                       Text(edtTimeString)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                           
                        } else {
                       Text("Error: Unable to convert time string.")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundStyle(.gray)
                    }
                    VStack{ // Adjust vertical spacing
                        TeamInfo(teamName: Game.teams.visitors.code,
                                 teamImgUrl: Game.teams.visitors.logo,
                                 standing: "25-12, 2nd Eastern")
                        TeamInfo(teamName: Game.teams.home.code,
                                 teamImgUrl: Game.teams.home.logo,
                                 standing: "25-12, 2nd Eastern")
                    }
                }
                .onAppear(){
                    print(Game.date.start)
                    print(type(of: Game.date.start))
                }
//                .frame(height:infinity)
              
                Spacer()
                Spacer()
                
                
                
                
                VStack{
                    Spacer()
                }
//                .frame(height:.infinity)
                
            }
        }
        .padding(.horizontal)
//        .frame(width: .infinity, height: 120)
        Divider()
            .frame(height: 1)
            .background(Color.secondColor(0.4))
    }

}
