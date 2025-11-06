//
//  SpritesAnimationToggleView.swift
//  Animations Course
//
//  Created by Shemek on 06/11/2025.
//

import SwiftUI

struct SpritesAnimationToggleView: View {
    @State private var trigger = true
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                AnimatedSpriteTextView(
                    width: 300,
                    height: 90,
                    text: "It's a secret!",
                    backgroundShape: SpeechBubble(),
                    backgroundColor: .blue,
                    hideText: $trigger,
                )
                
                Spacer()
                
                Button {
                    withAnimation(.smooth) {
                        trigger.toggle()
                    }
                } label: {
                    Label(trigger ? "Show Text" : "Hide Text", systemImage: trigger ? "eye" : "eye.slash")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        
                }
                .buttonStyle(.borderedProminent)
                .tint(trigger ? .green : .red)
                .padding()
                .padding([.leading, .trailing], 50)
                .navigationTitle("Particle Animations")
            }
        }
    }
}

#Preview {
    SpritesAnimationToggleView()
}
