//
//  TabBarModifier.swift
//  sports_prediction
//
//  Created by 杨嘉煌 on 2/13/24.
//

import SwiftUI


struct CustomTabViewModifier<SheetContent: View>: ViewModifier {
    @Binding var selectedTab: Int
    @Binding var showCreateThread: Bool
    @State private var formerTab: Int = 0
    let sheetContent: () -> SheetContent
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                let appearance = UITabBarAppearance()
                appearance.configureWithOpaqueBackground()

                // Set the background color of the tab bar
                appearance.backgroundColor = UIColor(Color.themeColor(1))

                // Set the border color
                appearance.shadowColor = UIColor(Color.secondColor(1))

                // Set the unselected item color
                appearance.stackedLayoutAppearance.normal.iconColor = UIColor.gray

                // Set the selected item color
                appearance.stackedLayoutAppearance.selected.iconColor = UIColor.green

                UITabBar.appearance().standardAppearance = appearance
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
            .onChange(of: selectedTab, { oldValue, newValue in
                showCreateThread = selectedTab == 10 // disable sheet view for now
                formerTab = oldValue
            })
            .sheet(isPresented: $showCreateThread, onDismiss: {
                selectedTab = formerTab
            }) {
                sheetContent()
            }
            .tint(.black)
    }
}

extension View {
    func customTabViewModifier<SheetContent: View>(selectedTab: Binding<Int>, showCreateThread: Binding<Bool>, sheetContent: @escaping () -> SheetContent) -> some View {
        self.modifier(CustomTabViewModifier(selectedTab: selectedTab, showCreateThread: showCreateThread, sheetContent: sheetContent))
    }

}
