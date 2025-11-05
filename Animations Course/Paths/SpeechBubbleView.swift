//
//  SpeechBubbleView.swift
//  Animations Course
//
//  Created by Shemek on 31/10/2025.
//

import SwiftUI

struct SpeechBubble: Shape {
    let tailWidth: CGFloat
    let tailHeight: CGFloat
    let cornerRadius: CGFloat
    
    init(
        tailWidth: CGFloat = 20.0,
        tailHeight: CGFloat = 15.0,
        cornerRadius: CGFloat = 15.0
    ) {
        self.tailWidth = tailWidth
        self.tailHeight = tailHeight
        self.cornerRadius = cornerRadius
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let tailStart = CGPoint(
            x: rect.midX - tailWidth / 2,
            y: rect.maxY
        )
        
        let tailEnd = CGPoint(
            x: rect.midX + tailWidth / 2,
            y: rect.maxY
        )
        
        // Tail
        path.move(to: tailStart)
        path.addLine(
            to: CGPoint(
                x: rect.midX,
                y: rect.maxY + tailHeight
            )
        )
        
        path.addLine(to: tailEnd)
        // Lower right corner
        path.addArc(
            tangent1End: CGPoint(x: rect.maxX, y: rect.maxY),
            tangent2End: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius),
            radius: cornerRadius
            )
        // Top right corner
        path.addArc(
            tangent1End: CGPoint(x: rect.maxX, y: rect.minY),
            tangent2End: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY),
            radius: cornerRadius
        )
        // Top left corner
        path.addArc(
            tangent1End: CGPoint(x: rect.minX, y: rect.minY),
            tangent2End: CGPoint(x: rect.minX, y: rect.minY + cornerRadius),
            radius: cornerRadius
        )
        // Bottom left corner
        path.addArc(
            tangent1End: CGPoint(x: rect.minX, y: rect.maxY),
            tangent2End: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY),
            radius: cornerRadius
        )
        // Finish line
        path.addLine(to: tailStart)
        return path
    }
}

struct SpeechBubbleView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(Font.title)
                .padding()
                .background(SpeechBubble().stroke(Color.blue))
                .foregroundStyle(.black)
                .frame(maxHeight: .infinity)
            
            Text("I love to code...")
                .font(Font.title)
                .padding()
                .background(SpeechBubble().fill(Color.blue))
                .foregroundStyle(.white)
                .frame(maxHeight: .infinity)
            
            Text("""
            This is a speech buble with a border.
            
            \(Text("Happy Coding!!")
            .foregroundStyle(.orange)
            .font(.largeTitle)
            .bold())
            """)
            .font(.title)
            .padding()
            .background(
                SpeechBubble().fill(Color.indigo.opacity(0.8))
            )
            .overlay(
                SpeechBubble().stroke(Color.black, lineWidth: 3)
            )
            .foregroundStyle(.black)
            .frame(maxHeight: .infinity)
        }
        .padding()
    }
}

#Preview {
    SpeechBubbleView()
}
