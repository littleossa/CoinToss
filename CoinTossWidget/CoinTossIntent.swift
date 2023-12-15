//
//  CoinTossIntent.swift
//  CoinToss
//
//

import AppIntents

struct CoinTossIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Coin toss intent"
    
    @Parameter(title: "isTest")
    var isTest: Bool
    
    private var store: UserDefaultsStore {
        return isTest ? .testStore : .shared
    }
    
    init() {
    }
    
    init(isTest: Bool = false) {
        self.isTest = isTest
    }
    
    func perform() async throws -> some IntentResult {
        toggleAnimationFlag()
        flipCoin()
        return .result()
    }
    
    // MARK: - Helper functions
    
    private func toggleAnimationFlag() {
        var value = store.isAnimation
        value.toggle()
        store.isAnimation = value
    }
    
    private func flipCoin() {
        let result = Bool.random()
        store.isCoinReversed = result
    }
}
