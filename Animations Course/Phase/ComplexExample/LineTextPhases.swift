//
//  LineTextPhases.swift
//  Animations Course
//
//  Created by Shemek on 04/11/2025.
//

import SwiftUI

enum LineTextPhases: CaseIterable {
    case initial, circle, capsule, text, textAndLine, fadeOutText, fadeOutLine
    
    var textForegroundColor: Color {
        switch self {
        case .initial:
                .clear
        case .circle:
                .clear
        case .capsule:
                .clear
        case .text:
                .black
        case .textAndLine:
                .blue
        case .fadeOutText:
                .red
        case .fadeOutLine:
                .clear
        }
    }
    
    var textOpacity: Double {
        switch self {
        case .initial, .circle, .capsule: 0
        default: 1
        }
    }
    
    var offsetX: CGFloat {
        switch self {
        case .textAndLine: -1000
        default: 0
        }
    }
    
    var strokeColor: Color {
        switch self {
        case .initial:
                .black
        case .circle:
                .gray
        case .capsule:
                .red
        case .text:
                .purple
        case .textAndLine:
                .red
        case .fadeOutText:
                .red
        case .fadeOutLine:
                .black
        }
    }
    
    var strokeOpacity: Double {
        switch self {
        case .initial:
            0
        case .circle:
            1.0
        case .capsule:
            1.0
        case .text:
            1.0
        case .textAndLine:
            1.0
        case .fadeOutText:
            1.0
        case .fadeOutLine:
            0
        }
    }
    
    var backgroundShape: some Shape {
        switch self {
        case .initial:
            RoundedRectangle(cornerRadius: 100)
        case .circle:
            RoundedRectangle(cornerRadius: 100)
        case .capsule:
            RoundedRectangle(cornerRadius: 5)
        case .text:
            RoundedRectangle(cornerRadius: 0)
        case .textAndLine:
            RoundedRectangle(cornerRadius: 0)
        case .fadeOutText:
            RoundedRectangle(cornerRadius: 0)
        case .fadeOutLine:
            RoundedRectangle(cornerRadius: 0)
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .initial:
                .blue.opacity(0)
        case .circle:
                .blue.opacity(1)
        case .capsule:
                .blue.opacity(1)
        case .text:
                .black.opacity(0)
        case .textAndLine:
                .black.opacity(0)
        case .fadeOutText:
                .black.opacity(0)
        case .fadeOutLine:
                .black.opacity(0)
        }
    }
    
    var shapeScale: CGFloat {
        switch self {
        case .initial:
            0.0
        case .circle:
            1.0
        case .capsule:
            1.0
        case .text:
            1.0
        case .textAndLine:
            1.0
        case .fadeOutText:
            1.0
        case .fadeOutLine:
            1.0
        }
    }
    
    var animation: Animation {
        switch self {
        case .initial:
                .smooth(duration: 0.2)
        case .circle:
                .easeIn(duration: 0.3)
        case .capsule:
                .easeOut(duration: 0.4)
        case .text:
                .easeInOut(duration: 2)
        case .textAndLine:
                .easeInOut(duration: 1)
        case .fadeOutText:
                .easeInOut(duration: 2)
        case .fadeOutLine:
                .easeInOut(duration: 1)
        }
    }
}
