//
//  GameCellView.swift
//  sports_prediction
//
//  Created by 杨嘉煌 on 2/12/24.
//

import SwiftUI

struct GameCellView: View {
    
    @ObservedObject var viewModel: GameCellViewModel
    @StateObject var profileViewModel = ProfileViewModel()
  
    var isFinished: Bool
    var gameInfo: GameInfo
    var gameID: String
    var isPredicted: Bool
    var dummyPredictedPercentage: Float = 0.6
    
    init(isFinished: Bool, gameInfo: GameInfo, isPredicted: Bool) {
           self.isFinished = isFinished
           self.gameInfo = gameInfo
           self.gameID = gameInfo.id // Assuming your GameInfo has a property gameID
           self.viewModel = GameCellViewModel()
        self.isPredicted = isPredicted
       }
    
    var body: some View {
        VStack{
            HStack(alignment: .center){
                VStack(alignment:.leading){
                    GameTime(gameStartTime:"19:00:00", isPredicted:false)
                   
                    VStack{ // Adjust vertical spacing
                           TeamInfo(teamName: gameInfo.teamInfo.teamA.name,
                                    teamImgUrl: gameInfo.teamInfo.teamA.img,
                                    standing: gameInfo.teamInfo.teamA.standing)
                           TeamInfo(teamName: gameInfo.teamInfo.teamB.name,
                                    teamImgUrl: gameInfo.teamInfo.teamB.img,
                                    standing: gameInfo.teamInfo.teamB.standing)
                       }                }
//                .frame(height:infinity)
              
                Spacer()
                if isFinished {
                    VStack{
                        headerText("Score")
                        Spacer()
                        VStack{
                            Spacer()
                            HStack{
                                Text("110 : 99")
                            }
                            Spacer()
                        }
                    }
                    .frame(height:.infinity)
                    .padding(.horizontal)
                }
                Spacer()
                
                
                
                
                VStack{
                    if !isPredicted{
                        headerText("Prediction")
                    }else{
                        headerText("Your Prediction")
                    }
                    Spacer()
                    VStack(spacing: 20){
                        if !viewModel.ifPredicted && !isPredicted {
                            VStack{
                                Button(action: {
                                    handleVote("TeamA")
                                }, label: {
                                    VoteBtn(gameInfo.teamInfo.teamA.name)
                                })
                            }
                            
                            VStack{
                                Button(action: {
                                    handleVote("TeamB")
                                }, label: {
                                    VoteBtn(gameInfo.teamInfo.teamB.name)
                                })
                            }
                        }
                        else{
                            if isPredicted{
                                Spacer()
                                HStack{
                                    Text("You picked \(splitName(gameInfo.teamInfo.teamB.name) ?? "error ")")
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.gray)
                                    
//                                    VotedBtn(voteRatio: dummyPredictedPercentage, ifVoted: true, ifPredicted: isPredicted)
                                    
                                }
                                Spacer()
                              
                            }else{
                                VotedBtn(voteRatio: viewModel.voteRatio, ifVoted: viewModel.ifVoteForTeamA, ifPredicted: isPredicted)
                                
                                VotedBtn(voteRatio: 1 - viewModel.voteRatio, ifVoted: !viewModel.ifVoteForTeamA, ifPredicted: isPredicted)
                            }
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
    
    func handleVote(_ teamName: String){
        let winTeam = teamName == "TeamA" ? "teamA" : "teamB"
        viewModel.sendPrediction(gameID: gameID, teamName: teamName)
        viewModel.voteForTeamByUser(userID: profileViewModel.newName, gameID: gameID, winTeam: winTeam)
    }
       
}

struct TeamInfo: View{
    
    var teamName: String
    var teamImgUrl: String
    var standing: String
    
    var body: some View{
        HStack{
            HStack{
                ImageDisplayWithoutCutting(teamImgUrl,imgSize:32)
            }
            .frame(width: 55, height: 35)
            
//            Spacer()
            VStack(alignment: .leading){
                Text(teamName)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.subheadline)
                if let (teamRecord, teamStanding) = splitStanding(standing) {
                                    HStack {
                                        Text(teamRecord)
                                            .font(.footnote)
                                        Text(teamStanding)
                                            .font(.system(size: 12))
                                            .foregroundStyle(.gray)
                                    }
                    }

            }
            Spacer()
        }
        .frame(width: .infinity)

        
    }
    
    
}



func splitStanding(_ standing: String) -> (teamRecord: String, teamStanding: String)? {
      let components = standing.components(separatedBy: ", ")
      
      guard components.count == 2 else {
          // Invalid format, return nil or handle accordingly
          return nil
      }
      
      let teamRecord = components[0]
      let teamStanding = components[1]
      
      return (teamRecord, teamStanding)
  }
func splitName(_ name: String) -> (String)? {
      let components = name.components(separatedBy: " ")
      guard components.count == 2 else {
          // Invalid format, return nil or handle accordingly
          return nil
      }
   
      return components[1]
  }

func headerText(_ text: String) -> some View{
    Text(text)
        .font(.footnote)
        .fontWeight(.semibold)
        .foregroundStyle(.gray)
}

func TeamName(_ text: String) -> some View{
    Text(text)
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(.white)
}

func VoteBtn(_ text: String) -> some View{
    Text(text)
        .padding(.vertical,8)
        .foregroundStyle(.white)
        .frame(width: 80, height: .infinity)
        .background{
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.secondColor(0.4))
                .stroke(Color.secondColor(1))
        }
}

struct VotedBtn: View {
    var voteRatio: Float
    var ifVoted: Bool
    var ifPredicted: Bool

    @State private var animatedWidth: CGFloat = 0

    var body: some View {
        VStack{
            Button(action: {
            
            }, label: {
                Text("")
                    .padding(.vertical,8)
                    .foregroundStyle(.white)
                    .frame(width: 80, height: .infinity)
                    .background{
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.secondColor(0.4))
                            .stroke(Color.secondColor(1))
                    }
                    .overlay{
                        GeometryReader { geometry in
                            RoundedRectangle(cornerRadius: 12)
                                .fill(ifVoted ? .green : .red)
                                .frame(width: animatedWidth)
                                .padding(1)
                                .onAppear {
                                    withAnimation(.easeInOut(duration: 0.8)) {
                                        animatedWidth = geometry.size.width * CGFloat(voteRatio)
                                    }
                                }
                        }
                    }
            })
            .disabled(ifPredicted)
        }
    }
}



func ImageDisplay(_ imageURLString: String, imgSize:CGFloat) -> some View{
    AsyncImage(url: URL(string: imageURLString)) { image in
               image
                   .resizable()
                   .aspectRatio(contentMode: .fill)
           } placeholder: {
               ProgressView()
           }
           .frame(width: imgSize, height: imgSize)
           .clipShape(Circle())
}

func ImageDisplayWithoutCutting(_ imageURLString: String, imgSize:CGFloat) -> some View{
    AsyncImage(url: URL(string: imageURLString)) { image in
               image
                   .resizable()
                   .aspectRatio(contentMode: .fill)
           } placeholder: {
               ProgressView()
           }
           .frame(width: imgSize, height: imgSize)
    
            
}
