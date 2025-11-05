//
//  CustomTextStyle.swift
//  Animations Course
//
//  Created by Shemek on 04/11/2025.
//

import SwiftUI

struct CustomTextStyle<S: Shape>: ViewModifier {
    struct LeftLine: Shape {
        func path(in rect: CGRect) -> Path {
            let upperLeft = CGPoint(x: rect.minX, y: rect.minY)
            let lowerLeft = CGPoint(x: rect.minX, y: rect.maxY)
            
            return Path { path in
                path.move(to: upperLeft)
                path.addLine(to: lowerLeft)
            }
        }
    }
    
    let foregroundColor: Color
    let opacity: Double
    let offsetX: CGFloat
    let strokeColor: Color
    let strokeOpacity: Double
    let backgroundShape: S
    let backgroundColor: Color
    let shapeScale: CGFloat
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(foregroundColor)
            .opacity(opacity)
            .offset(x: offsetX)
            .padding()
            .background(
                LeftLine()
                    .stroke(strokeColor.opacity(strokeOpacity), lineWidth: 10)
            )
            .clipped()
            .background(
                backgroundShape
                    .fill(backgroundColor)
                    .scaleEffect(shapeScale)
            )
    }
}

extension View {
    func customTextStyle<S: Shape>(
        foregroundColor: Color = .black,
        opacity: Double = 1.0,
        offsetX: CGFloat = 0.0,
        strokeColor: Color = .black,
        strokeOpacity: Double = 1.0,
        backgroundShape: S = Capsule(),
        backgroundColor: Color = .clear,
        shapeScale: CGFloat = 1.0
    ) -> some View {
        self.modifier(
            CustomTextStyle(
                foregroundColor: foregroundColor,
                opacity: opacity,
                offsetX: offsetX,
                strokeColor: strokeColor,
                strokeOpacity: strokeOpacity,
                backgroundShape: backgroundShape,
                backgroundColor: backgroundColor,
                shapeScale: shapeScale
                )
        )
    }
}
