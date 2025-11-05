//
//  MeshWIthTextureView.swift
//  Animations Course
//
//  Created by Shemek on 30/10/2025.
//

import SwiftUI

struct MeshWIthTextureView: View {
    let opacity: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            ZStack {
                MeshView()
                    .opacity(opacity)
                Image(.textures)
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.width, height: size.height)
                    .opacity(1)
                    .blur(radius: 20)
                    .blendMode(.overlay)
            }
        }
    }
}

#Preview {
    MeshWIthTextureView(opacity: 0.8)
        .ignoresSafeArea()
}
