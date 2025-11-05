//
//  RadialGradientView.swift
//  Animations Course
//
//  Created by Shemek on 30/10/2025.
//

import SwiftUI

struct RadialGradientView: View {
    @State private var scale = 0.85
    @State private var gradientColors: [Color] = [.blue, .purple, .yellow, .green]
    @State private var cornerRadius: CGFloat = 5.0
    @State private var text = "Loading..."
    @State private var rotation: CGFloat = 0.0
    @State private var width: CGFloat? = nil
    
    var mesh: MeshGradient {
        MeshGradient(
            width: 2,
            height: 2,
            points: [
                [0, 0], [0, 1], [1, 0], [1, 1]
            ],
            colors: [.red, .green, .blue, .purple]
        )
    }
    
    var radialGradient: RadialGradient {
        RadialGradient(
            colors: gradientColors,
            center: .center,
            startRadius: 5,
            endRadius: 300
        )
    }
    
    
    var body: some View {
        Text(text)
            .opacity(scale == 1 ? 1 : 0)
            .font(.title)
            .padding()
            .frame(maxWidth: width)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(radialGradient)
            )
            .scaleEffect(scale)
            .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 0, z: 0))
            .foregroundStyle(.white)
            .padding()
            .onAppear {
                withAnimation(.easeInOut(duration: 2)) {
                    scale = 1.0
                } completion: {
                    withAnimation(.easeInOut(duration: 1)) {
                        gradientColors = [.red, .orange]
                        cornerRadius = 20
                        text = "Animation Complete!"
                    } completion: {
                        withAnimation(.easeInOut(duration: 3)) {
                            rotation = 70
                            width = .infinity
                            gradientColors = [.blue, .green, .purple]
                            text = "Bye!"
                        } completion: {
                            withAnimation(.easeInOut(duration: 1.5)) {
                                rotation = -90
                                scale = 0
                            }
                        }
                    }
                }
            }
        
    }
}

#Preview {
    RadialGradientView()
}
