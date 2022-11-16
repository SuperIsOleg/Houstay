//
//  LoginViewModel.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 15.11.22.
//

import Foundation
import FirebaseCore
import GoogleSignIn
import FirebaseAuth

class LoginViewModel {
    internal let keychainManager = KeychainManager.shared
    
    internal func googleSignIn(viewController: UIViewController,
                               succesCompletion: @escaping () -> Void) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: viewController) { [weak self] (user, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("Не получен config")
            }
            
            guard let authentication = user?.authentication,
                  let idToken = authentication.idToken else { return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { [weak self] authResult, error in
                guard let self = self else { return }
                if error == nil {
                    succesCompletion()
                } else {
                    print("Вход не выполнен")
                }
            }
        }
    }
    
    internal func logIn(email: String,
                        enterPassword:String,
                        succesCompletion: @escaping () -> Void,
                        errorCompletion: @escaping () -> Void) {
        Auth.auth().signIn(withEmail: email, password: enterPassword) { [weak self] authResult, error in
            guard let self = self else { return }
            if error == nil {
                succesCompletion()
            } else {
                errorCompletion()
            }
        }
    }
    
}
