//
//  InformationView.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 3/15/24.
//

import SwiftUI

struct InformationView: View {
    let informationList = ["Item 1", "Item 2", "Item 3"]
    
    var body: some View {
        VStack{
            ForEach(informationList, id: \.self){
                item in
                NavigationLink {
                    DetailNewsView()
                } label: {
                    InformationItem()
                }

            }
        }
        
    }
}

#Preview {
    InformationView()
}
