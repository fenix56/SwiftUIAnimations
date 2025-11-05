//
//  PersonPickerAnimationView.swift
//  Animations Course
//
//  Created by Shemek on 19/10/2025.
//

import SwiftUI

enum Direction {
    case left
    case right
}

struct PersonPickerAnimationView: View {
    let grayColor = Color.gray.opacity(0.3)
    
    @State private var manSelected = false
    @State private var scale = 0.0
    
    var body: some View {
        HStack(spacing: -20) {
            MaskedPersonView(
                bgColor: grayColor,
                color: .blue.opacity(0.9),
                scale: 1-scale,
                image: .man,
                direction: .right
            )
            .onTapGesture {
                withAnimation {
                    manSelected = true
                    scale = 0.0
                }
            }
            MaskedPersonView(
                bgColor: grayColor,
                color: .pink.opacity(0.9),
                scale: scale,
                image: .woman,
                direction: .left
            )
            .onTapGesture {
                withAnimation {
                    manSelected = false
                    scale = 1.0
                }
            }
        }
        .frame(width: 250)
    }
}

#Preview {
    PersonPickerAnimationView()
}
