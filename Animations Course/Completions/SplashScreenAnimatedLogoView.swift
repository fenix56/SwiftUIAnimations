//
//  SplashScreenAnimatedLogoView.swift
//  Animations Course
//
//  Created by Shemek on 30/10/2025.
//

import SwiftUI

struct SplashScreenAnimatedLogoView: View {
    let dim: CGFloat
    let name: String
    let bgGradient1: LinearGradient
    let bgGradient2: LinearGradient
    let fgColor1: Color
    let fgColor2: Color
    
    var fgColor: Color {
        if showText {
            fgColor2
        } else {
            bgPhase1 ? fgColor1 : fgColor2
        }
    }
    
    var bgGradient: LinearGradient {
        bgPhase1 ? bgGradient1 : bgGradient2
    }
    
    var smallSquare: some View {
        Rectangle()
            .fill(fgColor)
            .frame(width: dim, height: dim)
    }
    var logo: some View {
        HStack(spacing: spacing) {
            VStack(spacing: spacing) {
                smallSquare
                smallSquare
            }
            .overlay {
                fgColor
            }
            VStack(spacing: spacing) {
                smallSquare
                smallSquare
            }
        }
    }
    var text: some View {
        Text(name)
            .foregroundStyle(fgColor)
            .font(.system(size: dim * 2 + spacing * 2, weight: .bold, design: .rounded))
            .lineLimit(1)
            .minimumScaleFactor(0.1)
            .clipShape(
                Rectangle()
                    .offset(x: clipWidth)
            )
    }
    
    init(
        dim: CGFloat = 24.0,
        name: String = "Hello!",
        bgGradient1: LinearGradient = LinearGradient(gradient: Gradient(colors: [.black]), startPoint: .topLeading, endPoint: .bottomTrailing),
        bgGradient2: LinearGradient = LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing),
        fgColor1: Color = .purple,
        fgColor2: Color = .white
    ) {
        self.dim = dim
        self.name = name
        self.bgGradient1 = bgGradient1
        self.bgGradient2 = bgGradient2
        self.fgColor1 = fgColor1
        self.fgColor2 = fgColor2
    }
    
    let spacing: CGFloat = 3.0
    
    @State private var rotation = 0.0
    @State private var scale = 1.0
    @State private var clipWidth = -150.0
    @State private var showText = false
    var bgPhase1: Bool {
        !showText
    }
    
    var body: some View {
        ZStack {
            bgGradient
            HStack {
                logo
                    .rotationEffect(.degrees(rotation))
                    .scaleEffect(scale)
                if showText {
                    text
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.4)) {
                rotation = 135
                scale = 2.0
            } completion: {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.4).delay(0.4)) {
                    rotation = 0.0
                    scale = 1.0
                } completion: {
                    withAnimation(.interpolatingSpring(mass: 1, stiffness: 150, damping: 15, initialVelocity: 0).delay(0.8)) {
                        showText = true
                        clipWidth = 0
                    }
                }

            }

        }
    }
}

#Preview {
    SplashScreenAnimatedLogoView(name: "Very nice logo ✨", bgGradient2: LinearGradient(colors: [.oceanBlue1, .oceanBlue2], startPoint: .topLeading, endPoint: .bottomTrailing), fgColor1: .oceanBlue2)
        .ignoresSafeArea()
}
