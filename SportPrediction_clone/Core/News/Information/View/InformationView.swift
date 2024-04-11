////
////  InformationView.swift
////  SportPrediction_clone
////
////  Created by 杨嘉煌 on 3/15/24.
////
//
//import SwiftUI
//
//struct InformationView: View {
//    
//    @ObservedObject var viewModel = NewsViewModel()
//   
//    let informationList = ["Item 1", "Item 2", "Item 3"]
//    
//    var body: some View {
//        VStack{
//            ForEach(viewModel.articles.indices, id: \.self){
//                item in
//                NavigationLink {
//                    DetailNewsView()
//                } label: {
//                    InformationItem()
//                }
//
//            }
//        }
//        .onAppear{
//            viewModel.fetchArticles()
//        }
//    }
//}

//
//  APITestView.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 4/9/24.
//

import SwiftUI

struct InformationView: View {
    @ObservedObject var viewModel = NewsViewModel()
    
    var body: some View {
        VStack{
            ForEach(viewModel.articles.indices, id: \.self) {
                index in
                let article = viewModel.articles[index]
                NavigationLink {
                    DetailNewsView(article: article)
                } label: {
                    InformationItem(article: article)
                }
            }
        }
        .onAppear{
            viewModel.fetchArticles()
        }
    }
}

#Preview {
    APITestView()
}

