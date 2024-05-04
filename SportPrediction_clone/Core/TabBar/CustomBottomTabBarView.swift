//
//  CustomBottomTabBarView.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 4/17/24.
//

import SwiftUI

struct CustomBottomTabBarView: View {
    
    @State var currentTab: Tab = .Home
    
    @Namespace var animation
    
    //Hide Native Bar
    init() {
           UITabBar.appearance().isHidden = true
       }
    
    var body: some View {
        VStack{
            TabView (selection: $currentTab){
                GameView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(Tab.Home)
                    .background(.red)
                NewsView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(Tab.Search)
                MyBetView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(Tab.Notifications)
                    .background(Color.themeColor(1))
                LeaderBoardView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(Tab.Cart)
                    .background(.red)
                ProfileTestView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(Tab.Profile)
                    .background(.red)
            }
            HStack(spacing: 0){
                ForEach (Tab.allCases, id: \.rawValue){
                    tab in
                    TabButton(tab: tab)
                }
                .padding(.vertical)
                .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 15))
                
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.themeColor(1))
    }
    
    
    
    func TabButton(tab: Tab) -> some View{
        GeometryReader{
            proxy in
            Button(action: {
                withAnimation(.spring())
                {
                    currentTab = tab
                }
            }, label:{
                VStack(spacing: 0){
                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(currentTab == tab ? .white : .green)
                        .frame(width: 25, height: 25)
                        .frame(maxWidth: .infinity)
                        .background(
                            ZStack{
                                if currentTab == tab {
                                    MaterialEffect(style: .regular)
                                        .clipShape(Circle())
                                        .matchedGeometryEffect(id: "TAB", in:
                                                                animation
                                        )
                                    Text("").foregroundColor(currentTab == tab ? .primary :
                                            .secondary)
                                        .font(.footnote).padding(.top, 50)
                                }
                            })
                        .contentShape(Rectangle())
                        .offset(y: currentTab == tab ? -15 : 0)
                }
              
            }
            
            )
        }
        .frame(height: 25)
        
    }
}

struct MaterialEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) ->  UIVisualEffectView {
        let view = UIVisualEffectView(effect:UIBlurEffect(style:style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}

#Preview {
    CustomBottomTabBarView()
}


enum Tab: String, CaseIterable {
    case Home = "basketball"
    case Search = "newspaper"
    case Notifications = "tray.and.arrow.up"
    case Cart = "trophy"
    case Profile = "person"
   
    
    var tabName: String {
        switch self{
        case .Home:
            return "Home"
        case .Search:
            return "Search"
        case .Cart:
            return "Cart"
        case .Notifications:
            return "Notifications"
        case .Profile:
            return "Profile"
        }
    }
    
    
}

//Safe Area

extension View{
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first
                as? UIWindowScene else{
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
}
