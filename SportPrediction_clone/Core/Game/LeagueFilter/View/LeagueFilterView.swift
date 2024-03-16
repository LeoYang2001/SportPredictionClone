//
//  LeagueFilterView.swift
//  sports_prediction
//
//  Created by 杨嘉煌 on 2/13/24.
//

import SwiftUI

struct LeagueFilterView: View {
    
    @State private var selectedFilter: LeagueFilter = .nba
    @Namespace var animation
    private var filterBarWidth: CGFloat {
        let count = CGFloat(LeagueFilter.allCases.count)
        return UIScreen.main.bounds.width / count  -  26
    }
    
    
    var body: some View {
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
                            .foregroundColor(.black)
                            .frame(width: filterBarWidth, height: 1)
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
        }
       
       
        
    }
}


#Preview {
    LeagueFilterView()
}
