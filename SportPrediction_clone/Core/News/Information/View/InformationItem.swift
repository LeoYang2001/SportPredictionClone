//
//  InformationItem.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 3/15/24.
//
//
//"https://library.sportingnews.com/styles/crop_style_16_9_desktop/s3/2024-03/GettyImages-2102959887%20%281%29.jpg?h=920929c4&itok=GFFGT4px"

import SwiftUI

struct InformationItem: View {
    
    let article: NewsArticle
    var body: some View {
        HStack{
            GeometryReader { geometry in
                HStack{
                   VStack{
                       Spacer()
                       infoImgDisplay(article.urlToImage.S, imgSize: 120)
                       Spacer()
                   }
                   .padding(.horizontal, 10)
                    VStack(alignment: .leading, spacing: 10) {
                        Text(article.title.S)
                                   .foregroundColor(.white)
                                   .frame(height: 2 * geometry.size.height / 3 - 20)
                                   .font(.body)
                                   .fontWeight(.semibold)
                                   .multilineTextAlignment(.leading)
                               VStack(spacing: 5) {
                                   Text(article.publishedAt.S)
                                               .formatDate(dateString: article.publishedAt.S)
                                       .foregroundStyle(.gray)
                                       .font(.footnote)
                               }
                               .foregroundColor(.white)
                           }
//                           .frame(width: 2 * geometry.size.width / 3 - 10)
                           .padding(.trailing, 10)
                           
                           Spacer() // Add Spacer to fill remaining space
               }
            }
        }
        .background(Color.forthColor(0.3))
        .cornerRadius(16)
        .frame(height: 140)
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        
    }
}


func infoImgDisplay(_ imageURLString: String, imgSize:CGFloat) -> some View{
    AsyncImage(url: URL(string: imageURLString)) { image in
               image
                   .resizable()
                   .aspectRatio(contentMode: .fill)
           } placeholder: {
               ProgressView()
           }
           .frame(width: imgSize, height: imgSize) // Set your desired size
           .clipShape(RoundedRectangle(cornerRadius: 16)) // Opti
}


struct DateFormatModifier: ViewModifier {
    let dateString: String
    
    func body(content: Content) -> some View {
        Text(formatDate(dateString: dateString))
    }
    
    func formatDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "MMM dd, yyyy"
            return dateFormatter.string(from: date)
        } else {
            return "Invalid Date"
        }
    }
}

extension View {
    func formatDate(dateString: String) -> some View {
        self.modifier(DateFormatModifier(dateString: dateString))
    }
}
