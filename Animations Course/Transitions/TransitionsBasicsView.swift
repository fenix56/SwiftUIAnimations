//
//  TransitionsBasicsView.swift
//  Animations Course
//
//  Created by Shemek on 01/11/2025.
//

import SwiftUI

struct TransitionsBasicsView: View {
    @State private var isVisible = true
    
    var body: some View {
        VStack {
            Button("Toggle View") {
                withAnimation {
                    isVisible.toggle()
                }
            }.buttonStyle(.borderedProminent)
            
            if isVisible {
                RoundedRectangle(cornerRadius: 20)
                    .frame(maxWidth: 100, maxHeight: 100)
                    .overlay {
                        Text("HELLO")
                            .foregroundStyle(.red)
                            .bold()
                    }
//                    .transition(.scale)
//                    .transition(.opacity)
//                    .transition(.move(edge: .bottom))
//                    .transition(.scale.combined(with: .move(edge: .leading)))
                    .transition(
                        .asymmetric(
                            insertion: .opacity.animation(.spring).combined(with: .scale(scale: 0.5, anchor: .bottomLeading)),
                            removal: .opacity.animation(.spring).combined(with: .scale(scale: 0.5, anchor: .bottomTrailing))
                        )
                    )
                
                // There a many possibilties to create transistions animations
            }
        }
        .padding()
    }
}

#Preview {
    TransitionsBasicsView()
}
