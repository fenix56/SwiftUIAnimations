//
//  DrawPathView.swift
//  Animations Course
//
//  Created by Shemek on 29/10/2025.
//

import SwiftUI

struct DrawPathView<ShapeType: Shape>: View {
    var linearGradient: LinearGradient {
        LinearGradient(
            colors: [.purple, .red, .pink],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    let shape: ShapeType
    
    @State private var rotation = 0.0
    
    var body: some View {
        shape
            .trim(from: 0, to: rotation / 360)
//            .foregroundStyle(linearGradient)
            .stroke(
                linearGradient,
                style: StrokeStyle(
                    lineWidth: 5,
                    lineCap: .round,
                    lineJoin: .round
                )
            )
            .hueRotation(.degrees(rotation))
            .frame(width: 200, height: 200)
            .onAppear {
                withAnimation(.linear(duration: 5).delay(1).repeatForever(autoreverses: true)) {
                    rotation = 360
                }
            }
    }
}

// I can use the SFSymbols an export it as SVG to figma and then to SVG->SWiftUI converter 
struct SunWithBorderIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.addRect(CGRect(x: 0, y: 0, width: width, height: height))
        path.move(to: CGPoint(x: 0.49182*width, y: 0.17918*height))
        path.addCurve(to: CGPoint(x: 0.53091*width, y: 0.13911*height), control1: CGPoint(x: 0.51318*width, y: 0.17918*height), control2: CGPoint(x: 0.53091*width, y: 0.16122*height))
        path.addLine(to: CGPoint(x: 0.53091*width, y: 0.04007*height))
        path.addCurve(to: CGPoint(x: 0.49182*width, y: 0), control1: CGPoint(x: 0.53091*width, y: 0.01796*height), control2: CGPoint(x: 0.51318*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.45227*width, y: 0.04007*height), control1: CGPoint(x: 0.47*width, y: 0), control2: CGPoint(x: 0.45227*width, y: 0.01796*height))
        path.addLine(to: CGPoint(x: 0.45227*width, y: 0.13911*height))
        path.addCurve(to: CGPoint(x: 0.49182*width, y: 0.17918*height), control1: CGPoint(x: 0.45227*width, y: 0.16122*height), control2: CGPoint(x: 0.47*width, y: 0.17918*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.71455*width, y: 0.27361*height))
        path.addCurve(to: CGPoint(x: 0.77045*width, y: 0.27361*height), control1: CGPoint(x: 0.73*width, y: 0.28881*height), control2: CGPoint(x: 0.755*width, y: 0.28927*height))
        path.addLine(to: CGPoint(x: 0.84*width, y: 0.20313*height))
        path.addCurve(to: CGPoint(x: 0.84*width, y: 0.14648*height), control1: CGPoint(x: 0.855*width, y: 0.18793*height), control2: CGPoint(x: 0.855*width, y: 0.16214*height))
        path.addCurve(to: CGPoint(x: 0.78455*width, y: 0.14648*height), control1: CGPoint(x: 0.825*width, y: 0.13128*height), control2: CGPoint(x: 0.79954*width, y: 0.13128*height))
        path.addLine(to: CGPoint(x: 0.71455*width, y: 0.21741*height))
        path.addCurve(to: CGPoint(x: 0.71455*width, y: 0.27361*height), control1: CGPoint(x: 0.69954*width, y: 0.23261*height), control2: CGPoint(x: 0.69954*width, y: 0.25841*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.80682*width, y: 0.49977*height))
        path.addCurve(to: CGPoint(x: 0.84636*width, y: 0.53938*height), control1: CGPoint(x: 0.80682*width, y: 0.52142*height), control2: CGPoint(x: 0.825*width, y: 0.53938*height))
        path.addLine(to: CGPoint(x: 0.94409*width, y: 0.53938*height))
        path.addCurve(to: CGPoint(x: 0.98318*width, y: 0.49977*height), control1: CGPoint(x: 0.96545*width, y: 0.53938*height), control2: CGPoint(x: 0.98318*width, y: 0.52142*height))
        path.addCurve(to: CGPoint(x: 0.94409*width, y: 0.4597*height), control1: CGPoint(x: 0.98318*width, y: 0.47812*height), control2: CGPoint(x: 0.96545*width, y: 0.4597*height))
        path.addLine(to: CGPoint(x: 0.84636*width, y: 0.4597*height))
        path.addCurve(to: CGPoint(x: 0.80682*width, y: 0.49977*height), control1: CGPoint(x: 0.825*width, y: 0.4597*height), control2: CGPoint(x: 0.80682*width, y: 0.47812*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.71455*width, y: 0.72593*height))
        path.addCurve(to: CGPoint(x: 0.71455*width, y: 0.78213*height), control1: CGPoint(x: 0.69954*width, y: 0.74159*height), control2: CGPoint(x: 0.69954*width, y: 0.76693*height))
        path.addLine(to: CGPoint(x: 0.78455*width, y: 0.85352*height))
        path.addCurve(to: CGPoint(x: 0.84*width, y: 0.85306*height), control1: CGPoint(x: 0.79954*width, y: 0.86872*height), control2: CGPoint(x: 0.825*width, y: 0.8678*height))
        path.addCurve(to: CGPoint(x: 0.84*width, y: 0.79687*height), control1: CGPoint(x: 0.855*width, y: 0.8374*height), control2: CGPoint(x: 0.855*width, y: 0.81207*height))
        path.addLine(to: CGPoint(x: 0.77*width, y: 0.72593*height))
        path.addCurve(to: CGPoint(x: 0.71455*width, y: 0.72593*height), control1: CGPoint(x: 0.755*width, y: 0.71073*height), control2: CGPoint(x: 0.73*width, y: 0.71119*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.49182*width, y: 0.82036*height))
        path.addCurve(to: CGPoint(x: 0.45227*width, y: 0.85997*height), control1: CGPoint(x: 0.47*width, y: 0.82036*height), control2: CGPoint(x: 0.45227*width, y: 0.83832*height))
        path.addLine(to: CGPoint(x: 0.45227*width, y: 0.95946*height))
        path.addCurve(to: CGPoint(x: 0.49182*width, y: 0.99908*height), control1: CGPoint(x: 0.45227*width, y: 0.98111*height), control2: CGPoint(x: 0.47*width, y: 0.99908*height))
        path.addCurve(to: CGPoint(x: 0.53091*width, y: 0.95946*height), control1: CGPoint(x: 0.51318*width, y: 0.99908*height), control2: CGPoint(x: 0.53091*width, y: 0.98111*height))
        path.addLine(to: CGPoint(x: 0.53091*width, y: 0.85997*height))
        path.addCurve(to: CGPoint(x: 0.49182*width, y: 0.82036*height), control1: CGPoint(x: 0.53091*width, y: 0.83832*height), control2: CGPoint(x: 0.51318*width, y: 0.82036*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.26864*width, y: 0.72593*height))
        path.addCurve(to: CGPoint(x: 0.21273*width, y: 0.72593*height), control1: CGPoint(x: 0.25318*width, y: 0.71119*height), control2: CGPoint(x: 0.22773*width, y: 0.71073*height))
        path.addLine(to: CGPoint(x: 0.14318*width, y: 0.79641*height))
        path.addCurve(to: CGPoint(x: 0.14273*width, y: 0.8526*height), control1: CGPoint(x: 0.12818*width, y: 0.81161*height), control2: CGPoint(x: 0.12818*width, y: 0.83694*height))
        path.addCurve(to: CGPoint(x: 0.19864*width, y: 0.85306*height), control1: CGPoint(x: 0.15773*width, y: 0.86734*height), control2: CGPoint(x: 0.18364*width, y: 0.86826*height))
        path.addLine(to: CGPoint(x: 0.26818*width, y: 0.78213*height))
        path.addCurve(to: CGPoint(x: 0.26864*width, y: 0.72593*height), control1: CGPoint(x: 0.28318*width, y: 0.76693*height), control2: CGPoint(x: 0.28318*width, y: 0.74159*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.17636*width, y: 0.49977*height))
        path.addCurve(to: CGPoint(x: 0.13682*width, y: 0.4597*height), control1: CGPoint(x: 0.17636*width, y: 0.47812*height), control2: CGPoint(x: 0.15818*width, y: 0.4597*height))
        path.addLine(to: CGPoint(x: 0.03909*width, y: 0.4597*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.49977*height), control1: CGPoint(x: 0.01773*width, y: 0.4597*height), control2: CGPoint(x: 0, y: 0.47812*height))
        path.addCurve(to: CGPoint(x: 0.03909*width, y: 0.53938*height), control1: CGPoint(x: 0, y: 0.52142*height), control2: CGPoint(x: 0.01773*width, y: 0.53938*height))
        path.addLine(to: CGPoint(x: 0.13682*width, y: 0.53938*height))
        path.addCurve(to: CGPoint(x: 0.17636*width, y: 0.49977*height), control1: CGPoint(x: 0.15818*width, y: 0.53938*height), control2: CGPoint(x: 0.17636*width, y: 0.52142*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.26818*width, y: 0.27361*height))
        path.addCurve(to: CGPoint(x: 0.26864*width, y: 0.21741*height), control1: CGPoint(x: 0.28318*width, y: 0.25887*height), control2: CGPoint(x: 0.28318*width, y: 0.23215*height))
        path.addLine(to: CGPoint(x: 0.19909*width, y: 0.14648*height))
        path.addCurve(to: CGPoint(x: 0.14364*width, y: 0.14648*height), control1: CGPoint(x: 0.18455*width, y: 0.13174*height), control2: CGPoint(x: 0.15864*width, y: 0.13128*height))
        path.addCurve(to: CGPoint(x: 0.14318*width, y: 0.20267*height), control1: CGPoint(x: 0.12864*width, y: 0.16214*height), control2: CGPoint(x: 0.12864*width, y: 0.18793*height))
        path.addLine(to: CGPoint(x: 0.21273*width, y: 0.27361*height))
        path.addCurve(to: CGPoint(x: 0.26818*width, y: 0.27361*height), control1: CGPoint(x: 0.22773*width, y: 0.28881*height), control2: CGPoint(x: 0.25273*width, y: 0.28881*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.49182*width, y: 0.73422*height))
        path.addCurve(to: CGPoint(x: 0.72318*width, y: 0.49977*height), control1: CGPoint(x: 0.61954*width, y: 0.73422*height), control2: CGPoint(x: 0.72318*width, y: 0.6292*height))
        path.addCurve(to: CGPoint(x: 0.49182*width, y: 0.26485*height), control1: CGPoint(x: 0.72318*width, y: 0.37034*height), control2: CGPoint(x: 0.61954*width, y: 0.26485*height))
        path.addCurve(to: CGPoint(x: 0.26*width, y: 0.49977*height), control1: CGPoint(x: 0.36409*width, y: 0.26485*height), control2: CGPoint(x: 0.26*width, y: 0.37034*height))
        path.addCurve(to: CGPoint(x: 0.49182*width, y: 0.73422*height), control1: CGPoint(x: 0.26*width, y: 0.6292*height), control2: CGPoint(x: 0.36409*width, y: 0.73422*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.49182*width, y: 0.66421*height))
        path.addCurve(to: CGPoint(x: 0.32909*width, y: 0.49977*height), control1: CGPoint(x: 0.40182*width, y: 0.66421*height), control2: CGPoint(x: 0.32909*width, y: 0.59097*height))
        path.addCurve(to: CGPoint(x: 0.49182*width, y: 0.33487*height), control1: CGPoint(x: 0.32909*width, y: 0.40857*height), control2: CGPoint(x: 0.40182*width, y: 0.33487*height))
        path.addCurve(to: CGPoint(x: 0.65409*width, y: 0.49977*height), control1: CGPoint(x: 0.58182*width, y: 0.33487*height), control2: CGPoint(x: 0.65409*width, y: 0.40857*height))
        path.addCurve(to: CGPoint(x: 0.49182*width, y: 0.66421*height), control1: CGPoint(x: 0.65409*width, y: 0.59097*height), control2: CGPoint(x: 0.58182*width, y: 0.66421*height))
        path.closeSubpath()
        return path
    }
}

