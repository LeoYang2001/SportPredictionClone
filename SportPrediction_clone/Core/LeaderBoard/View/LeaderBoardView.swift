//
//  LeaderBoardView.swift
//  sports_prediction
//
//  Created by 杨嘉煌 on 2/23/24.
//

import SwiftUI

struct LeaderBoardView: View {
    
    @State private var selectedFilter: LeagueFilter = .nba
    @ObservedObject private var userListViewModel = UserListViewModel()
    @Namespace var animation
    private var filterBarWidth: CGFloat {
        let count = CGFloat(LeagueFilter.allCases.count)
        return UIScreen.main.bounds.width / count  -  26
    }
    
    var body: some View {
        ZStack{
            Color.themeColor(1).ignoresSafeArea()
                .overlay{
                    VStack{
                        HStack(content: {
                            Text("Leader Board")
                                .font(.title)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Spacer()
                        }).padding(.horizontal)
                        
                        HStack{
                            LeaderBoardFilterView()
                        }.padding(.top)
                        
                        LazyVStack{
                            HStack{
                                HStack(alignment:.center){
                                    Text("#")
                                }.frame(width: 20)
                                Spacer()
                                HStack{
                                    Text("Username")
                                }
                                Spacer()
                                HStack(alignment:.center){
                                    Text("W")
                                }.frame(width: 40)
                                HStack(alignment:.center){
                                    Text("D")
                                }.frame(width: 40)
                                HStack(alignment:.center){
                                    Text("L")
                                }.frame(width: 40)
                                HStack(alignment:.center){
                                    Text("Pts")
                                }.frame(width: 40)
                            }.padding()
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundStyle(.gray)
                           
                            ForEach(userListViewModel.users.indices, id: \.self) {
                                index in
                                VStack{
                                    let user = userListViewModel.users[index]
                                    let username = user.UserID.S
                                    let points = user.NBAPoints.N
                                 
                                    LeaderBoardCell(rank: index + 1, username:username , points: points)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                        Spacer()
                    }
                }
                
        }
        .foregroundStyle(.white)
        .onAppear{
            userListViewModel.fetchUserList()
        }
    }
}

