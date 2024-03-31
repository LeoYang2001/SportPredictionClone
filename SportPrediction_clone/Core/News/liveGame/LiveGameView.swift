//
//  LiveGameView.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 3/23/24.
//

import SwiftUI

struct LiveGameView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let teamImgSize:CGFloat = 80
    
    
    var body: some View {
        ZStack{
            Color.themeColor(1).ignoresSafeArea()
                .overlay{
                    VStack{
                        HStack{
                            Spacer()
                            Button(action: {
                                print("Close")
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Image(systemName: "multiply")
                                    .font(.system(size: 28))
                                   
                            })
                        }
                        .padding(.horizontal)
                        HStack{
                            Text("Live")
                                .font(.title3)
                                .foregroundColor(.white)
                                                   .fontWeight(.semibold)
                                .padding(.vertical,4)
                                .padding(.horizontal,8)
                        }
                        .background(.red)
                        .cornerRadius(6)
                      
                        HStack{
                            Text("UEFA Champion Leagew")
                                .font(.title)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                        .padding()
                        HStack{
                            Text("Group stage · Matchday 2 of 6")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.secondColor(1))
                            
                        }
                        HStack{
                            VStack{
                                Image("team_tth")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: teamImgSize, height: teamImgSize)
                                    .padding()
                                Text("Tottenham")
                                    .font(.title3)
                            }
                            Spacer()
                            VStack{
                                Text("1 : 1")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("21'")
                                    .font(.subheadline)
                                    .foregroundStyle(Color.secondColor(1))
                                    .padding(.vertical, 2)
                            }
                            Spacer()
                            VStack{
                                Image("team_psg")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: teamImgSize, height: teamImgSize)
                                    .padding()
                                Text("PSG")
                                    .font(.subheadline)
                            }
                            
                            
                        }
                        .padding()
                        ScrollView{
                            VStack{
                                HStack{
                                    VStack{
                                        CircularProgressView(percentage: 40, circleSize: 50, strokeWidth: 8, barColor: Color.red)
                                        Text("54")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundStyle(.red)
                                    }
                                    Spacer()
                                    VStack{
                                        HStack
                                        {
                                            Text("23")
                                                .font(.headline)
                                                .fontWeight(.bold)
                                            Text("Attacks")
                                                .font(.headline)
                                                .fontWeight(.bold)
                                                .frame(width: 80)
                                                .foregroundColor(Color.secondColor(1))
                                            Text("14")
                                                .font(.headline)
                                                .fontWeight(.bold)
                                        }
                                        HStack
                                        {
                                            Text("154")
                                                .font(.headline)
                                                .fontWeight(.bold)
                                            Text("Passing")
                                                .font(.headline)
                                                .fontWeight(.bold)
                                                .foregroundColor(Color.secondColor(1))
                                                .frame(width: 80)
                                            Text("189")
                                                .font(.headline)
                                                .fontWeight(.bold)
                                        }
                                        HStack
                                        {
                                            Text("17")
                                                .font(.headline)
                                                .fontWeight(.bold)
                                            Text("Shooting")
                                                .font(.headline)
                                                .fontWeight(.bold)
                                                .frame(width: 80)
                                                .foregroundColor(Color.secondColor(1))
                                            Text("38")
                                                .font(.headline)
                                                .fontWeight(.bold)
                                        }
                                    }
                                    Spacer()
                                    VStack{
                                       
                                        CircularProgressView(percentage: 46, circleSize: 50, strokeWidth: 8, barColor: Color.blue)
                                        Text("46")
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundStyle(.blue)
                                        
                                    }
                                }
                                .padding()
                                .background(
                                 RoundedRectangle(cornerRadius: 8)
                                 .stroke(Color.secondColor(1), lineWidth: 2)
                                )
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .padding()
                                
                                
                                VStack{
                                    HStack{
                                        Text("Statistics")
                                            .font(.title3)
                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        Spacer()
                                        Text("See all")
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(Color.secondColor(1))
                                            
                                    }.padding(.bottom)
                                    VStack{
                                        HStack{
                                            Text("40%")
                                            Spacer()
                                            Text("Attacks")
                                            Spacer()
                                            Text("60%")
                                        }
                                        .foregroundStyle(Color.gray)
                                        HStack{
                                            StickProgressBar(percentage: 40, width: 120, height: 100, barColor:.red)
                                            Spacer()
                                            StickProgressBar(percentage: 60, width: 120, height: 100,barColor:.blue)
                                        }
                                        HStack{
                                            Text("40%")
                                            Spacer()
                                            Text("Passing")
                                            Spacer()
                                            Text("60%")
                                        }
                                        .foregroundStyle(Color.gray)
                                        HStack{
                                            StickProgressBar(percentage: 20, width: 120, height: 100, barColor:.red)
                                            Spacer()
                                            StickProgressBar(percentage: 80, width: 120, height: 100,barColor:.blue)
                                        }
                                    }
                                }
                                .padding()
                                .background(
                                 RoundedRectangle(cornerRadius: 8)
                                 .stroke(Color.secondColor(1), lineWidth: 2)
                                )
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .padding()
                                
                            }
                        }
                        Spacer()
                        
                    }
                    .foregroundColor(.white)
                }
        }
    }
}

#Preview {
    LiveGameView()
}

struct CircularProgressView: View {
    var percentage: Double // Input percentage (0 - 100)
    var circleSize: CGFloat
    var strokeWidth: CGFloat
    var barColor: Color

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: strokeWidth)
                .opacity(0.3)
                .foregroundColor(Color.gray)
                .frame(width: circleSize, height: circleSize)

            Circle()
                .trim(from: 0.0, to: CGFloat(min(percentage / 100, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(barColor)
                .rotationEffect(Angle(degrees: -90))
                .frame(width: circleSize, height: circleSize)
                .animation(.linear)
                .padding(2)
            Image(systemName: "soccerball")
                .font(.system(size: 26))
        }
        .padding(.horizontal,2)
        .padding(.vertical)
    }
}

struct StickProgressBar: View {
    var percentage: Double
    var width: CGFloat
    var height: CGFloat
    var ifLeft:Bool = true
    var barColor:Color

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: width, height: 4)
                .opacity(0.3)
                .foregroundColor(Color.white)

            Rectangle()
                .frame(width: width * CGFloat(min(percentage / 100, 1.0)), height: 4 )
                .foregroundColor(barColor)
                .animation(.linear)
        }
    }
}
