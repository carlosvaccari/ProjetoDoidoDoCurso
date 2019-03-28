//
//  UserDefaultsDatabase.swift
//  Aula11
//
//  Created by Virtual Machine on 28/03/19.
//  Copyright © 2019 Virtual Machine. All rights reserved.
//

import UIKit

public struct Key {
    static let currentUser = "currentUser"
    static let isLogged = "isLogged"
}

class UserDefaultsDatabase {
    
    static let shared = UserDefaultsDatabase()
    private let userDefaults = UserDefaults.standard
    
    var currentUser: [String: Any]? {
        get {
            return userDefaults.value(forKey: Key.currentUser) as? [String: Any]
        }
        
        set {
            userDefaults.setValue(newValue, forKey: Key.currentUser)
        }
    }
    
    var isLogged : [String: Bool]? {
        get {
            return userDefaults.value(forKey: Key.isLogged) as? [String: Bool]
        }
        
        set {
            userDefaults.setValue(newValue, forUndefinedKey: Key.isLogged)
        }
    }
}
