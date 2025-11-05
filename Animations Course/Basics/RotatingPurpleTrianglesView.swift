//
//  RotatingPurpleTriangles.swift
//  Animations Course
//
//  Created by Shemek on 29/10/2025.
//

import SwiftUI

struct TripleTriangleView: View {
    struct TriangleView: View {
        
        struct Triangle: Shape {
            func path(in rect: CGRect) -> Path {
                var path = Path()
                
                path.move(to: CGPoint(x: rect.midX, y: rect.minY))
                path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
                path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
                
                return path
            }
        }
        
        let color: Color
        let dim: CGFloat
        
        var body: some View {
            Triangle()
                .fill(color)
                .frame(width: dim, height: dim)
        }
    }
    
    let dim: CGFloat
    let rotation: CGFloat
    let delta: CGFloat
    let color: Color
    let maxDelta: CGFloat
    
    init(
        dim: CGFloat,
        rotation: CGFloat,
        delta: CGFloat,
        color: Color,
        maxDelta: CGFloat = 100.0
    ) {
        self.dim = dim
        self.rotation = rotation
        self.delta = delta
        self.color = color
        self.maxDelta = maxDelta
    }
    
    private var scaleCenter: CGFloat {
        (1 / maxDelta) * delta + 1
    }
    private var scale: CGFloat {
        (-1 / maxDelta) * delta + 1
    }
    
    var tri: some View {
        TriangleView(
            color: color,
            dim: dim
        )
        .scaleEffect(scaleCenter)
    }
    
    var triLeft: some View {
        TriangleView(color: .red, dim: dim)
            .scaleEffect(scale)
            .rotationEffect(.degrees(180))
            .offset(x: dim / 2 + delta)
            .offset(y: -delta / 2)
    }
    
    var triRight: some View {
        TriangleView(color: .green, dim: dim)
            .scaleEffect(scale)
            .rotationEffect(.degrees(180))
            .offset(x: -dim / 2 - delta)
            .offset(y: -delta / 2)
    }
    
    var triTop: some View {
        TriangleView(color: .orange, dim: dim)
            .scaleEffect(scale)
            .rotationEffect(.degrees(180))
            .offset(y: dim + delta)

    }
    
    var body: some View {
        ZStack {
            tri
            triLeft
            triRight
            triTop
        }
        .rotationEffect(
            .degrees(rotation),
            anchor: UnitPoint(x: 0.5, y: 0.7)
        )
    }
}

struct RotatingPurpleTrianglesView: View {
    @State private var dim: CGFloat = 150.0
    @State private var rotation: CGFloat = 180.0
    @State private var delta: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            TripleTriangleView(
                dim: dim,
                rotation: rotation,
                delta: delta,
                color: .purple
            )
            .onAppear {
                withAnimation(.linear(duration: 2).delay(1.0).repeatForever(autoreverses: true)) {
                    rotation = -delta
                    delta = 100
                }
            }
        }
        
    }
}

#Preview {
    RotatingPurpleTrianglesView()
}
