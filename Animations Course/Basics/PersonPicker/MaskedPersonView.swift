//
//  MaskedPersonView.swift
//  Animations Course
//
//  Created by Shemek on 19/10/2025.
//

import SwiftUI

struct MaskedPersonView: View {
    let bgColor: Color
    let color: Color
    let scale: CGFloat
    let image: ImageResource
    let direction: Direction
    
    let maxOffset = 125.0
    
    var offset: CGFloat {
        direction == .left ? -maxOffset * (1 - scale) : maxOffset * (1 - scale)
    }
    
    var myMask: some View {
        Image(image)
            .resizable()
            .scaledToFit()
    }
    
    var body: some View {
        ZStack {
            bgColor
            Circle()
                .fill(color.gradient)
                .scaleEffect(scale)
                .opacity(scale)
                .offset(x: offset)
        }
        .mask {
            myMask
        }
    }
}

#Preview {
    MaskedPersonView(
        bgColor: .gray.opacity(0.3),
        color: .blue,
        scale: 0.5,
        image: .man,
        direction: .right
    )
    .frame(width: 250)
}
