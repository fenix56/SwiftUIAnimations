//
//  GradCircleView.swift
//  Animations Course
//
//  Created by Shemek on 19/10/2025.
//

import SwiftUI

struct GradCircleView: View {
    let startPoint: UnitPoint
    let endPoint: UnitPoint
    let dim: CGFloat
    let offsetX: CGFloat
    let offsetY: CGFloat
    let colors: [Color]
    
    var linearGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: colors),
            startPoint: startPoint,
            endPoint: endPoint
        )
    }
    
    var body: some View {
        Circle()
            .fill(linearGradient)
            .frame(width: dim, height: dim)
            .offset(x: offsetX, y: offsetY)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        GradCircleView(
            startPoint: .topLeading,
            endPoint: .bottomTrailing,
            dim: 150,
            offsetX: 0,
            offsetY: 0,
            colors: [.blue, .white, .indigo]
        )
    }
}
