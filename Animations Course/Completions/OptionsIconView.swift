//
//  OptionsIconView.swift
//  Animations Course
//
//  Created by Shemek on 30/10/2025.
//

import SwiftUI

struct OptionsIconView: View {
    struct OffsetRectangle: View {
        let width: CGFloat
        let height: CGFloat
        let offsetY: CGFloat
        let degrees: CGFloat
        
        var body: some View {
            Rectangle()
                .frame(width: width, height: height)
                .offset(y: offsetY)
                .rotationEffect(.degrees(degrees))
        }
    }
    
    let width: CGFloat
    
    let widthToHeight: CGFloat = 2.5 / 16.0
    let widthToSpacing: CGFloat = 5.0 / 16.0
    
    var height: CGFloat {
        width * widthToHeight
    }
    
    var offsetY: CGFloat {
        width * widthToSpacing
    }
    
    @State private var phase1 = false
    @State private var phase2 = false
    @State private var phase3 = false
    
    init(width: CGFloat = 24.0) {
        self.width = width
    }
    
    var body: some View {
        ZStack {
            // TOP
            OffsetRectangle(
                width: width,
                height: height,
                offsetY: phase3 ? 0 : -offsetY,
                degrees: phase3 ? -45 : 0
            )
            // MID
            OffsetRectangle(
                width: width,
                height: height,
                offsetY: 0,
                degrees: 0
            )
            .offset(x: phase2 || phase3 ? width * 2 : 0)
            .opacity(phase2 || phase3 ? 0.0 : 1.0)
            // BOTTOM
            OffsetRectangle(
                width: width,
                height: height,
                offsetY: phase3 ? 0 : offsetY,
                degrees: phase3 ? 45 : 0
            )
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.1)) {
                phase1.toggle()
            } completion: {
                withAnimation(.easeInOut(duration: 0.2)) {
                    phase2.toggle()
                } completion: {
                    withAnimation(.bouncy(duration: 0.3, extraBounce: 0.2)) {
                        phase3.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    OptionsIconView(width: 100)
}
