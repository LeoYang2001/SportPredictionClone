//
//  APITestView.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 4/9/24.
//

import SwiftUI

struct APITestView: View {
    @ObservedObject var viewModel = NewsViewModel()
    
    var body: some View {
        VStack{
            Button(action: {
                viewModel.fetchArticles()
            }, label: {
                Text("fetch")
            })
            Text("News")
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
