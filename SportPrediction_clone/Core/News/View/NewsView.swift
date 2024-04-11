import SwiftUI

struct NewsView: View {
    
    @State private var selectedFilter: LeagueFilter = .nba
    @Namespace var animation
    private var filterBarWidth: CGFloat {
        let count = CGFloat(LeagueFilter.allCases.count)
        return UIScreen.main.bounds.width / count  -  26
    }
   
    
    private let carouselItems = [
        CarouselItem(image: "image1", title: "Title 1", description: "Description 1"),
        CarouselItem(image: "image2", title: "Title 2", description: "Description 2"),
        CarouselItem(image: "image3", title: "Title 3", description: "Description 3")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.themeColor(1).ignoresSafeArea()
                    .overlay {
                        VStack {
                            HStack {
                                Text("Home")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            // Filter section
                            FilterSection(selectedFilter: $selectedFilter, animation: animation, filterBarWidth: filterBarWidth)
                            
                            // Live Matches carousel
                            VStack {
                                Text("Live Matches")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .padding()
                                CarouselView(items: carouselItems, carouselItemWidthSub:80, carouselItemPadding: 20)
                            }
                            
                            // News section
                            VStack {
                                Text("News")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .padding(.horizontal)
                                    .padding(.top)
                                ScrollView {
                                    InformationView()
                                }
                            }
                        }
                        .foregroundColor(.white)
                    }
            }
        }
    }
}

struct FilterSection: View {
    @Binding var selectedFilter: LeagueFilter
    var animation: Namespace.ID
    var filterBarWidth: CGFloat
    
    var body: some View {
        HStack {
            ForEach(LeagueFilter.allCases) { filter in
                VStack {
                    Text(filter.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        .animation(nil)
                    if selectedFilter == filter {
                        Rectangle()
                            .foregroundColor(.green)
                            .frame(width: filterBarWidth, height: 2)
                            .matchedGeometryEffect(id: "item", in: animation)
                    } else {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: filterBarWidth, height: 1)
                    }
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        selectedFilter = filter
                    }
                }
            }
        }
        .padding(.top)
    }
}

#Preview {
    NewsView()
}
