//
//  AnimatedBackgroundView.swift
//  Animations Course
//
//  Created by Shemek on 19/10/2025.
//

import SwiftUI

struct AnimatedBackgroundView: View {
    @State private var toggleBackground: Bool = false
    
    let linearGradient = LinearGradient(colors: [.blue, .black, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        ZStack {
            if toggleBackground {
                Color.black.ignoresSafeArea()
            } else {
                linearGradient.ignoresSafeArea()
                    .opacity(0.8)
                    .blur(radius: 50)
            }
            
            ConcentricCirclesEffectView()
                .frame(width: 150, height: 150)
        }
        .onTapGesture {
            withAnimation {
                toggleBackground.toggle()
            }
        }
    }
}

#Preview {
    AnimatedBackgroundView()
}
