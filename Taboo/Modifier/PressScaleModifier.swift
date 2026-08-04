//
//  ScaleAnimationAction.swift
//  Taboo
//
//  Created by 권한준 on 8/4/26.
//

import SwiftUI

struct PressScaleModifier: ViewModifier {
    @State private var isPressed: Bool = false
    
    private var pressedColor: Color = TabooColor.tabooGray100
    private var backgroundColor: Color {
        if isPressed {
            self.pressedColor
        } else {
            .clear
        }
    }
    
    func body(content: Content) -> some View {
        content
            .background(backgroundColor)
            .cornerRadius(10)
            .scaleEffect(isPressed ? 0.9 : 1)
            .animation(.spring(duration: 0.23), value: isPressed)
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged{ _ in
                        if !isPressed {
                            isPressed = true
                        }
                    }
                    .onEnded{ _ in
                        isPressed = false
                    }
            )
    }
    
    func pressedColor(color: Color) -> PressScaleModifier {
        .init(pressedColor: color)
    }
}
