//
//  BasicAnimationsView.swift
//  Animations Course
//
//  Created by Shemek on 10/10/2025.
//

import SwiftUI

// We can define our custom animations based on timingCurve
// Usefull sites:
// https://cubic-bezier.com/
// https://easings.net/
extension Animation {
    static var smoothEase: Animation {
        .timingCurve(0.25, 0.1, 0.25, 1.0, duration: 1)
    }
    static func smoothEase(duration: TimeInterval) -> Animation {
        .timingCurve(0.25, 0.1, 0.25, 1.0, duration: duration)
    }
    static func myCustom(duration: TimeInterval) -> Animation {
        .timingCurve(0.57, 0.17, 0.5, 1.1, duration: duration)
    }
    static func easeInSine(duration: TimeInterval) -> Animation {
        .timingCurve(0.12, 0, 0.39, 0, duration: duration)
    }
}

struct BasicAnimationsView: View {
    let animations: [AnimationModel] = [
        .init(
            title: "Linear Animation",
            description: "Moves at a constant speed without any acceleration or deceleration.",
            animation: .linear(duration: 1)
        ),
        .init(
            title: "EaseIn Animation",
            description: "Starts slowly and accelerates toward the end.",
            animation: .easeIn(duration: 1)
        ),
        .init(
            title: "EaseOut Animation",
            description: "Starts quickly and slows down toward the end.",
            animation: .easeOut(duration: 1)
        ),
        .init(
            title: "EaseInOut Animation",
            description: "Starts and ends slowly but accelerates at the same middle.",
            animation: .easeInOut(duration: 1)
        ),
        .init(
            title: "Snappy Animation",
            description: "Quick and responsive with minor overshooting.",
            animation: .snappy(duration: 1)
        ),
        .init(
            title: "Bouncy Animation",
            description: "A spring animation with a predefined damping duration and higher amount of bounce that can be adjusted.",
            animation: .bouncy(duration: 1)
        ),
        .init(
            title: "Timing Curve Animation",
            description: """
                A customizable timing curve animation that adjusts the rate of change over time using Bezier control points.
                - The curve allows for smooth, non-linear behavior.
                
                - **Parameters**:
                   - **Control Points (x1, y1, x2, y2)**: Defines the timing curve with two control points for the Bezier curve.
                   - **x1, y1**: The first control point that determines the initial acceleration of animation.
                   - **x2, y2**: The second control point affects the deceleration and final smoothness.
                - **Duration**: Controls how long the animation lasts.
                - **Behavior**: Provides smooth transitions with natural easing effects, starting slow, accelerating, and then decelerating.
                """,
            animation: .myCustom(duration: 1)
        ),
        .init(
            title: "Spring Animations",
            description: """
                **Mimics the behavior of a physical spring with natural bounce.**
                - **response**: Controls the duration of the spring's movement. Higher values result in a slower animation.
                - **dampingFraction**: Dictates how quickly the spring comes to rest. A value of `1.0` results no oscilation, while lower values create more bounce.
                - **blendDuration**: Affects how smoothly the animation transtions to the spring effect.
                """,
            animation: .spring(
                response: 1,
                dampingFraction: 0.8,
                blendDuration: 1
            )
        ),
        .init(
            title: "Iterpolating Spring Animation",
            description: """
                An interpolating spring animation that uses a damped spring model to produce values in the range [0, 1] that are then used to interpolate within the [from, to] range of the animated property. Preserves velocity across overlapping animations by adding the effects of each animation.
                - **mass**: The mass of the object attached to the spring.
                - **stiffness**: The stiffness of the spring.
                - **damping**: The spring damping value.
                - **initialVelocity**: The initial velocity of the spring, as a value in the range [0, 1] representing the magnitude of the value being animated.
                """,
            animation: .interpolatingSpring(
                mass: 1,
                stiffness: 50,
                damping: 5,
                initialVelocity: 0.2
            )
        )
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(animations) { animation in
                    NavigationLink(animation.title) {
                        AnimationDemoView(animationModel: animation)
                    }
                }
                .navigationTitle("SwiftUI Animations")
            }
        }
    }
}

#Preview {
    BasicAnimationsView()
}
