//
//  BigMistakeView.swift
//  Animations Course
//
//  Created by Shemek on 02/11/2025.
//

import SwiftUI

struct BigMistakeView: View {
    let lineWidth = 4.0
    let logoSize = 60.0
    
    struct HalfRect: Shape {
        
        let fillPercentage: CGFloat
        
        init(fillPercentage: CGFloat = 0.5) {
            self.fillPercentage = fillPercentage
        }
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            path.move(to: CGPoint(x: rect.width * fillPercentage, y: rect.maxY))
            
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.width * fillPercentage, y: rect.minY))
            
            return path
        }
    }
    
    var myText: some View {
        Text("""
            The Big
            Mistake
            """)
        .font(.custom("HelveticaNeue-Bold", size: logoSize))
        .foregroundStyle(.white)
        .kerning(8)
        .padding()
    }
    
    var border: some View {
        HalfRect(fillPercentage: 0.6)
            .stroke(.white, lineWidth: lineWidth)
    }
    
    @State private var textOffset: CGFloat = 500.0
    @State private var borderOpacity: Double = 0
    @State private var globalOpacity: Double = 1.0
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.9).ignoresSafeArea()
            myText
                .offset(x: textOffset)
                .padding()
                .overlay {
                    border
                        .opacity(borderOpacity)
                }
                .opacity(globalOpacity)
            
        }
        .onAppear {
            withAnimation(.smooth(duration: 0.75).delay(1)){
                borderOpacity = 0.95
            } completion: {
                withAnimation(.smooth(duration: 1)) {
                    textOffset = 0.0
                } completion: {
                    withAnimation(.easeInOut(duration: 0.75).delay(4)) {
                        globalOpacity = 0.0
                    }
                }
            }
            
        }
    }
    
    // Function that prints all built-in fonts (iOS/iPadOS/tvOS)
    func fonts() {
        for familyName in UIFont.familyNames.sorted() {
            print(familyName)
            for fontName in UIFont.fontNames(forFamilyName: familyName).sorted() {
                print("  \(fontName)")
            }
        }
    }
}

#Preview {
    BigMistakeView()
}
