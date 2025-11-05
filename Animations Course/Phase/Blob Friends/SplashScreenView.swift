//
//  SplashScreenView.swift
//  Animations Course
//
//  Created by Shemek on 04/11/2025.
//

import SwiftUI

struct SplashScreenView: View {
        let blobZoom: Double
        let blobColor: Color
        let welcomeColor: Color
        let welcomeOpacity: Double
        let offset: CGFloat
        
        init(
            blobZoom: Double = 1,
            bloobColor: Color = .deepPurple,
            welcomeColor: Color = .black,
            welcomeOpacity: Double = 0.3,
            offset: CGFloat = -50.0
        ) {
            self.blobZoom = blobZoom
            self.blobColor = bloobColor
            self.welcomeColor = welcomeColor
            self.welcomeOpacity = welcomeOpacity
            self.offset = offset
        }
        
        struct MyBlob: Shape {
            func path(in rect: CGRect) -> Path {
                var path = Path()
                let width = rect.size.width
                let height = rect.size.height
                path.move(to: CGPoint(x: 0.98936*width, y: 0.53817*height))
                path.addCurve(to: CGPoint(x: 0.49314*width, y: 0.85754*height), control1: CGPoint(x: 0.92751*width, y: 0.81631*height), control2: CGPoint(x: 0.81469*width, y: 0.93411*height))
                path.addCurve(to: CGPoint(x: 0.01966*width, y: 0.69785*height), control1: CGPoint(x: 0.28986*width, y: 0.99366*height), control2: CGPoint(x: -0.09061*width, y: 1.15335*height))
                path.addCurve(to: CGPoint(x: 0.49314*width, y: 0.03555*height), control1: CGPoint(x: 0.11478*width, y: 0.41971*height), control2: CGPoint(x: 0.24849*width, y: 0.14833*height))
                path.addCurve(to: CGPoint(x: 0.98936*width, y: 0.53817*height), control1: CGPoint(x: 0.82677*width, y: -0.11825*height), control2: CGPoint(x: 1.0512*width, y: 0.26002*height))
                path.closeSubpath()
                return path
            }
        }
        
        
        var body: some View {
            VStack {
                Spacer()
                MyBlob()
                    .fill(blobColor.gradient)
                    .frame(width: 350, height: 250)
                    .scaleEffect(blobZoom)
                    .overlay {
                        HStack(spacing: -20) {
                            Image(.image1)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                            Image(.image2)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                            Image(.image3)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                        }
                    }
                Spacer()
                Text("Welcome!")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundStyle(welcomeColor)
                    .opacity(welcomeOpacity)
                Spacer()
                Spacer()
            }
            .offset(y: offset)
        }
    }

#Preview {
    SplashScreenView()
}
