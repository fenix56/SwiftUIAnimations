//
//  NextSongAnimationView.swift
//  Animations Course
//
//  Created by Shemek on 19/10/2025.
//

import SwiftUI

struct NextSongAnimationView: View {
    @State private var tapped = false
    
    var value: CGFloat {
        tapped ? 1 : 0
    }
    
    let dim: CGFloat
    let color: Color
    let duration: TimeInterval = 0.3
    
    init(
        dim: CGFloat = 50.0,
        color: Color = .black
    ) {
        self.dim = dim
        self.color = color
    }
    
    var playImage: some View {
        Image(systemName: "play.fill")
            .resizable()
            .frame(width: dim, height: dim)
            .foregroundStyle(color)
    }
    
    var body: some View {
        HStack(spacing: 0) {
            playImage
                .opacity(value)
                .scaleEffect(value)
            playImage
            playImage
                .opacity(1 - value)
                .scaleEffect(1 - value)
        }
        .offset(x: value * dim)
        .offset(x: -dim / 2)
        .onTapGesture {
            if tapped { return }
            withAnimation(.easeInOut(duration: duration)) {
                tapped = true
            }
            Task {
                try? await Task.sleep(nanoseconds: UInt64(duration * 1_000_000_000))
                tapped = false
            }
        }
    }
}

#Preview {
    NextSongAnimationView()
}
