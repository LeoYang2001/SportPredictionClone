//
//  ContentView.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 3/13/24.
//

import SwiftUI
import Amplify




struct ContentView: View {
    @State private var loggedIn = true
    
    var body: some View {
        VStack {
            Color.themeColor(1).ignoresSafeArea()
               .overlay{
                   VStack{
                       if !loggedIn{
                           AuthenticationView(loggedIn: $loggedIn)
                       }
                       else{
                           CustomBottomTabBarView()
                               .transition(.move(edge: .trailing)) // Slide from the right
                               .edgesIgnoringSafeArea(.bottom)
                       }
                   }
               }
        }
    }
    func fetchCurrentAuthSession() async {
        do {
            let session = try await Amplify.Auth.fetchAuthSession()
            print("Is user signed in - \(session.isSignedIn)")
        } catch let error as AuthError {
            print("Fetch session failed with error \(error)")
        } catch {
            print("Unexpected error: \(error)")
        }
    }
    
}

#Preview {
    ContentView()
}
extension Color {
    static func themeColor(_ opacity: Double = 1.0) -> Color {
           return Color(red: 34/255, green: 34/255, blue: 44/255).opacity(opacity)
       }
       
   static func secondColor(_ opacity: Double = 0.8) -> Color {
       return Color(red: 89/255, green: 89/255, blue: 115/255).opacity(opacity)
   }
    static func thirdColor(_ opacity: Double = 1.0) -> Color {
           return Color(red: 33/255, green: 35/255, blue: 35/255).opacity(opacity)
       }
    static func forthColor(_ opacity: Double = 1.0) -> Color {
            return Color(red: 97/255, green: 97/255, blue: 97/255).opacity(opacity)
        }
    static func maskColor(_ opacity: Double = 1.0) -> Color {
           return Color(red: 0/255, green: 0/255, blue: 0/255).opacity(opacity)
       }
}
