//
//  GameView2.swift
//  sports_prediction
//
//  Created by 杨嘉煌 on 2/13/24.
//

import SwiftUI
import Foundation

struct GameView: View {
    @ObservedObject private var viewModel = NBAViewModel()
    
    @State private var selectedFilter: LeagueFilter = .nba
    @Namespace var animation
    private var filterBarWidth: CGFloat {
        let count = CGFloat(LeagueFilter.allCases.count)
        return UIScreen.main.bounds.width / count  -  26
    }
    
    
    @State private var currentDate = Date()
    
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
                        CalendarView(date: $currentDate)
//                        Button {
//                            viewModel.fetchGames(date: (formatDateToEDT(currentDate)))
//                          
//                        } label: {
//                            Text("fetch game \(formatDateToEDT(currentDate))")
//                        }

                        ScrollView{
                            ZStack{
                                VStack{
                                    LazyVStack{
                                        ForEach(viewModel.games.indices, id: \.self) { index in
                                            let game = viewModel.games[index]
                                            let isFinished = game.status.long == "Finished"
                                            VStack {

                                                GameCellViewClone(Game: game, isFinished: isFinished, isPredicted: true, dummyPredictedPercentage: 0.50)
                                               
                                                }
                                            .padding(.vertical, 5)
                                        }
//                                        ForEach(viewModel.dummyData_games. indices, id: \.self) {
//                                            index in
//                                            let game = viewModel.dummyData_games[index]
//                                            VStack{
//                                                GameCellView(isFinished: false, gameInfo: game.gameInfo, isPredicted: game.gameInfo.isPredicted)
//                                                    .padding(.vertical,2)
//                                            }
//                                            .padding(.vertical, 4)
//                                            
//                                        }
                                    }

                                }
                                
                            }
                         
                        }
                        .onAppear {
                            viewModel.fetchGames(date: "2024-04-13")
                        }
                        .onChange(of: currentDate)
                        {
                            viewModel.fetchGames(date: (formatDateToEDT(currentDate)))
                        }
                        Spacer()
                        
                    }
                    .foregroundStyle(.white)
                  
                }
        }
        
    }
    
    func formatDateToEDT(_ date: Date) -> String {
        // Create a date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        // Set the time zone to Eastern Daylight Time (EDT)
        let easternTimeZone = TimeZone(identifier: "America/New_York")!
        dateFormatter.timeZone = easternTimeZone
        
        // Add one day to the date
        let calendar = Calendar.current
        let nextDay = calendar.date(byAdding: .day, value: 1, to: date)!
        
        // Format the date to string
        let formattedDate = dateFormatter.string(from: nextDay)
        
        return formattedDate
    }

    
    struct CalendarView: View {
        @Binding var date: Date
        @State private var dateValue = 0
        

        var body: some View {
            HStack {
                Button {
                    dateValue -= 1
                    updateDate()
                } label: {
                    Image(systemName: "chevron.left")
//                        .foregroundStyle(dateValue > 0 ? .white : .gray)
                        .foregroundStyle(.white)
                }
                .padding(.horizontal)
//                .disabled(dateValue <= 0)
                Spacer()

                Text(formatDate(date))
                    .foregroundStyle(.white)
                    .font(.headline)

                Spacer()

                Button {
                    
                    dateValue += 1
                    updateDate()
                    
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
        }

        func updateDate() {
               let newDate = Calendar.current.date(byAdding: .day, value: dateValue, to: Date()) ?? Date()
               date = newDate
           }
        func formatDate(_ date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E MMM d"
            return dateFormatter.string(from: date)
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

