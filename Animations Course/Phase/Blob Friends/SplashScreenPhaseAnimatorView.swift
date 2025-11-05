//
//  SplashScreenPhaseAnimatorView.swift
//  Animations Course
//
//  Created by Shemek on 04/11/2025.
//

import SwiftUI

struct SplashScreenPhaseAnimatorView: View {
    enum SplashPhases: CaseIterable {
        case initial, expandBlob
        
        var blobZoom: Double {
            switch self {
            case .initial: 1.0
            case .expandBlob: 20.0
            }
        }
        
        var blobColor: Color {
            switch self {
            case .initial: .deepPurple
            case .expandBlob: .purple
            }
        }
        
        var welcomeColor: Color {
            switch self {
            case .initial: .black
            case .expandBlob: .white
            }
        }
        
        var welcomeOpacity: Double {
            switch self {
            case .initial: 0.0
            case .expandBlob: 1.0
            }
        }
        
        var offset: CGFloat {
            switch self {
            case .initial: 0.0
            case .expandBlob: -50.0
            }
        }
    }
    
    @State private var trigger = false
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.3).ignoresSafeArea()
                .phaseAnimator(SplashPhases.allCases, trigger: trigger) {
                    content,
                    phase in
                    content
                        .overlay {
                            SplashScreenView(
                                blobZoom: phase.blobZoom,
                                bloobColor: phase.blobColor,
                                welcomeColor: phase.welcomeColor,
                                welcomeOpacity: phase.welcomeOpacity,
                                offset: phase.offset
                            )
                        }
                    
                } animation: { phase in
                        .easeInOut(duration: 2).delay(1)
                }
                .onAppear {
                    trigger.toggle()
                }
        }
    }
}

#Preview {
    SplashScreenPhaseAnimatorView()
}