struct SunIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.48029*width, y: 0.17267*height))
        path.addCurve(to: CGPoint(x: 0.51846*width, y: 0.13406*height), control1: CGPoint(x: 0.50115*width, y: 0.17267*height), control2: CGPoint(x: 0.51846*width, y: 0.15536*height))
        path.addLine(to: CGPoint(x: 0.51846*width, y: 0.03862*height))
        path.addCurve(to: CGPoint(x: 0.48029*width, y: 0), control1: CGPoint(x: 0.51846*width, y: 0.01731*height), control2: CGPoint(x: 0.50115*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.44167*width, y: 0.03862*height), control1: CGPoint(x: 0.45899*width, y: 0), control2: CGPoint(x: 0.44167*width, y: 0.01731*height))
        path.addLine(to: CGPoint(x: 0.44167*width, y: 0.13406*height))
        path.addCurve(to: CGPoint(x: 0.48029*width, y: 0.17267*height), control1: CGPoint(x: 0.44167*width, y: 0.15536*height), control2: CGPoint(x: 0.45899*width, y: 0.17267*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.6978*width, y: 0.26367*height))
        path.addCurve(to: CGPoint(x: 0.7524*width, y: 0.26367*height), control1: CGPoint(x: 0.71289*width, y: 0.27832*height), control2: CGPoint(x: 0.7373*width, y: 0.27876*height))
        path.addLine(to: CGPoint(x: 0.82031*width, y: 0.19576*height))
        path.addCurve(to: CGPoint(x: 0.82031*width, y: 0.14116*height), control1: CGPoint(x: 0.83496*width, y: 0.18111*height), control2: CGPoint(x: 0.83496*width, y: 0.15625*height))
        path.addCurve(to: CGPoint(x: 0.76616*width, y: 0.14116*height), control1: CGPoint(x: 0.80566*width, y: 0.12651*height), control2: CGPoint(x: 0.7808*width, y: 0.12651*height))
        path.addLine(to: CGPoint(x: 0.6978*width, y: 0.20952*height))
        path.addCurve(to: CGPoint(x: 0.6978*width, y: 0.26367*height), control1: CGPoint(x: 0.68315*width, y: 0.22417*height), control2: CGPoint(x: 0.68315*width, y: 0.24902*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.78791*width, y: 0.48162*height))
        path.addCurve(to: CGPoint(x: 0.82653*width, y: 0.5198*height), control1: CGPoint(x: 0.78791*width, y: 0.50249*height), control2: CGPoint(x: 0.80566*width, y: 0.5198*height))
        path.addLine(to: CGPoint(x: 0.92196*width, y: 0.5198*height))
        path.addCurve(to: CGPoint(x: 0.96014*width, y: 0.48162*height), control1: CGPoint(x: 0.94283*width, y: 0.5198*height), control2: CGPoint(x: 0.96014*width, y: 0.50249*height))
        path.addCurve(to: CGPoint(x: 0.92196*width, y: 0.443*height), control1: CGPoint(x: 0.96014*width, y: 0.46076*height), control2: CGPoint(x: 0.94283*width, y: 0.443*height))
        path.addLine(to: CGPoint(x: 0.82653*width, y: 0.443*height))
        path.addCurve(to: CGPoint(x: 0.78791*width, y: 0.48162*height), control1: CGPoint(x: 0.80566*width, y: 0.443*height), control2: CGPoint(x: 0.78791*width, y: 0.46076*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.6978*width, y: 0.69957*height))
        path.addCurve(to: CGPoint(x: 0.6978*width, y: 0.75373*height), control1: CGPoint(x: 0.68315*width, y: 0.71467*height), control2: CGPoint(x: 0.68315*width, y: 0.73908*height))
        path.addLine(to: CGPoint(x: 0.76616*width, y: 0.82253*height))
        path.addCurve(to: CGPoint(x: 0.82031*width, y: 0.82209*height), control1: CGPoint(x: 0.7808*width, y: 0.83718*height), control2: CGPoint(x: 0.80566*width, y: 0.83629*height))
        path.addCurve(to: CGPoint(x: 0.82031*width, y: 0.76793*height), control1: CGPoint(x: 0.83496*width, y: 0.807*height), control2: CGPoint(x: 0.83496*width, y: 0.78258*height))
        path.addLine(to: CGPoint(x: 0.75195*width, y: 0.69957*height))
        path.addCurve(to: CGPoint(x: 0.6978*width, y: 0.69957*height), control1: CGPoint(x: 0.7373*width, y: 0.68493*height), control2: CGPoint(x: 0.71289*width, y: 0.68537*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.48029*width, y: 0.79057*height))
        path.addCurve(to: CGPoint(x: 0.44167*width, y: 0.82875*height), control1: CGPoint(x: 0.45899*width, y: 0.79057*height), control2: CGPoint(x: 0.44167*width, y: 0.80788*height))
        path.addLine(to: CGPoint(x: 0.44167*width, y: 0.92463*height))
        path.addCurve(to: CGPoint(x: 0.48029*width, y: 0.9628*height), control1: CGPoint(x: 0.44167*width, y: 0.94549*height), control2: CGPoint(x: 0.45899*width, y: 0.9628*height))
        path.addCurve(to: CGPoint(x: 0.51846*width, y: 0.92463*height), control1: CGPoint(x: 0.50115*width, y: 0.9628*height), control2: CGPoint(x: 0.51846*width, y: 0.94549*height))
        path.addLine(to: CGPoint(x: 0.51846*width, y: 0.82875*height))
        path.addCurve(to: CGPoint(x: 0.48029*width, y: 0.79057*height), control1: CGPoint(x: 0.51846*width, y: 0.80788*height), control2: CGPoint(x: 0.50115*width, y: 0.79057*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.26234*width, y: 0.69957*height))
        path.addCurve(to: CGPoint(x: 0.20774*width, y: 0.69957*height), control1: CGPoint(x: 0.24725*width, y: 0.68537*height), control2: CGPoint(x: 0.22239*width, y: 0.68493*height))
        path.addLine(to: CGPoint(x: 0.13983*width, y: 0.76749*height))
        path.addCurve(to: CGPoint(x: 0.13938*width, y: 0.82165*height), control1: CGPoint(x: 0.12518*width, y: 0.78214*height), control2: CGPoint(x: 0.12518*width, y: 0.80655*height))
        path.addCurve(to: CGPoint(x: 0.19398*width, y: 0.82209*height), control1: CGPoint(x: 0.15403*width, y: 0.83585*height), control2: CGPoint(x: 0.17933*width, y: 0.83674*height))
        path.addLine(to: CGPoint(x: 0.2619*width, y: 0.75373*height))
        path.addCurve(to: CGPoint(x: 0.26234*width, y: 0.69957*height), control1: CGPoint(x: 0.27654*width, y: 0.73908*height), control2: CGPoint(x: 0.27654*width, y: 0.71467*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.17223*width, y: 0.48162*height))
        path.addCurve(to: CGPoint(x: 0.13361*width, y: 0.443*height), control1: CGPoint(x: 0.17223*width, y: 0.46076*height), control2: CGPoint(x: 0.15447*width, y: 0.443*height))
        path.addLine(to: CGPoint(x: 0.03817*width, y: 0.443*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.48162*height), control1: CGPoint(x: 0.01731*width, y: 0.443*height), control2: CGPoint(x: 0, y: 0.46076*height))
        path.addCurve(to: CGPoint(x: 0.03817*width, y: 0.5198*height), control1: CGPoint(x: 0, y: 0.50249*height), control2: CGPoint(x: 0.01731*width, y: 0.5198*height))
        path.addLine(to: CGPoint(x: 0.13361*width, y: 0.5198*height))
        path.addCurve(to: CGPoint(x: 0.17223*width, y: 0.48162*height), control1: CGPoint(x: 0.15447*width, y: 0.5198*height), control2: CGPoint(x: 0.17223*width, y: 0.50249*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.2619*width, y: 0.26367*height))
        path.addCurve(to: CGPoint(x: 0.26234*width, y: 0.20952*height), control1: CGPoint(x: 0.27654*width, y: 0.24947*height), control2: CGPoint(x: 0.27654*width, y: 0.22372*height))
        path.addLine(to: CGPoint(x: 0.19442*width, y: 0.14116*height))
        path.addCurve(to: CGPoint(x: 0.14027*width, y: 0.14116*height), control1: CGPoint(x: 0.18022*width, y: 0.12695*height), control2: CGPoint(x: 0.15492*width, y: 0.12651*height))
        path.addCurve(to: CGPoint(x: 0.13983*width, y: 0.19531*height), control1: CGPoint(x: 0.12562*width, y: 0.15625*height), control2: CGPoint(x: 0.12562*width, y: 0.18111*height))
        path.addLine(to: CGPoint(x: 0.20774*width, y: 0.26367*height))
        path.addCurve(to: CGPoint(x: 0.2619*width, y: 0.26367*height), control1: CGPoint(x: 0.22239*width, y: 0.27832*height), control2: CGPoint(x: 0.2468*width, y: 0.27832*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.48029*width, y: 0.70756*height))
        path.addCurve(to: CGPoint(x: 0.70623*width, y: 0.48162*height), control1: CGPoint(x: 0.60502*width, y: 0.70756*height), control2: CGPoint(x: 0.70623*width, y: 0.60635*height))
        path.addCurve(to: CGPoint(x: 0.48029*width, y: 0.25524*height), control1: CGPoint(x: 0.70623*width, y: 0.35689*height), control2: CGPoint(x: 0.60502*width, y: 0.25524*height))
        path.addCurve(to: CGPoint(x: 0.25391*width, y: 0.48162*height), control1: CGPoint(x: 0.35556*width, y: 0.25524*height), control2: CGPoint(x: 0.25391*width, y: 0.35689*height))
        path.addCurve(to: CGPoint(x: 0.48029*width, y: 0.70756*height), control1: CGPoint(x: 0.25391*width, y: 0.60635*height), control2: CGPoint(x: 0.35556*width, y: 0.70756*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.48029*width, y: 0.64009*height))
        path.addCurve(to: CGPoint(x: 0.32138*width, y: 0.48162*height), control1: CGPoint(x: 0.3924*width, y: 0.64009*height), control2: CGPoint(x: 0.32138*width, y: 0.56951*height))
        path.addCurve(to: CGPoint(x: 0.48029*width, y: 0.32271*height), control1: CGPoint(x: 0.32138*width, y: 0.39373*height), control2: CGPoint(x: 0.3924*width, y: 0.32271*height))
        path.addCurve(to: CGPoint(x: 0.63876*width, y: 0.48162*height), control1: CGPoint(x: 0.56818*width, y: 0.32271*height), control2: CGPoint(x: 0.63876*width, y: 0.39373*height))
        path.addCurve(to: CGPoint(x: 0.48029*width, y: 0.64009*height), control1: CGPoint(x: 0.63876*width, y: 0.56951*height), control2: CGPoint(x: 0.56818*width, y: 0.64009*height))
        path.closeSubpath()
        return path
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        DrawPathView(shape: SunIcon())
    }
}
