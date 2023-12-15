//
//  UserDefaultsStore.swift
//  CoinToss
//
//

import Foundation

extension UserDefaultsStore {
    enum Key: String {
        case isAnimation
        case isCoinReversed
    }
}

class UserDefaultsStore {
    
    static let shared = UserDefaultsStore()
    static let testStore = UserDefaultsStore(isTest: true)
    
    let userDefaults: UserDefaults
    
    init(isTest: Bool = false) {
        let suiteName = isTest ? "testStore" : "widgetStore"
        userDefaults = .init(suiteName: suiteName) ?? .init()
    }
    
    // MARK: - Properties
    
    var isAnimation: Bool {
        get {
            return userDefaults.bool(forKey: Key.isAnimation.rawValue)
        }
        set {
            userDefaults.setValue(newValue, forKey: Key.isAnimation.rawValue)
        }
    }
    
    var isCoinReversed: Bool {
        get {
            return userDefaults.bool(forKey: Key.isCoinReversed.rawValue)
        }
        set {
            userDefaults.setValue(newValue, forKey: Key.isCoinReversed.rawValue)
        }
    }
}
