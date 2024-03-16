//
//  LeaderBoardFilterView.swift
//  sports_prediction
//
//  Created by 杨嘉煌 on 2/23/24.
//

import SwiftUI

struct LeaderBoardFilterView: View {
    @State private var selectedFilter: LeaderBoardFilter = .alltime
    @Namespace var animation
    private var filterBarWidth: CGFloat {
        let count = CGFloat(LeaderBoardFilter.allCases.count)
        return UIScreen.main.bounds.width / count  -  26
    }
    
    
    var body: some View {
        HStack{
            ForEach(LeaderBoardFilter.allCases){
                Filter in
                VStack{
                    Text(Filter.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == Filter ? .semibold : .regular)
                        .animation(nil)
                    if selectedFilter == Filter {
                        Rectangle()
                            .foregroundColor(.green)
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
    LeaderBoardFilterView()
}
