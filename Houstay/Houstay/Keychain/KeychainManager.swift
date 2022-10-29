//
//  KeychainManager.swift
//  Houstay
//
//  Created by Oleg Kalistratov on 29.10.22.
//

import Foundation
import KeychainSwift

final class KeychainManager {
    private let keychain = KeychainSwift()
    private let fairLock = NSLock()
    private let userTokenKey = "userToken"
    private let userEmailKey = "userEmail"
    private let userNameKey = "userName"
    
    private init() {}
    
    internal static let shared = KeychainManager()
    internal var userToken: String {
        get {
            fairLock.lock()
            defer {
                fairLock.unlock()
            }
            return keychain.get(userTokenKey) ?? ""
        }
        set {
            fairLock.lock()
            defer {
                fairLock.unlock()
            }
            keychain.set(newValue, forKey: userToken)
        }
    }
    
    internal var userEmail: String {
        get {
            fairLock.lock()
            defer {
                fairLock.unlock()
            }
            return keychain.get(userEmailKey) ?? ""
        }
        set {
            keychain.set(newValue, forKey: userEmailKey)
        }
    }
    
    internal var userName: String {
        get {
            fairLock.lock()
            defer {
                fairLock.unlock()
            }
            return keychain.get(userNameKey) ?? ""
        }
        set {
            keychain.set(newValue, forKey: userNameKey)
        }
    }
    
    internal func keychainClear() {
        keychain.clear()
    }
}
