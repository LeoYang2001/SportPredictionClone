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
                            VStack{
                                HStack{
                                    HStack(alignment:.center){
                                        Text("#")
                                    }.frame(width: 20)
                                    Spacer()
                                    HStack{
                                        Text("Username")
                                    }.frame(width: 120)
                                    Spacer()
                                    HStack(alignment:.center){
                                        Text("W")
                                    }.frame(width: 40)
                                    HStack(alignment:.center){
                                        Text("L")
                                    }.frame(width: 40)
                                    HStack(alignment:.center){
                                        Text("Pts")
                                    }.frame(width: 40)
                                    HStack(alignment:.center){
                                        Text("PCT")
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

//                                HStack{
//                                    Text("Rank")
//                                        .frame(width: 40)
//                                        .padding()
//                                    Text("Username")
//                                        .frame(width: 120)
//                                        .padding()
//                                    Spacer()
//                                    Text("Pts")
//                                        .frame(width: 40)
//                                        .padding()
//                                }.background(
//                                    LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]),
//                                                       startPoint: .leading,
//                                                       endPoint: .trailing)
//                                )
//                                .foregroundStyle(.white)
//                                ForEach(1..<6){
//                                    number in
//                                    HStack{
//                                            Text("\(number)")
//                                                .frame(width: 40)
//                                                .padding()
//                                                .fontWeight(.bold)
//                                        
//                                            HStack{
//                                                ImageDisplay("https://th.bing.com/th/id/OIP.AK78gGIdrrRBVpstKYOa3wHaG_?pid=ImgDet&w=202&h=190&c=7", imgSize: 30)
//                                                    .clipShape(Circle())
//                                                Text("Leo Yang")
//                                            }
//                                                .frame(width: 120)
//                                                .padding()
//                                               
//                                            Spacer()
//                                            Text("30")
//                                                .frame(width: 40)
//                                                .padding()
//                                    }
//                                }
//                                HStack{
//                                    Button {
//                                        
//                                    } label: {
//                                        Text("See More")
//                                            .padding()
//                                            .fontWeight(.bold)
//                                            .foregroundStyle(.blue)
//                                    }
//
//                                }
                                
                            
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

#Preview{
    LeaderBoardView()
}
//
//HStack{
//    HStack(alignment:.center){
//        Text("#")
//    }.frame(width: 20)
//    Spacer()
//    HStack{
//        Text("Username")
//    }
//    Spacer()
//    HStack(alignment:.center){
//        Text("W")
//    }.frame(width: 40)
//    HStack(alignment:.center){
//        Text("D")
//    }.frame(width: 40)
//    HStack(alignment:.center){
//        Text("L")
//    }.frame(width: 40)
//    HStack(alignment:.center){
//        Text("Pts")
//    }.frame(width: 40)
//}.padding()
//    .font(.subheadline)
//    .fontWeight(.bold)
//    .foregroundStyle(.gray)
//
//ForEach(userListViewModel.users.indices, id: \.self) {
//    index in
//    VStack{
//        let user = userListViewModel.users[index]
//        let username = user.UserID.S
//        let points = user.NBAPoints.N
//     
//        LeaderBoardCell(rank: index + 1, username:username , points: points)
//    }
//    .padding(.vertical, 4)
//}


//.overlay(
//    RoundedRectangle(cornerRadius: 16)
//        .stroke(Color.black, lineWidth: 0)
//)
//.foregroundStyle(.black)
//.frame(maxWidth:.infinity)
//.background(Color.white)
//.cornerRadius(16)
//.padding()
//.shadow(color: Color.black.opacity(0.3), radius: 10, x: 2, y: 2)
