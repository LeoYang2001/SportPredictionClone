//
//  NewsViewModel.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 4/9/24.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles: [NewsArticle] = []
 
    
    func fetchArticles() {
        print("fetching news")
        let lambdaEndpoint = "https://xvs8qrpp40.execute-api.us-east-2.amazonaws.com/dev"  // Replace with your actual Lambda function endpoint

       guard let url = URL(string: lambdaEndpoint) else {
           // Handle invalid URL
           return
       }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let newsResponse = try decoder.decode(NewsResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.articles = newsResponse.body
                        print(self.articles)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("Error fetching user list: \(error.localizedDescription)")
            }
        }.resume()
    }
}


