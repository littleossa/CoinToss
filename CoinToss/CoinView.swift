//
//  CoinView.swift
//  CoinToss
//
//

import SwiftUI

struct CoinView: View {
    
    let isReversed: Bool
    
    var body: some View {
        Image(isReversed ? "img_coin_tails" : "img_coin_heads")
            .resizable()
    }
}

#Preview {
    CoinView(isReversed: true)
        .frame(width: 100, height: 100)
}

#Preview {
    CoinView(isReversed: false)
        .frame(width: 100, height: 100)
}
