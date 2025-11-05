//
//  CirclePair.swift
//  Animations Course
//
//  Created by Shemek on 19/10/2025.
//

import SwiftUI

struct CirclePair: View {
    let startPoint: UnitPoint
    let endPoint: UnitPoint
    let dim: CGFloat
    let offsetX: CGFloat
    let offsetY: CGFloat
    let colors: [Color]
    let angle: CGFloat
    let move: Bool
    let opacity: CGFloat
    
    init(
        startPoint: UnitPoint = .top,
        endPoint: UnitPoint = .bottom,
        dim: CGFloat = 120.0,
        offsetX: CGFloat = 0.0,
        offsetY: CGFloat = 0.0,
        colors: [Color] = [.green, .white],
        angle: CGFloat = 0.0,
        move: Bool = true,
        opacity: CGFloat = 0.5
    ) {
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.dim = dim
        self.offsetX = offsetX
        self.offsetY = offsetY
        self.colors = colors
        self.angle = angle
        self.move = move
        self.opacity = opacity
    }
    var body: some View {
        ZStack {
            GradCircleView(startPoint: startPoint, endPoint: endPoint, dim: dim, offsetX: offsetX, offsetY: move ? -dim / 2 : dim / 2, colors: colors)
            
            GradCircleView(startPoint: endPoint, endPoint: startPoint, dim: dim, offsetX: offsetX, offsetY: move ? dim / 2 : -dim / 2, colors: colors)
        }
        .opacity(opacity)
        .rotationEffect(.degrees(angle))
    }
}

#Preview {
    CirclePair()
}
