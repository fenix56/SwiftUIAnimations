//
//  RedBlueSquareView.swift
//  Animations Course
//
//  Created by Shemek on 03/11/2025.
//

import SwiftUI

struct RedBlueSquareView: View {
    let text: String
    let dim = 50.0
    
    init(text: String = "Hello World!") {
        self.text = text
    }
    
    var body: some View {
        Rectangle()
            .phaseAnimator([true, false]) { content, phase in
                content
                    .foregroundStyle(phase ? .red : .blue)
                    .offset(x: phase ? 2 * dim : -2 * dim)
                    .frame(width: dim, height: dim)
                    .frame(maxWidth: .infinity)
                    .mask {
                        Text(text)
                            .font(.largeTitle)
                            .bold()
                    }
            } animation: { phase in
                    .spring(duration: 1)
            }
        
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        RedBlueSquareView()
    }
}
