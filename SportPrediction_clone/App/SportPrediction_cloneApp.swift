//
//  SportPrediction_cloneApp.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 3/13/24.
//

import SwiftUI
import Amplify
import AWSAPIPlugin
import AWSDataStorePlugin
import AWSCognitoAuthPlugin


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        do {
            try Amplify.configure()
        } catch {
            print("An error occurred setting up Amplify: \(error)")
        }
        return true
    }
}

@main
struct SportPrediction_cloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    init() {
           do {
               try Amplify.add(plugin: AWSCognitoAuthPlugin())
               try Amplify.configure()
               print("Amplify configured with auth plugin")
           } catch {
               print("Failed to initialize Amplify with \(error)")
           }
       }
    
}
