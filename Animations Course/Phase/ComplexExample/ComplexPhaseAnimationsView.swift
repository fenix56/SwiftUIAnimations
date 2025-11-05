//
//  ComplexPhaseAnimationsView.swift
//  Animations Course
//
//  Created by Shemek on 04/11/2025.
//

import SwiftUI

struct ComplexPhaseAnimationsView: View {
    
    let text: String
    
    init(text: String = "Hello Phase!") {
        self.text = text
    }
    
    var myText: some View {
        Text(text)
            .font(.largeTitle)
            .bold()
            .fontDesign(.rounded)
            .kerning(5)
    }
    
    @State private var trigger = false
    
    var body: some View {
        Spacer()
        myText
            .phaseAnimator(LineTextPhases.allCases, trigger: trigger) {
                content,
                phase in
                content
                    .customTextStyle(
                        foregroundColor: phase.textForegroundColor,
                        opacity: phase.textOpacity,
                        offsetX: phase.offsetX,
                        strokeColor: phase.strokeColor,
                        strokeOpacity: phase.strokeOpacity,
                        backgroundShape: phase.backgroundShape,
                        backgroundColor: phase.backgroundColor,
                        shapeScale: phase.shapeScale
                    )
            } animation: { phase in
                phase.animation
            }
        Spacer()
        Button("Press Me!") {
            trigger.toggle()
        }
        .buttonStyle(.glass)
    }
}

#Preview {
    ComplexPhaseAnimationsView()
}
