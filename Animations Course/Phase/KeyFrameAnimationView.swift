//
//  KeyFrameAnimationView.swift
//  Animations Course
//
//  Created by Shemek on 04/11/2025.
//

import SwiftUI

struct KeyFrameAnimationView: View {
    struct AnimationValues {
        var offsetY: CGFloat = 0
        var rotation: Angle = .degrees(0)
        var scale =  1.0
    }
    
    var myShape: some View {
        Circle()
            .stroke(
                AngularGradient(colors: [.red, .green, .blue, .yellow, .black, .indigo, .pink], center: .center), lineWidth: 20
            )
            .shadow(radius: 3)
            .frame(width: 100, height: 100)
    }
    
    let timeDuration: TimeInterval = 5
    
    var body: some View {
        myShape
            .keyframeAnimator(initialValue: AnimationValues()) { content, value in
                content
                    .rotationEffect(value.rotation)
                    .offset(y: value.offsetY)
                    .scaleEffect(value.scale)
            } keyframes: { value in
                KeyframeTrack(\.offsetY) {
                    LinearKeyframe(-300, duration: 0.4 * timeDuration)
                    
                    SpringKeyframe(100, duration: 0.4 * timeDuration)
                    
                    LinearKeyframe(0, duration: 0.2 * timeDuration)
                }
                
                KeyframeTrack(\.rotation) {
                    CubicKeyframe(.zero, duration: 0.5 * timeDuration)
                    CubicKeyframe(Angle.degrees(20 * 360), duration: 0.5 * timeDuration)
                }
                
                KeyframeTrack(\.scale) {
                    SpringKeyframe(1, duration: 0.5 * timeDuration)
                    SpringKeyframe(1.25, duration: 0.25 * timeDuration)
                    SpringKeyframe(1, duration: 0.25 * timeDuration)
                }
            }

    }
}

#Preview {
    KeyFrameAnimationView()
}
