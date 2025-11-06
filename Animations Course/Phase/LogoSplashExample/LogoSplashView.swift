//
//  LogoSplashView.swift
//  Animations Course
//
//  Created by Shemek on 05/11/2025.
//

import SwiftUI

struct LogoSplashView: View {
    struct LogoPhaseModel {
        let offsetY: CGFloat
        let showText: Bool
        let percentage: Double
        let ellipseScale: CGFloat
        let logoScale: CGFloat
    }
    
    enum TextLogoPhases: CaseIterable {
        case blackCircle, logoGoesUp, logoGoesToCenter, logoGoesToLeft, textAppears, textFadesOut
        
        var logoModel: LogoPhaseModel {
            switch self {
            case .blackCircle:
                return LogoPhaseModel(
                    offsetY: 2,
                    showText: false,
                    percentage: 1.0,
                    ellipseScale: 1.0,
                    logoScale: 0.1
                )
            case .logoGoesUp:
                return LogoPhaseModel(
                    offsetY: -2,
                    showText: false,
                    percentage: 0.0,
                    ellipseScale: 0.0,
                    logoScale: 1.2
                )
            case .logoGoesToCenter:
                return LogoPhaseModel(
                    offsetY: 0.0,
                    showText: false,
                    percentage: 0.0,
                    ellipseScale: 0,
                    logoScale: 0.8
                )
            case .logoGoesToLeft:
                return LogoPhaseModel(
                    offsetY: 0.0,
                    showText: true,
                    percentage: 0.0,
                    ellipseScale: 0,
                    logoScale: 1
                )
            case .textAppears:
                return LogoPhaseModel(
                    offsetY: 0.0,
                    showText: true,
                    percentage: 1.0,
                    ellipseScale: 0,
                    logoScale: 1
                )
            case .textFadesOut:
                return LogoPhaseModel(
                    offsetY: -1,
                    showText: false,
                    percentage: 0,
                    ellipseScale: 0.5,
                    logoScale: 0.8
                )
            }
        }
        
        var animation: Animation {
            switch self {
            case .blackCircle:
                    .bouncy(duration: 0.5)
            case .logoGoesUp:
                    .timingCurve(1, 0, 0, 1, duration: 1)
            case .logoGoesToCenter:
                    .interpolatingSpring(
                        mass: 0.5,
                        stiffness: 200,
                        damping: 10,
                        initialVelocity: 10
                    ).delay(0.5)
            case .logoGoesToLeft:
                    .bouncy(duration: 0.3).delay(1)
            case .textAppears:
                    .timingCurve(0.47, 0, 0.23, 1.38, duration: 0.9)
            case .textFadesOut:
                    .bouncy(duration: 0.5).delay(5)
            }
        }
    }
    
    struct LogoPhasesView: View {
        let text: String
        let logo: LogoPhaseModel
        
        struct EllipseModel {
            let widthFactor: CGFloat = 3.5
            let heightFactor: CGFloat = 1.0
            let offsetFactor: CGFloat = 0.5
        }
        
        struct RectangleModel {
            let widthFactor: CGFloat = 3.5
            let heightFactor: CGFloat = 3.5
            let offsetFactor: CGFloat = -1.25
        }
        
        let ellipse = EllipseModel()
        let rectangle = RectangleModel()
        
        func mask(logoSize: CGFloat) -> some View {
            ZStack {
                Ellipse()
                    .frame(width: ellipse.widthFactor * logoSize, height: ellipse.heightFactor * logoSize)
                    .offset(y: ellipse.offsetFactor * logoSize)
                Rectangle()
                    .frame(width: rectangle.widthFactor * logoSize, height: rectangle.heightFactor * logoSize)
                    .offset(y: rectangle.offsetFactor * logoSize)
            }
        }
        
        func icon(logoSize: CGFloat) -> some View {
            Image(.hatIcon)
                .resizable()
                .colorInvert()
                .padding()
                .frame(width: logoSize, height: logoSize)
                .background(RoundedRectangle(cornerRadius: logoSize / 5).fill(.mint).stroke(.white, lineWidth: 2))
                .scaleEffect(logo.logoScale)
                .offset(y: logo.offsetY * logoSize)
        }
        
        func ellipseShadow(logoSize: CGFloat) -> some View {
            Ellipse()
                .scaleEffect(logo.ellipseScale)
                .frame(width: ellipse.widthFactor * logoSize, height: ellipse.heightFactor * logoSize)
                .offset(y: ellipse.offsetFactor * logoSize)
        }
        
        var percentageText: some View {
            Text(text)
                .font(.largeTitle).fontDesign(.rounded)
                .foregroundStyle(.white)
                .mask {
                    Rectangle()
                        .scale(x: logo.percentage, anchor: .leading)
                }
        }
        
        var body: some View {
            GeometryReader { geo in
                let size = geo.size
                let logoSize = size.width / 5
                
                ZStack {
                    Color.oceanBlue1.ignoresSafeArea()
                    ellipseShadow(logoSize: logoSize)
                    
                    HStack {
                        icon(logoSize: logoSize)
                            .mask {
                                mask(logoSize: logoSize)
                            }
                        if logo.showText {
                            percentageText
                        }
                    }
                }
            }
        }
    }
    
    @State private var trigger: Bool = false
    
    var body: some View {
        ZStack {}
            .phaseAnimator(TextLogoPhases.allCases, trigger: trigger) { _, phase in
                LogoPhasesView(text: "TrilbyTV App", logo: phase.logoModel)
            } animation: { phase in
                phase.animation
            }
            .onTapGesture {
                trigger.toggle()
            }
    }
}

#Preview {
    LogoSplashView()
}
