//
//  PredictedPollView.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 3/15/24.
//

import SwiftUI

struct PredictedPollView: View {
    
    private let carouselItems = [
            CarouselItem(image: "image1", title: "Title 1", description: "Description 1"),
            CarouselItem(image: "image2", title: "Title 2", description: "Description 2"),
            CarouselItem(image: "image3", title: "Title 3", description: "Description 3")
        ]
    
    var body: some View {
        HStack{
            PredictedPollCarouselView(items: carouselItems, carouselItemWidthSub:120, carouselItemPadding: 20)
        }
    }
}

#Preview {
    PredictedPollView()
}


struct PredictedPollCarouselView: View {
    @State private var selectedIndex = 0
    var items: [CarouselItem]
    @GestureState private var dragOffset: CGSize = .zero
    let carouselItemWidthSub: CGFloat
    let carouselItemPadding: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                ForEach(items.indices) { index in
                    ZStack{
                        PredictedPollItemView(item: items[index], itemWidth: geometry.size.width - carouselItemWidthSub)
                            .frame(width: geometry.size.width - carouselItemWidthSub)
                    }
                    .padding(.horizontal, carouselItemPadding)
                }
            }
            .offset(x: -CGFloat(selectedIndex) * (geometry.size.width - (carouselItemWidthSub - 2*carouselItemPadding)))
            .offset(x: dragOffset.width)
            .animation(.easeInOut)
            .gesture(
                DragGesture()
                    .updating($dragOffset, body: { value, state, _ in
                        state = value.translation
                    })
                    .onEnded { value in
                        let offset = value.translation.width / geometry.size.width
                        let newIndex = (CGFloat(selectedIndex) - offset).rounded()
                        selectedIndex = max(0, min(Int(newIndex), items.count - 1))
                    }
            )
        }
        .contentShape(Rectangle())
    }
}

struct PredictedPollItemView: View {
    let item: CarouselItem
    let itemWidth: CGFloat
    let teamImgSize: CGFloat = 60
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("MIA Heat")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding()
                    Spacer()
                }
                Spacer()
                HStack{
                    VStack{
                        ImageDisplay("https://assets-sports.thescore.com/basketball/team/13/w72xh72_logo.png", imgSize: 60)
                        Text("MIA Heat")
                            .font(.footnote)
                            .frame(width:100)
                        VotedBtn(voteRatio: 2/3, ifVoted: true)
                    }
                    
                    VStack{
                        Text("18:30")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.green)
                        Text("Today")
                            .font(.footnote)
                            .foregroundStyle(.white)
                            .padding(.vertical, 1)
                           
                    }
                    VStack{
                        ImageDisplay("https://assets-sports.thescore.com/basketball/team/8/w72xh72_logo.png", imgSize: 60)
                        Text("DET Pistons")
                            .font(.footnote)
                            .frame(width:100)
                        
                         VotedBtn(voteRatio: 1/3, ifVoted: false)
                    }
                }
               Spacer()
            }
            .frame(width: itemWidth, height: 200)
        }
        .foregroundColor(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black, lineWidth: 0)
        )
        .background(Color.thirdColor(1))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.7), radius: 10, x: 2, y: 2)
        
        
        
        
    }
}
