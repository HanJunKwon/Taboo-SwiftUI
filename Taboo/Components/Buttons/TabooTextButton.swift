//
//  TabooTextButton.swift
//  Taboo
//
//  Created by 권한준 on 8/4/26.
//

import SwiftUI

struct TabooTextButton: View {
    @Environment(\.isEnabled) var isEnabled: Bool
    
    @State private var isPressed: Bool = false
    
    private var label: String
    private var systemName: String? = nil
    
    private var textButtonDefaults = TabooTextButtonDefault()
    private var background: Color {
        textButtonDefaults.backgroundColor(isPressed: self.isPressed)
    }
    
    private var foregroundColor: Color {
        textButtonDefaults.foregroundColor(isEnabled: self.isEnabled)
    }
    
    init(
        label: String
    ) {
        self.label = label
    }
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(foregroundColor)
            
            if let systemName = self.systemName {
                Image(systemName: systemName)
                    .foregroundColor(foregroundColor)
            }
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 12)
        .background(background)
        .cornerRadius(10)
        .scaleEffect(isPressed ? 0.9 : 1.0)
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
}

extension TabooTextButton {
    func icon(systemName: String) -> TabooTextButton {
        var view = self
        view.systemName = systemName
        
        return view
    }
}

struct TabooTextButtonDefault {
    func backgroundColor(isPressed: Bool) -> Color {
        return if isPressed {
            TabooColor.tabooGray100
        } else {
            .clear
        }
    }
    
    func foregroundColor(isEnabled: Bool) -> Color {
        return if isEnabled {
            .black
        } else {
            TabooColor.tabooGray400
        }
    }
}

#Preview {
    VStack {
        TabooTextButton(label: "텍스트 버튼")
            .icon(systemName: "chevron.right")
        
        TabooTextButton(label: "비활성화 버튼")
            .icon(systemName: "chevron.right")
            .disabled(true)
    }
}
