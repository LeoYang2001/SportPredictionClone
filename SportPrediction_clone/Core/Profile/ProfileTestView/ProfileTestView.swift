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
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                HStack{
                                    Image(systemName: "rectangle.portrait.and.arrow.right")
                                    Text("Logout")
                                }
                            })
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
                        }.padding(.vertical, 30)
                        HStack{
                            DropdownView(options: ["NBA","NFL","NCAA"])
                            Spacer()
                            DropdownView(options: ["All Time","NFL","NCAA"])
                        }
                        .padding()
                        HStack{
                            VStack{
                                Text("Rank")
                                    .font(.system(size: 16, weight: .regular, design: .default))
                                               .foregroundColor(.gray)
                                               .padding(.vertical,2)
                                Text("6")
                                    .font(.system(size: 24, weight: .bold, design: .default))
                            }
                            .frame(maxWidth: .infinity) // Ensure VStack fills available space evenly
                               .padding()
                            VStack{
                                Text("Wins")
                                    .font(.system(size: 16, weight: .regular, design: .default))
                                               .foregroundColor(.gray)
                                               .padding(.vertical,2)
                                Text("3")
                                    .font(.system(size: 24, weight: .bold, design: .default))
                            }
                            .frame(maxWidth: .infinity) // Ensure VStack fills available space evenly
                               .padding()
                            VStack{
                                Text("Losses")
                                    .font(.system(size: 16, weight: .regular, design: .default))
                                               .foregroundColor(.gray)
                                               .padding(.vertical,2)
                                Text("5")
                                    .font(.system(size: 24, weight: .bold, design: .default))
                            }
                            .frame(maxWidth: .infinity) // Ensure VStack fills available space evenly
                               .padding()
                           
                            
                        }
                        HStack{
                            VStack{
                                Text("Points")
                                    .font(.system(size: 16, weight: .regular, design: .default))
                                               .foregroundColor(.gray)
                                               .padding(.vertical,2)
                                Text("30")
                                    .font(.system(size: 24, weight: .bold, design: .default))
                            }
                            .frame(maxWidth: .infinity) // Ensure VStack fills available space evenly
                               .padding()
                            VStack{
                                Text("Percentile")
                                    .font(.system(size: 16, weight: .regular, design: .default))
                                               .foregroundColor(.gray)
                                               .padding(.vertical,2)
                                Text("0.00")
                                    .font(.system(size: 24, weight: .bold, design: .default))
                            }
                            .frame(maxWidth: .infinity) // Ensure VStack fills available space evenly
                               .padding()
    
                            
                        }
//                        HStack{
//                            Text("Predictions")
//                                .font(.title2)
//                                .fontWeight(.semibold)
//                            Spacer()
//                        }
//                        .padding()
//                        PredictedPollView()
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

struct profileDataItemView: View{
    let dataName:String
    let dataNum:Int
    var body: some View{
        VStack{
            HStack{
                Text(dataName)
                    .fontWeight(.semibold)
                    .font(.subheadline)
                Spacer()
            }
            .padding()
            Spacer()
            HStack{
               Spacer()
                Text("\(dataNum)")
                    .fontWeight(.semibold)
                    .font(.title)
            }
            .padding()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black, lineWidth: 0)
        )
        .frame(width:120, height: 120)
        .background(Color.thirdColor(1))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 2, y: 2)
    }
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
