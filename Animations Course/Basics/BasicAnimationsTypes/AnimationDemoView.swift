//
//  AnimationDemoView.swift
//  Animations Course
//
//  Created by Shemek on 17/10/2025.
//

import SwiftUI


struct AnimationDemoView: View {
    let animationModel: AnimationModel
    
    @State private var animate = false
    @State private var showLinear = true
    
    var body: some View {
        VStack {
            Text(LocalizedStringKey(animationModel.description))
                .font(.title)
                .multilineTextAlignment(.leading)
                .minimumScaleFactor(0.1)
                .padding()
            
            Spacer()
            
            if showLinear {
                Circle()
                    .fill(Color.pink)
                    .frame(width: 50, height: 50)
                    .offset(x: animate ? 150 : -150)
                    .animation(.linear(duration: 1), value: animate)
            }
            
            Circle()
                .fill(.blue)
                .frame(width: 50, height: 50)
                .offset(x: animate ? 150 : -150)
                .animation(animationModel.animation, value: animate)
            
            Spacer()
            
            Toggle(isOn: $showLinear) {
                Text("Show linear animation")
            }
            
            Button("Animate") {
                animate.toggle()
            }.buttonStyle(.borderedProminent)
                .padding()
        }
        .padding()
        .navigationTitle(animationModel.title)
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

#Preview {
    AnimationDemoView(
        animationModel: .init(
            title: "EaseIn Animation",
            description: "Starts slowly and accelerates toward the end.",
            animation: .easeIn(duration: 1)
        )
    )
}
