//
//  ContentView.swift
//  CoinToss
//
//

import SwiftUI

struct ContentView: View {
    @State private var animationTrigger = false
    @State private var isReversed = false
    private let totalDuration = 2.0
    
    var body: some View {
        
        Button {
            animationTrigger.toggle()
            let result = Bool.random()
            isReversed = result
        } label: {
            CoinView(isReversed: isReversed)
                .frame(width: 140, height: 140)
                .keyframeAnimator(initialValue: AnimationProperties(), trigger: animationTrigger) { content, value in
                    content
                        .scaleEffect(value.scale)
                        .rotation3DEffect(.degrees(value.rotationAngle), axis: (x: 1, y: 1, z: 1))
                        .offset(y: value.yTransition)
                } keyframes: { _ in
                    KeyframeTrack(\.yTransition) {
                        CubicKeyframe(-300, duration: totalDuration * 0.2)
                        CubicKeyframe(-180, duration: totalDuration * 0.2)
                        CubicKeyframe(-90, duration: totalDuration * 0.1)
                        CubicKeyframe(-45, duration: totalDuration * 0.1)
                        CubicKeyframe(-20, duration: totalDuration * 0.1)
                        CubicKeyframe(-10, duration: totalDuration * 0.1)
                        CubicKeyframe(-5, duration: totalDuration * 0.1)
                        CubicKeyframe(0, duration: totalDuration * 0.1)
                    }
                    
                    KeyframeTrack(\.rotationAngle) {
                        CubicKeyframe(640, duration: totalDuration * 0.2)
                        CubicKeyframe(320, duration: totalDuration * 0.2)
                        CubicKeyframe(160, duration: totalDuration * 0.1)
                        CubicKeyframe(80, duration: totalDuration * 0.1)
                        CubicKeyframe(40, duration: totalDuration * 0.1)
                        CubicKeyframe(20, duration: totalDuration * 0.1)
                        CubicKeyframe(10, duration: totalDuration * 0.1)
                        CubicKeyframe(0, duration: totalDuration * 0.1)
                    }
                    
                    KeyframeTrack(\.scale) {
                        CubicKeyframe(2.0, duration: totalDuration * 0.2)
                        CubicKeyframe(1.8, duration: totalDuration * 0.2)
                        CubicKeyframe(1.6, duration: totalDuration * 0.1)
                        CubicKeyframe(1.4, duration: totalDuration * 0.1)
                        CubicKeyframe(1.2, duration: totalDuration * 0.1)
                        CubicKeyframe(1.1, duration: totalDuration * 0.1)
                        CubicKeyframe(1, duration: totalDuration * 0.2)
                    }
                }
        }
    }
}

extension ContentView {
    
    struct AnimationProperties {
        var yTransition = 0.0
        var scale = 1.0
        var rotationAngle = 0.0
    }
}

#Preview {
    ContentView()
}
