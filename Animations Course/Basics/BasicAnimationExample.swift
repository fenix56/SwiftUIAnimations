//
//  BasicAnimationExample.swift
//  Animations Course
//
//  Created by Shemek on 10/10/2025.
//

import SwiftUI

struct BasicAnimationExample: View {
    @State private var isVisible = false
    @State private var color = Color.red
    var body: some View {
        VStack {
            Text("Hello, World!")
            Rectangle()
                .fill(color.gradient)
                .opacity(isVisible ? 1 : 0)
                .frame(width: 300, height: 300)
                .animation(.easeInOut(duration: 0.5), value: color)
            
            HStack {
                Button {
                    withAnimation(.easeInOut(duration: 1)) {
                        isVisible.toggle()
                    }
                } label: {
                    Text(isVisible ? "Hide" : "Show")
                }.buttonStyle(.borderedProminent)
                
                Button("Change Color") {
                    if color == .red {
                        color = .purple
                    } else {
                        color = .red
                    }
                }.buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    BasicAnimationExample()
}
