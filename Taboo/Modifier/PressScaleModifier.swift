//
//  ScaleAnimationAction.swift
//  Taboo
//
//  Created by 권한준 on 8/4/26.
//

import SwiftUI

struct PressScaleModifier: ViewModifier {
    @State private var isPressed: Bool = false
    
    var pressedColor: Color = TabooColor.tabooGray100
    private var backgroundColor: Color {
        if isPressed {
            self.pressedColor
        } else {
            .clear
        }
    }
    
    var action: () -> Void = {}
    
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
                        
                        action()
                    }
            )
    }
    
    func pressedColor(color: Color) -> Self {
        var copy = self
        copy.pressedColor = color
        
        return copy
    }
    
    func action(action: @escaping @MainActor () -> Void) -> Self {
        var copy = self
        copy.action = action
        
        return copy
    }
}
