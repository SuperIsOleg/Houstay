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
import FacebookLogin

class LoginViewModel {
    internal let keychainManager = KeychainManager.shared
    
    private func authViaFirebase(credential: AuthCredential, succesCompletion: @escaping () -> Void) {
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if error == nil {
                succesCompletion()
            } else {
                print("Вход не выполнен")
            }
        }
    }
    
    internal func googleSignIn(viewController: UIViewController,
                               succesCompletion: @escaping () -> Void) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: viewController) { (result, error) in
            if error == nil {
                guard let authentication = result?.authentication,
                      let idToken = authentication.idToken else { return }
                let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                               accessToken: authentication.accessToken)
                self.authViaFirebase(credential: credential) {
                    succesCompletion()
                }
            }
        }
    }
    
    internal func facebookSignIn(viewController: UIViewController,
                                 succesCompletion: @escaping () -> Void) {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile", "email"], from: viewController) { (result, error) in
            if error == nil {
                guard let authentication = result?.token else { return }
                let credential = FacebookAuthProvider.credential(withAccessToken: authentication.tokenString)
                self.authViaFirebase(credential: credential) {
                    succesCompletion()
                }
            }
        }
    }
    
    internal func logIn(email: String,
                        enterPassword:String,
                        succesCompletion: @escaping () -> Void,
                        errorCompletion: @escaping () -> Void) {
        Auth.auth().signIn(withEmail: email, password: enterPassword) { (authResult, error) in
            if error == nil {
                succesCompletion()
            } else {
                errorCompletion()
            }
        }
    }
}
