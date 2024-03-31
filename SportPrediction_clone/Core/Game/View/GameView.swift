//
//  GameView2.swift
//  sports_prediction
//
//  Created by 杨嘉煌 on 2/13/24.
//

import SwiftUI
import Foundation

struct GameView: View {
    @ObservedObject private var viewModel = GameViewModel()
    @StateObject private var userListModel = UserListViewModel()
    @StateObject private var profileViewModel = ProfileViewModel()
    
    @State private var selectedFilter: LeagueFilter = .nba
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
                            Text("Game")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Spacer()
                        })
                        .padding(.horizontal)
                        HStack{
                            ForEach(LeagueFilter.allCases){
                                Filter in
                                VStack{
                                    Text(Filter.title)
                                        .font(.subheadline)
                                        .fontWeight(selectedFilter == Filter ? .semibold : .regular)
                                        .animation(nil)
                                    if selectedFilter == Filter {
                                        Rectangle()
                                            .foregroundColor(.green)
                                            .frame(width: filterBarWidth, height: 2)
                                            .matchedGeometryEffect(id: "item", in: animation)
                                    }else{
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: filterBarWidth, height: 1)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation(.spring()){
                                        selectedFilter = Filter
                                    }
                                }
                            }
                        }.padding(.top)
                        CalendarView()
                        ScrollView{
                            ZStack{
                                VStack{
                                    LazyVStack{
                                        ForEach(viewModel.dummyData_games.indices, id: \.self) {
                                            index in
                                            let game = viewModel.dummyData_games[index]
                                            VStack{
                                                GameCellView(isFinished: false, gameInfo: game.gameInfo, isPredicted: game.gameInfo.isPredicted)
                                                    .padding(.vertical,2)
                                            }
                                            .padding(.vertical, 4)
                                            
                                        }
                                    }
//                                    if(viewModel.dummyData_falsePredictions.count != 0){
//                                        HStack{
//                                            ZStack{
//                                                Rectangle()
//                                                           .fill(Color.gray) // Color of the line
//                                                           .frame(height: 1) // Height of the line
//                                                       
//                                                       Text("Predicted Games")
//                                                           .font(.headline)
//                                                           .foregroundColor(.gray)
//                                                           .padding(.horizontal, 5)
//                                                           .background(Color.themeColor(1))
//                                            }
//                                        }
//                                        LazyVStack{
//                                            ForEach(viewModel.dummyData_games.indices, id: \.self) {
//                                                index in
//                                                let game = viewModel.dummyData_games[index]
//                                                if(game.gameInfo.isPredicted)
//                                                {
//                                                    VStack{
//                                                        GameCellView(isFinished: false, gameInfo: game.gameInfo, isPredicted: game.gameInfo.isPredicted)
//                                                            .padding(.vertical,2)
//                                                    }
//                                                    .padding(.vertical, 4)
//                                                }
//                                            }
//                                        }
//                                    }
                                }
                                
                            }
                         
                        }
                        .onAppear {
                            viewModel.fetchGames()
                        }
                        Spacer()
                        
                    }
                    .foregroundStyle(.white)
                  
                }
        }
        
    }
    
    struct CalendarView: View {
        @State private var date = Date()
        @State private var dateValue = 0
        @State private var formattedDate = ""

        var body: some View {
            HStack {
                Button {
                    if(dateValue > 0)
                    {
                        dateValue -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(dateValue > 0 ? .white : .gray)
                }
                .padding(.horizontal)
                .disabled(dateValue <= 0)
                Spacer()

                Text(formattedDate)
                    .foregroundStyle(.white)
                    .font(.headline)

                Spacer()

                Button {
                    
                    dateValue += 1
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.white)
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, minHeight: 36)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.secondColor(1))
            )
            .padding()
            .onAppear {
                updateFormattedDate()
            }
            .onChange(of: dateValue) { _ in
                updateFormattedDate()
            }
        }

        func updateFormattedDate() {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE MMM d"
            let currentDate = Calendar.current.date(byAdding: .day, value: dateValue, to: date)
            formattedDate = dateFormatter.string(from: currentDate ?? Date())
        }
    }

    

}

#Preview {
    GameView()
}
extension View {
    @ViewBuilder func changeTextColor(_ color: Color) -> some View {
        if UITraitCollection.current.userInterfaceStyle == .light {
            self.colorInvert().colorMultiply(color)
        } else {
            self.colorMultiply(color)
        }
    }
}

