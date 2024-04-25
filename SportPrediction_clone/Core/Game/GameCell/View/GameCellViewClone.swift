//
//  GameCellView.swift
//  sports_prediction
//
//  Created by 杨嘉煌 on 2/12/24.
//

import SwiftUI

struct GameCellViewClone: View {
    
 
    var Game: GameClone
    var isFinished: Bool = true
  
    var isPredicted: Bool = false
    var dummyPredictedPercentage: Float = 0.6
    
    
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
                        TeamInfo(teamName: Game.teams.visitors.name,
                                ifHome: true
                        )
                        TeamInfo(teamName: Game.teams.home.name,
                                 ifHome: false)
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
//                    if !isPredicted{
//                        headerText("Prediction")
//                    }else{
//                        headerText("Your Prediction")
//                    }
                    Spacer()
                    VStack(spacing: 20){
                        VStack{
                            Button(action: {
//                                handleVote("TeamA")
                            }, label: {
                                VoteBtn(Game.teams.visitors.code)
                               
                            })
                        }
                        
                        VStack{
                            Button(action: {
//                                handleVote("TeamB")
                            }, label: {
                                VoteBtn(Game.teams.home.code)
//                                VoteBtn("Pick")
                            })
                        }
                    }

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
    
//    func handleVote(_ teamName: String){
//        let winTeam = teamName == "TeamA" ? "teamA" : "teamB"
//        viewModel.sendPrediction(gameID: "dummy", teamName: teamName)
//        viewModel.voteForTeamByUser(userID: profileViewModel.newName, gameID: gameID, winTeam: winTeam)
//    }
    
       
}

func convertToEDT(timeString: String) -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

    if let date = dateFormatter.date(from: timeString) {
        dateFormatter.timeZone = TimeZone(abbreviation: "EDT")
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    return nil
}
