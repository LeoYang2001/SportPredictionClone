//
//  LeaderBoardCell.swift
//  sports_prediction
//
//  Created by 杨嘉煌 on 2/23/24.
//

import SwiftUI

struct LeaderBoardCell: View {
    let rank:Int
    let username:String
    let points:String
    var body: some View {
        HStack{
            HStack(alignment:.center){
                Text("\(rank)")
                    .font(.headline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
            }.frame(width: 20)
            Spacer()
            HStack{
                ImageDisplay("https://th.bing.com/th/id/OIP.AK78gGIdrrRBVpstKYOa3wHaG_?pid=ImgDet&w=202&h=190&c=7", imgSize: 30)
                Text("\(username)")
                    .font(.subheadline)
//                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .frame(width: 80)
                
            }
            Spacer()
            HStack(alignment:.center){
                Text("\(points)")
                    .font(.subheadline)
//                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }.frame(width: 40)
            HStack(alignment:.center){
                Text("\(points)")
                    .font(.subheadline)
//                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }.frame(width: 40)
            HStack(alignment:.center){
                Text("\(points)")
                    .font(.subheadline)
//                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }.frame(width: 40)
            HStack(alignment:.center){
                Text("\(points)")
                    .font(.subheadline)
//                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }.frame(width: 40)
        }.padding(.horizontal)
        Divider()
            .frame(height: 1)
            .background(Color.secondColor(0.4))
    }
}
