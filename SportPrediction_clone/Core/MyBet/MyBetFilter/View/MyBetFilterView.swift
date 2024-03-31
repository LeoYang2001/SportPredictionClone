//
//  LeaderBoardFilterView.swift
//  sports_prediction
//
//  Created by 杨嘉煌 on 2/23/24.
//

import SwiftUI

struct MyBetFilterView: View {
    @State private var selectedFilter: MyBetFilter = .all
    @Namespace var animation
    private var filterBarWidth: CGFloat {
        let count = CGFloat(MyBetFilter.allCases.count)
        return UIScreen.main.bounds.width / count  -  16
    }
    
    
    var body: some View {
        HStack{
            ForEach(MyBetFilter.allCases){
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
        .frame(maxWidth: .infinity)
        
       
       
        
    }
}

#Preview {
    MyBetFilterView()
}
