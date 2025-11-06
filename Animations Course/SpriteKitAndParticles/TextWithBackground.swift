//
//  TextWithBackground.swift
//  Animations Course
//
//  Created by Shemek on 06/11/2025.
//

import SwiftUI

struct TextWithBackground<Background: Shape>: View {
    let text: String
    let backgroundShape: Background
    let backgroundColor: Color
    let textOpacity: Double
    
    var body: some View {
        ZStack {
            backgroundShape
                .fill(backgroundColor)
                .shadow(radius: 10)
            
            Text(text)
                .foregroundStyle(.white)
                .opacity(textOpacity)
                .font(.title).fontDesign(.rounded)
                .padding()
        }
    }
}

#Preview {
    TextWithBackground(
        text: "Hello World!",
        backgroundShape: SpeechBubble(),
        backgroundColor: .blue,
        textOpacity: 1.0
    )
    .frame(width: 300, height: 90)
}
