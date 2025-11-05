//
//  HeartSVGView.swift
//  Animations Course
//
//  Created by Shemek on 29/10/2025.
//

import SwiftUI

struct HeartSVGView: View {
    
    var linearGradient: LinearGradient {
        LinearGradient(
            colors: [.purple, .red, .pink],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    @State private var rotation = 0.0
    
    var body: some View {
        HeartSVGIcon()
            .trim(from: 0, to: rotation / 360)
            .foregroundStyle(linearGradient)
            .hueRotation(.degrees(rotation))
            .frame(width: 200, height: 200)
            .onAppear {
                withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
                    rotation = 360
                }
            }
    }
}

// You can convert any SVG to SwiftUI on https://svg-to-swiftui.quassum.com/
struct HeartSVGIcon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.875*width, y: 0.49999*height))
        path.addLine(to: CGPoint(x: 0.7765*width, y: 0.49999*height))
        path.addCurve(to: CGPoint(x: 0.72324*width, y: 0.5054*height), control1: CGPoint(x: 0.74909*width, y: 0.49999*height), control2: CGPoint(x: 0.73538*width, y: 0.49999*height))
        path.addCurve(to: CGPoint(x: 0.68358*width, y: 0.54138*height), control1: CGPoint(x: 0.7111*width, y: 0.5108*height), control2: CGPoint(x: 0.70193*width, y: 0.521*height))
        path.addLine(to: CGPoint(x: 0.6407*width, y: 0.58904*height))
        path.addCurve(to: CGPoint(x: 0.60857*width, y: 0.61392*height), control1: CGPoint(x: 0.62564*width, y: 0.60576*height), control2: CGPoint(x: 0.61812*width, y: 0.61412*height))
        path.addCurve(to: CGPoint(x: 0.57757*width, y: 0.5877*height), control1: CGPoint(x: 0.59903*width, y: 0.61371*height), control2: CGPoint(x: 0.59187*width, y: 0.60504*height))
        path.addLine(to: CGPoint(x: 0.43056*width, y: 0.40951*height))
        path.addCurve(to: CGPoint(x: 0.4015*width, y: 0.38471*height), control1: CGPoint(x: 0.41722*width, y: 0.39334*height), control2: CGPoint(x: 0.41055*width, y: 0.38526*height))
        path.addCurve(to: CGPoint(x: 0.36968*width, y: 0.40585*height), control1: CGPoint(x: 0.39245*width, y: 0.38417*height), control2: CGPoint(x: 0.38486*width, y: 0.3914*height))
        path.addLine(to: CGPoint(x: 0.30704*width, y: 0.46551*height))
        path.addCurve(to: CGPoint(x: 0.26904*width, y: 0.49552*height), control1: CGPoint(x: 0.28916*width, y: 0.48254*height), control2: CGPoint(x: 0.28022*width, y: 0.49105*height))
        path.addCurve(to: CGPoint(x: 0.22083*width, y: 0.49999*height), control1: CGPoint(x: 0.25787*width, y: 0.49999*height), control2: CGPoint(x: 0.24552*width, y: 0.49999*height))
        path.addLine(to: CGPoint(x: 0.125*width, y: 0.49999*height))
        path.move(to: CGPoint(x: 0.5*width, y: 0.22919*height))
        path.addLine(to: CGPoint(x: 0.47748*width, y: 0.25086*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.26044*height), control1: CGPoint(x: 0.48337*width, y: 0.25698*height), control2: CGPoint(x: 0.4915*width, y: 0.26044*height))
        path.addCurve(to: CGPoint(x: 0.52252*width, y: 0.25086*height), control1: CGPoint(x: 0.5085*width, y: 0.26044*height), control2: CGPoint(x: 0.51663*width, y: 0.25698*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.22919*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.11069*width, y: 0.55818*height))
        path.addCurve(to: CGPoint(x: 0.15374*width, y: 0.5682*height), control1: CGPoint(x: 0.11982*width, y: 0.57283*height), control2: CGPoint(x: 0.13909*width, y: 0.57732*height))
        path.addCurve(to: CGPoint(x: 0.16375*width, y: 0.52515*height), control1: CGPoint(x: 0.16839*width, y: 0.55907*height), control2: CGPoint(x: 0.17287*width, y: 0.5398*height))
        path.addLine(to: CGPoint(x: 0.11069*width, y: 0.55818*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.27207*width, y: 0.65716*height))
        path.addCurve(to: CGPoint(x: 0.22788*width, y: 0.65721*height), control1: CGPoint(x: 0.25985*width, y: 0.64497*height), control2: CGPoint(x: 0.24007*width, y: 0.64499*height))
        path.addCurve(to: CGPoint(x: 0.22793*width, y: 0.7014*height), control1: CGPoint(x: 0.21569*width, y: 0.66943*height), control2: CGPoint(x: 0.21571*width, y: 0.68922*height))
        path.addLine(to: CGPoint(x: 0.27207*width, y: 0.65716*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.11458*width, y: 0.38071*height))
        path.addCurve(to: CGPoint(x: 0.23247*width, y: 0.16655*height), control1: CGPoint(x: 0.11458*width, y: 0.26392*height), control2: CGPoint(x: 0.16697*width, y: 0.19146*height))
        path.addCurve(to: CGPoint(x: 0.47748*width, y: 0.25086*height), control1: CGPoint(x: 0.29814*width, y: 0.14156*height), control2: CGPoint(x: 0.38964*width, y: 0.15959*height))
        path.addLine(to: CGPoint(x: 0.52252*width, y: 0.20752*height))
        path.addCurve(to: CGPoint(x: 0.21025*width, y: 0.10813*height), control1: CGPoint(x: 0.42287*width, y: 0.10399*height), control2: CGPoint(x: 0.30603*width, y: 0.0717*height))
        path.addCurve(to: CGPoint(x: 0.05208*width, y: 0.38071*height), control1: CGPoint(x: 0.11429*width, y: 0.14463*height), control2: CGPoint(x: 0.05208*width, y: 0.24533*height))
        path.addLine(to: CGPoint(x: 0.11458*width, y: 0.38071*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.64594*width, y: 0.8125*height))
        path.addCurve(to: CGPoint(x: 0.84192*width, y: 0.62433*height), control1: CGPoint(x: 0.70812*width, y: 0.76348*height), control2: CGPoint(x: 0.78265*width, y: 0.69775*height))
        path.addCurve(to: CGPoint(x: 0.94792*width, y: 0.38071*height), control1: CGPoint(x: 0.90052*width, y: 0.55172*height), control2: CGPoint(x: 0.94792*width, y: 0.46704*height))
        path.addLine(to: CGPoint(x: 0.88542*width, y: 0.38071*height))
        path.addCurve(to: CGPoint(x: 0.79329*width, y: 0.58507*height), control1: CGPoint(x: 0.88542*width, y: 0.44533*height), control2: CGPoint(x: 0.84907*width, y: 0.51595*height))
        path.addCurve(to: CGPoint(x: 0.60725*width, y: 0.76341*height), control1: CGPoint(x: 0.73817*width, y: 0.65336*height), control2: CGPoint(x: 0.66766*width, y: 0.71578*height))
        path.addLine(to: CGPoint(x: 0.64594*width, y: 0.8125*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.94792*width, y: 0.38071*height))
        path.addCurve(to: CGPoint(x: 0.78975*width, y: 0.10813*height), control1: CGPoint(x: 0.94792*width, y: 0.24533*height), control2: CGPoint(x: 0.88571*width, y: 0.14463*height))
        path.addCurve(to: CGPoint(x: 0.47748*width, y: 0.20752*height), control1: CGPoint(x: 0.69397*width, y: 0.0717*height), control2: CGPoint(x: 0.57713*width, y: 0.10399*height))
        path.addLine(to: CGPoint(x: 0.52252*width, y: 0.25086*height))
        path.addCurve(to: CGPoint(x: 0.76753*width, y: 0.16655*height), control1: CGPoint(x: 0.61036*width, y: 0.15959*height), control2: CGPoint(x: 0.70185*width, y: 0.14156*height))
        path.addCurve(to: CGPoint(x: 0.88542*width, y: 0.38071*height), control1: CGPoint(x: 0.83303*width, y: 0.19146*height), control2: CGPoint(x: 0.88542*width, y: 0.26392*height))
        path.addLine(to: CGPoint(x: 0.94792*width, y: 0.38071*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.35406*width, y: 0.81249*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.88483*height), control1: CGPoint(x: 0.40715*width, y: 0.85435*height), control2: CGPoint(x: 0.44375*width, y: 0.88483*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.82233*height))
        path.addCurve(to: CGPoint(x: 0.39275*width, y: 0.76341*height), control1: CGPoint(x: 0.46955*width, y: 0.82233*height), control2: CGPoint(x: 0.45065*width, y: 0.80906*height))
        path.addLine(to: CGPoint(x: 0.35406*width, y: 0.81249*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.60725*width, y: 0.76341*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.82233*height), control1: CGPoint(x: 0.54935*width, y: 0.80906*height), control2: CGPoint(x: 0.53045*width, y: 0.82233*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.88483*height))
        path.addCurve(to: CGPoint(x: 0.64594*width, y: 0.8125*height), control1: CGPoint(x: 0.55625*width, y: 0.88483*height), control2: CGPoint(x: 0.59285*width, y: 0.85435*height))
        path.addLine(to: CGPoint(x: 0.60725*width, y: 0.76341*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.16375*width, y: 0.52515*height))
        path.addCurve(to: CGPoint(x: 0.11458*width, y: 0.38071*height), control1: CGPoint(x: 0.13267*width, y: 0.47523*height), control2: CGPoint(x: 0.11458*width, y: 0.4263*height))
        path.addLine(to: CGPoint(x: 0.05208*width, y: 0.38071*height))
        path.addCurve(to: CGPoint(x: 0.11069*width, y: 0.55818*height), control1: CGPoint(x: 0.05208*width, y: 0.44237*height), control2: CGPoint(x: 0.07627*width, y: 0.5029*height))
        path.addLine(to: CGPoint(x: 0.16375*width, y: 0.52515*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.39275*width, y: 0.76341*height))
        path.addCurve(to: CGPoint(x: 0.27207*width, y: 0.65716*height), control1: CGPoint(x: 0.35455*width, y: 0.73329*height), control2: CGPoint(x: 0.31212*width, y: 0.69711*height))
        path.addLine(to: CGPoint(x: 0.22793*width, y: 0.7014*height))
        path.addCurve(to: CGPoint(x: 0.35406*width, y: 0.81249*height), control1: CGPoint(x: 0.27015*width, y: 0.74352*height), control2: CGPoint(x: 0.31451*width, y: 0.78131*height))
        path.addLine(to: CGPoint(x: 0.39275*width, y: 0.76341*height))
        path.closeSubpath()
        return path
    }
}

#Preview {
    HeartSVGView()
}
