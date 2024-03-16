//
//  CarouselView.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 3/15/24.
//
import SwiftUI
import Foundation

struct CarouselView: View {
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
                        CarouselItemView(item: items[index], itemWidth: geometry.size.width - carouselItemWidthSub)
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

struct CarouselItemView: View {
    let item: CarouselItem
    let itemWidth: CGFloat
    let teamImgSize: CGFloat = 60
    
    var body: some View {
            VStack(spacing: 0) {
                ZStack{
                    Image("footballBg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: itemWidth, height: 130)
                        .mask(RoundedCorners(tl: 16, tr: 16)) // Round only top corners
                        .clipped()
                    HStack{
                   
                    }
                    .padding()
                }
                
                
                VStack{
                    HStack {
                        VStack{
                            Image("team_tth")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: teamImgSize, height: teamImgSize)
                                .padding()
                            Text("Tottenham")
                                .font(.subheadline)
                        }
                        Spacer()
                        VStack{
                            Text("1 : 1")
                                .font(.title3)
                                .foregroundStyle(.green)
                                .fontWeight(.semibold)
                            Text("21'")
                                .font(.footnote)
                                .foregroundStyle(.green)
                                .padding(.vertical, 4)
                            
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
                    Spacer()
                    HStack{
                        
                    }

                }
                .multilineTextAlignment(.center)
                .padding()
                .frame(width: itemWidth, height: 140)
                .background(Color.thirdColor(0.8))
                .mask(RoundedCorners(bl: 16, br: 16))
            }
            .background(Color.secondColor(1))
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.red, lineWidth: 0)
            )
            .shadow(color: Color.black.opacity(0.7), radius: 10, x: 2, y: 2)
        }
     
}


struct CarouselItem {
    let image: String
    let title: String
    let description: String
}


// Custom Shape for rounding all corners
struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let w = rect.width
        let h = rect.height
        
        // Make sure the radius doesn't exceed the maximum possible value for each corner
        let tr = min(min(self.tr, h/2), w/2)
        let tl = min(min(self.tl, h/2), w/2)
        let bl = min(min(self.bl, h/2), w/2)
        let br = min(min(self.br, h/2), w/2)
        
        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        
        return path
    }
}

