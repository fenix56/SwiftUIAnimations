//
//  PhasesAndCGPointsView.swift
//  Animations Course
//
//  Created by Shemek on 03/11/2025.
//

import SwiftUI

struct PhasesAndCGPointsView: View {
    let dim = 70.0
    let points: [CGPoint] = [
        .init(x: -1, y: -1),
        .init(x: 1, y: -1),
        .init(x: 1, y: 1),
        .init(x: -1, y: 1),
        .zero
    ]
    
    var animatedRect1: some View {
        Rectangle()
            .phaseAnimator(points) {
                content,
                phase in
                content
                    .frame(width: dim, height: dim / 3)
                    .offset(
                        x: phase.x * 2 * dim,
                        y: phase.y * 2 * dim
                    )
                    .foregroundStyle(phase.x > 0 ? .red : .blue)
                    .rotationEffect(.degrees(phase.x > 0 ? 90 : 0))
                    .opacity(phase == .zero ? 0 : 1)
            } animation: { phase in
                Animation.linear(duration: phase == .zero ? 4 : 1.5)
            }
    }
    
    var animatedRect2: some View {
        Rectangle()
            .phaseAnimator(points) {
                content,
                phase in
                content
                    .frame(width: dim, height: dim / 3)
                    .rotationEffect(.degrees(phase.x > 0 ? 90 : 0))
                    .offset(
                        x: phase.x * 2 * dim,
                        y: phase.y * 2 * dim
                    )
                    .foregroundStyle(phase.x > 0 ? .green : .orange)
                    .opacity(phase == .zero ? 0 : 1)
            } animation: { phase in
                Animation.linear(duration: phase == .zero ? 4 : 1.5)
            }
    }
    
    var animatedRect3: some View {
        Rectangle()
            .phaseAnimator(points) {
                content,
                phase in
                content
                    .frame(width: dim, height: dim / 3)
                    .offset(
                        x: phase.x * 2 * dim,
                        y: phase.y * 2 * dim
                    )
                    .foregroundStyle(phase.x * phase.y > 0 ? .black : .purple)
                    .rotationEffect(.degrees(phase.x > 0 ? 90 : 0))
                    .opacity(phase == .zero ? 0 : 1)
            } animation: { phase in
                Animation.linear(duration: phase == .zero ? 4 : 1.5)
            }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            animatedRect1
            animatedRect2
            animatedRect3
        }
    }
}

#Preview {
    PhasesAndCGPointsView()
}
