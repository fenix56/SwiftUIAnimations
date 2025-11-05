//
//  MeshView.swift
//  Animations Course
//
//  Created by Shemek on 30/10/2025.
//

import SwiftUI
import Combine

struct MeshView: View {
    
    @State private var points: [SIMD2<Float>] = [
        [0, 0], [0.5, 0], [1, 0],
        [0, 0.5], [0.5, 0.5], [1, 0.5],
        [0, 1], [0.5, 1], [1, 1]
    ]
    
    @State private var colors: [Color] = [
        .orange, .purple, .blue,
        .orange, .pink, .purple,
        .pink, .purple, .cyan
    ]
    
    @State private var bkgColor = Color.blue
    
    var mesh: some View {
        MeshGradient(
            width: 3,
            height: 3,
            points: points,
            colors: colors,
            background: bkgColor
        )
    }
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let duration = 5.0
    
    var animation: Animation {
        Animation
            .linear(duration: duration)
            .repeatForever(autoreverses: true)
    }
    
    var body: some View {
        mesh
            .animation(animation, value: points)
            .onReceive(timer) { _ in
                let someColors: [Color] = [
                    .purple, .blue, .orange, .pink, .cyan
                ]
                
                points[4].x = .random(in: 0...1)
                points[4].y = .random(in: 0...1)
                
                colors[2] = someColors.randomElement() ?? .indigo
                colors[3] = someColors.randomElement() ?? .indigo
                colors[4] = someColors.randomElement() ?? .indigo
            }
    }
}

#Preview {
    MeshView()
        .ignoresSafeArea()
}
