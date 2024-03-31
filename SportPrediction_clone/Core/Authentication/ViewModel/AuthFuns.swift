//
//  AuthFuns.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 3/23/24.
//

import Foundation
import Amplify
import AWSCognitoAuthPlugin

class AuthFuns: ObservableObject{
    @Published var ifSignedIn = false
    
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
