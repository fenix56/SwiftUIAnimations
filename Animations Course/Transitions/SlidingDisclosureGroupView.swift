//
//  SlidingDisclosureGroupView.swift
//  Animations Course
//
//  Created by Shemek on 01/11/2025.
//

import SwiftUI

struct SlidingDisclosureGroupView: View {
    let title: String
    let detailedText: String
    let radius: CGFloat
    let fillColor: Color
    
    init(
        title: String,
        detailedText: String,
        radius: CGFloat = 10.0,
        fillColor: Color = .secondary
    ) {
        self.title = title
        self.detailedText = detailedText
        self.radius = radius
        self.fillColor = fillColor
    }
    
    @State private var isExpanded: Bool = false
    
    var titleClipShape: UnevenRoundedRectangle {
        UnevenRoundedRectangle(
            topLeadingRadius: radius,
            bottomLeadingRadius: isExpanded ? 0 : radius,
            bottomTrailingRadius: isExpanded ? 0 : radius,
            topTrailingRadius: radius,
            style: .circular
        )
    }
    var detailedTextClipShape: UnevenRoundedRectangle {
        UnevenRoundedRectangle(
            topLeadingRadius: 0,
            bottomLeadingRadius: radius,
            bottomTrailingRadius: radius,
            topTrailingRadius: 0,
            style: .circular
        )
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(LocalizedStringKey(title))
                    .font(.headline)
                Spacer()
                
                Image(systemName: "chevron.right")
                    .rotationEffect(.degrees(isExpanded ? 90 : 0))
            }
            .padding()
            .background(fillColor)
            .clipShape(titleClipShape)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.3)){
                    isExpanded.toggle()
                }
            }
            
            if isExpanded {
                Text(LocalizedStringKey(detailedText))
                    .font(.body)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(fillColor)
                    .clipShape(detailedTextClipShape)
                    .transition(.opacity.combined(with: .slide))
            }
        }
    }
}

#Preview {
    SlidingDisclosureGroupView(
        title: "How to use an accordion?",
        detailedText: "To use an accordion UI component, click on the header to expand or collapse content sections, which is ideal for organizing a large amount of information on a single page."
    )
    .padding()
}
