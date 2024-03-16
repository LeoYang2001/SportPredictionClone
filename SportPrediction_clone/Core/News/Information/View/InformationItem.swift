//
//  InformationItem.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 3/15/24.
//

import SwiftUI

struct InformationItem: View {
    var body: some View {
        HStack{
            GeometryReader { geometry in
                HStack{
                   VStack{
                       Spacer()
                       infoImgDisplay("https://library.sportingnews.com/styles/crop_style_16_9_desktop/s3/2024-03/nba-plain--97b3a500-22ae-463a-a43f-24f0557702cb.jpeg?h=920929c4&itok=h4nXR5jm", imgSize: 120)
                       Spacer()
                   }
                   .padding(.horizontal, 10)
                    VStack(alignment: .leading, spacing: 10) {
                               Text("DeMar DeRozan career points: Bulls star scores season-high 46 points, climbs NBA all-time scoring list")
                                   .foregroundColor(.white)
                                   .frame(height: 2 * geometry.size.height / 3 - 20)
                                   .font(.body)
                                   .fontWeight(.semibold)
                               VStack(spacing: 5) {
                                   Text("Mar 14, 2024")
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
        .padding()
        
    }
}

#Preview {
    InformationItem()
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
//
//    .resizable()
//    .scaledToFill()
//    .frame(width: geometry.size.width / 3, height: 108)
//    .clipShape(RoundedRectangle(cornerRadius: 16))
//    .overlay(
//        RoundedRectangle(cornerRadius: 16)
//            .stroke(Color.black, lineWidth: 1)
//    )
