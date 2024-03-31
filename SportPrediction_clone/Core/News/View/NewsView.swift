//
//  NewsView.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 3/14/24.
//

import SwiftUI

struct NewsView: View {
    
    @State private var selectedFilter: LeagueFilter = .nba
    @Namespace var animation
    private var filterBarWidth: CGFloat {
        let count = CGFloat(LeagueFilter.allCases.count)
        return UIScreen.main.bounds.width / count  -  26
    }
    
    private let carouselItems = [
            CarouselItem(image: "image1", title: "Title 1", description: "Description 1"),
            CarouselItem(image: "image2", title: "Title 2", description: "Description 2"),
            CarouselItem(image: "image3", title: "Title 3", description: "Description 3")
        ]
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.themeColor(1).ignoresSafeArea()
                    .overlay{
                        VStack{
                            HStack(content: {
                                Text("Home")
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
                            HStack{
                                Text("Live Matches")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            .padding()
                            VStack{
                                CarouselView(items: carouselItems, carouselItemWidthSub:80, carouselItemPadding: 20)
                            }
                            
                            
                            HStack{
                                Text("News")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.top)
                            ScrollView{
                               InformationView()
                            }
                            
                        }
                        .foregroundColor(.white)
                    }
            }
        }
    }
}

#Preview {
    NewsView()
}


//HStack{
//    Text("Your Predictions")
//        .font(.title2)
//        .fontWeight(.semibold)
//    Spacer()
//}
//.padding()
//HStack{
//    PredictedPollView()
//}
//Spacer()



