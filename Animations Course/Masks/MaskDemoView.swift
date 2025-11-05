//
//  MaskDemoView.swift
//  Animations Course
//
//  Created by Shemek on 03/11/2025.
//

import SwiftUI

struct MaskDemoView: View {
    let fontSize = 64.0
    
    let color1: Color = .red
    let color2: Color = .yellow
    let color3: Color = .purple
    
    var bgColor: Color {
        bgColors[index % bgColors.count]
    }
    
    let str1 = "MA"
    let str2 = "SK"
    let str3 = "ING"
    
    var str: String {
        str1 + str2 + str3
    }
    
    let animationDuration: TimeInterval = 1.0
    @State private var timer: Timer? = nil
    @State private var index: Int = 0
    
    var colorfulText: some View {
        HStack(spacing: 0) {
            Text(str1)
                .foregroundStyle(color1)
            
            Text(str2)
                .foregroundStyle(color2)
            
            Text(str3)
                .foregroundStyle(color3)
            
        }
        .font(.system(size: fontSize, weight: .bold, design: .rounded))
        .padding()
    }
    
    var maskedText: some View {
        Text(str)
            .font(.system(size: fontSize, weight: .bold, design: .rounded))
            .padding()
            .background(
                bgColor
            )
    }
    
    var phases: [CGSize] {
        [
            .init(width: fontSize * -1.85, height: fontSize * 0.33),
            .init(width: fontSize * -0.8, height: fontSize * -(1/5)),
            .init(width: fontSize * 0.3, height: fontSize * 0),
            .init(width: fontSize * 0.9, height: fontSize * 0.33),
            .init(width: fontSize * 1.9, height: fontSize * -0.33)
        ]
    }
    
    var maskOffset: CGSize {
        phases[index]
    }
    
    let bgColors: [Color] = [.green, .blue, .orange]
    
    var mask: some View {
        Image(systemName: "diamond.fill")
            .resizable()
            .frame(width: fontSize, height: fontSize)
            .offset(maskOffset)
    }
    
    var body: some View {
        ZStack {
            colorfulText
                .opacity(index % 2 == 0 ? 1 : 0)
            
            maskedText
                .mask {
                    mask
                }
        }
        .onAppear {
            animate()
        }
        .onTapGesture {
            timer?.invalidate()
            index = 0
            animate()
        }
        
    }
    
    func animate() {
        var count = 0
        timer = Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: true) { timer in
            withAnimation(.smooth(duration: animationDuration)) {
                index = (index + 1) % phases.count
            }
            count += 1
            if count >= phases.count {
                timer.invalidate()
            }
        }
    }
}

#Preview {
    MaskDemoView()
}
