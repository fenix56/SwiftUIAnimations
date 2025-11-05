//
//  TwinkleStarsView.swift
//  Animations Course
//
//  Created by Shemek on 31/10/2025.
//

import SwiftUI

struct GlowEffect: ViewModifier {
    let color: Color
    let radius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .shadow(color: color, radius: radius)
    }
    
}

extension View {
    func glow(color: Color, radius: CGFloat) -> some View {
        self.modifier(GlowEffect(color: color, radius: radius))
    }
}

struct BackgroundImageView: View {
    let image: ImageResource
    let size: CGSize
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: size.width, height: size.height)
    }
}

struct TwinkleStarsView: View {
    struct FallingStar: Identifiable {
        let id = UUID()
        let color: Color
        var offset: CGPoint
        let size: CGFloat
        let animationDuration: TimeInterval
        let rotationAxis: (x: CGFloat, y: CGFloat, z: CGFloat)
        var rotationAngle: Double
        var isFading = false
    }
    
    struct Star: Shape{
        let starPoints: Int
        let starThickness: CGFloat
        
        func path(in rect: CGRect) -> Path {
            let n = starPoints * 2
            
            var path = Path()
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let radius = min(rect.width, rect.height) / 2
            let angleStep = .pi * 2 / CGFloat(n)
            for i in 0..<n {
                let angle = angleStep * CGFloat(i)
                let currentRadius = (i % 2 == 0) ? radius - starThickness : radius
                
                let point = CGPoint(
                    x: center.x + currentRadius * cos(angle),
                    y: center.y + currentRadius * sin(angle)
                )
                
                if i == 0 {
                    path.move(to: point)
                } else {
                    path.addLine(to: point)
                }
            }
            
            path.closeSubpath()
            
            
            return path
        }
    }
    
    @State private var stars: [FallingStar] = []
    @State private var timer: Timer? = nil
    
    let starLifeSpan: TimeInterval
    let starThickness: CGFloat
    let dim: CGFloat
    let starColors: [Color]
    
    init(
        starLifeSpan: TimeInterval = 10.0,
        starThickness: CGFloat = 40.0,
        dim: CGFloat = 40.0,
        starColors: [Color] = [.white, .yellow, .teal]
    ) {
        self.starLifeSpan = starLifeSpan
        self.starThickness = starThickness
        self.dim = dim
        self.starColors = starColors
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                BackgroundImageView(image: .winter, size: geo.size)
                    .opacity(0.6)
                
                ForEach(stars) { star in
                    Star(starPoints: 5, starThickness: starThickness)
                        .fill(star.color)
                        .frame(width: star.size, height: star.size)
                        .rotation3DEffect(.degrees(star.rotationAngle), axis: star.rotationAxis)
                        .position(star.offset)
                        .opacity(star.isFading ? 0 : 0.7)
                        .glow(color: .white, radius: .random(in: 8...15))
                        .onAppear {
                            fallAndFadeIn(star: star, in: geo.size)
                            DispatchQueue.main.asyncAfter(deadline: .now() + starLifeSpan) {
                                withAnimation {
                                    fadeOutStar(star: star)
                                } completion: {
                                    removeStar(star: star)
                                }
                            }
                        }
                }
                
                VStack {
                    Spacer()
                    Text("Start count: \(stars.count)")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .bold()
                }
                .padding()
            }
            .onAppear {
                startTimer(in: geo.size)
            }
        }
    }
    
    func startTimer(in screenSize: CGSize) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            // Spawn a random star
            spawnRandomStar(in: screenSize)
        }
    }
    
    func spawnRandomStar(in screenSize: CGSize) {
        let randomColor = starColors.randomElement() ?? .white
        let randomSize = CGFloat.random(in: 30...70)
        let randomOffset = CGPoint(
            x: CGFloat.random(in: 0...screenSize.width),
            y: -randomSize
        )
        let randomDuration = TimeInterval.random(in: 9...10)
        let randomRotationAxis = (
            x: CGFloat.random(in: -1...1),
            y: CGFloat.random(in: -1...1),
            z: CGFloat.random(in: -1...1)
        )
        let randomRotationAngle = Double.random(in: 0...360)
        
        let newStar: FallingStar = .init(
            color: randomColor,
            offset: randomOffset,
            size: randomSize,
            animationDuration: randomDuration,
            rotationAxis: randomRotationAxis,
            rotationAngle: randomRotationAngle
        )
        
        stars.append(newStar)
    }
    
    func fadeOutStar(star: FallingStar) {
        stars = stars.map { currentStar in
            if currentStar.id == star.id {
                var updateStar = currentStar
                updateStar.isFading = true
                
                return updateStar
            }
            return currentStar
        }
    }
    
    func removeStar(star: FallingStar) {
        stars.removeAll { $0.id == star.id }
    }
    
    func fallAndFadeIn(star: FallingStar, in screenSize: CGSize) {
        withAnimation(.linear(duration: star.animationDuration)) {
            stars = stars.map { currentStar in
                if currentStar.id == star.id {
                    var updateStar = currentStar
                    updateStar.offset.y = screenSize.height + currentStar.size
                    updateStar.rotationAngle += 360.0
                    
                    return updateStar
                }
                return currentStar
            }
        }
    }
    
}

#Preview {
    TwinkleStarsView()
        .ignoresSafeArea()
}
