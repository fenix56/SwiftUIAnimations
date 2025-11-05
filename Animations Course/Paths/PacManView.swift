//
//  PacManView.swift
//  Animations Course
//
//  Created by Shemek on 31/10/2025.
//

import SwiftUI

struct PacManView: View {
    struct PacMan: Shape {
        var angle: Double
        
        // To animate custom shapes we need to add this! If you comment out animatableData it won't animate
        var animatableData: Double {
            get { angle }
            set { angle = newValue }
        }
        
        func path(in rect: CGRect) -> Path {
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let radius = min(rect.width, rect.height) / 2
            let startAngle: Angle = .degrees(angle)
            let endAngle: Angle = .degrees(360 - angle)
            
            return Path { path in
                path.move(to: center)
                path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            }
        }
    }
    
    
    @State private var angle = 45.0
    
    private let animation = Animation.easeIn(duration: 0.2).repeatForever(autoreverses: true)
    
    var body: some View {
        PacMan(angle: angle)
            .fill(.yellow)
            .onAppear {
                withAnimation(animation) {
                    angle = 0.0
                }
            }
    }
}

#Preview {
    PacManView()
        .frame(width: 150, height: 150)
}
