//
//  ProfileTestView.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 3/16/24.
//

import SwiftUI

struct ProfileTestView: View {
    var body: some View {
        ZStack{
            Color.themeColor(1).ignoresSafeArea()
                .overlay{
                    VStack{
                        HStack{
                            Text("Profile")
                               .font(.title)
                               .fontWeight(.bold)
                                Spacer()
                        }
                        .padding(.horizontal)
                        ProfileImageView(imageSize: 120)
                        HStack{
                            Text("Leo Yang")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        HStack{
                            Button(action: {
                               
                            }) {
                                HStack{
                                    HStack(spacing:10){
                                        Image(systemName: "pencil")
                                        Text( "Edit Profile")
                                    }
                                    .padding(.vertical, 10)
                                    .padding(.horizontal,12)
                                }
                                   .background(
                                    RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.secondColor(1), lineWidth: 3)
                                   )
                                   .foregroundColor(.white)
                                   .cornerRadius(8)
                            }
                        }.padding()
                        HStack{
                            
                            VStack{
                                Text("Total Wins")
                                    .font(.system(size: 16, weight: .regular, design: .default))
                                               .foregroundColor(.gray)
                                               .padding(.vertical,2)
                                Text("120")
                                    .font(.system(size: 24, weight: .bold, design: .default))
                            }
                            .frame(maxWidth: .infinity) // Ensure VStack fills available space evenly
                               .padding()
                            VStack{
                                Text("Overall Rank")
                                    .font(.system(size: 16, weight: .regular, design: .default))
                                               .foregroundColor(.gray)
                                               .padding(.vertical,2)
                                Text("20")
                                    .font(.system(size: 24, weight: .bold, design: .default))
                            }
                            .frame(maxWidth: .infinity) // Ensure VStack fills available space evenly
                               .padding()
                            VStack{
                                Text("Weekly Rank")
                                    .font(.system(size: 16, weight: .regular, design: .default))
                                               .foregroundColor(.gray)
                                               .padding(.vertical,2)
                                Text("10")
                                    .font(.system(size: 24, weight: .bold, design: .default))
                            }
                            .frame(maxWidth: .infinity) // Ensure VStack fills available space evenly
                               .padding()
                            
                        }
                        HStack{
                            Text("Predictions")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        .padding()
                        PredictedPollView()
                        Spacer()
                    }
                    .foregroundColor(.white)
                }
        }
    }
}

#Preview {
    ProfileTestView()
}

struct ProfileImageView: View{
    let imageSize: CGFloat
    var body: some View{
        HStack {
            AsyncImage(url: URL(string: "https://myprofilepicture-leoyang.s3.us-east-2.amazonaws.com/profileImage")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: imageSize, height: imageSize)
            } placeholder: {
                ProgressView()
            }
        }
        .padding()
    }
}
