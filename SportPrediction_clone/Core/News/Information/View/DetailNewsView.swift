//
//  DetailNewsView.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 3/23/24.
//

import SwiftUI

struct DetailNewsView: View {
    
    let article: NewsArticle
    init(article: NewsArticle) {
        self.article = article
            // Set the appearance of the navigation bar
            let appearance = UINavigationBarAppearance()
            appearance.setBackIndicatorImage(UIImage(systemName: "chevron.left"), transitionMaskImage: UIImage(systemName: "chevron.left"))
            appearance.buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().standardAppearance = appearance
        }
    var body: some View {
        ZStack{
            Color.themeColor(1).ignoresSafeArea()
                .overlay{
                    VStack{
                        HStack{
                            Text(article.title.S)
                                .font(.title2)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        }.padding()
                        HStack{
                            Text(article.publishedAt.S)
                                        .formatDate(dateString: article.publishedAt.S)
                                .font(.subheadline)
                                .foregroundStyle(Color.secondColor(1))
                            Text(article.author.S)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.green)
                            Spacer()
//                            Text("10 min read")
//                                .font(.subheadline)
//                                .foregroundStyle(Color.secondColor(1))
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                        ScrollView {
                            VStack(alignment: .leading, spacing: 20) {
                                infoImgDisplay(article.urlToImage.S, imgSize: UIScreen.main.bounds.width - 32)
                                    .padding(.horizontal)
                                
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis justo non ex bibendum fringilla ac vitae est. Cras dignissim orci vel risus tristique, ut consectetur justo accumsan. Proin non semper purus. Nullam tempor libero eu ex lobortis, at aliquet metus faucibus. Integer facilisis ex et felis ullamcorper, sit amet suscipit odio feugiat. Vivamus in erat neque. Sed at semper eros. Duis nec risus et lacus tincidunt dictum. Fusce sed lacus nec libero tincidunt varius. Ut vel nisl nec turpis dapibus convallis nec nec nisl. Aliquam erat volutpat. Morbi at tellus hendrerit, volutpat lorem id, consectetur lectus. Vestibulum et purus non felis lacinia aliquam vel vel est. Nam consectetur eleifend tellus id elementum.")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal)
                            }
                        }
                        .padding()
                        Spacer()
                    }
                    .foregroundColor(.white)
                }
        }

    }
}

