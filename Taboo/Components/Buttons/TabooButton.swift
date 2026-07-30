//
//  Taboo.swift
//  Taboo
//
//  Created by 권한준 on 7/17/26.
//

import Foundation
import SwiftUI

public struct TabooButton: View {
    @Environment(\.isEnabled) var isEnabled: Bool
    
    @State var isPressed: Bool = false
    
    private var label: String
    private var action: () -> Void
    private var size: TabooButtonSize
    
    private var tabooButtonDefauls: TabooButtonDefaults = TabooButtonDefaults()
    private var backgroundColor: Color {
        TabooButtonDefaults().backgroundColor(isEnabled: isEnabled)
    }
    
    public init(
        label: String,
        action: @escaping () -> Void,
        size: TabooButtonSize = .xlarge
    ) {
        self.label = label
        self.action = action
        self.size = size
    }
    
    public var body: some View {
        VStack {
            Text(label)
                .foregroundStyle(.white)
        }
        .frame(height: tabooButtonDefauls.height(buttonSize: size))
        .padding(.horizontal, tabooButtonDefauls.padding(buttonSize: size))
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .scaleEffect(isPressed ? 0.9 : 1.0)
        .animation(.spring(duration: 0.1), value: isPressed)
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

public struct TabooButtonDefaults {
    func height(buttonSize: TabooButtonSize) -> CGFloat {
        return switch buttonSize {
            case .small: 35
            case .medium: 40
            case .large: 50
            case .xlarge: 60
        }
    }
    
    func padding(buttonSize: TabooButtonSize) -> CGFloat {
        return switch buttonSize {
            case .small: 12
            case .medium: 15
            case .large: 18
            case .xlarge: 21
        }
    }
    
    func backgroundColor(isEnabled: Bool) -> Color {
        isEnabled ? TabooColor.tabooBlue600 : TabooColor.tabooBlue200
    }
    
    func textColor() -> Color {
        return .white
    }
}

public enum TabooButtonSize {
    case small, medium, large, xlarge
}

#Preview {
    VStack {
        TabooButton(
            label: "Button",
            action: {
                print("Login")
            },
            size: .small
        )
        
        TabooButton(
            label: "Button",
            action: {
                print("Login")
            },
            size: .medium
        )
        
        TabooButton(
            label: "Button",
            action: {
                print("Login")
            },
            size: .large
        )
        
        TabooButton(
            label: "Button",
            action: {
                print("Login")
            },
            size: .xlarge
        )
    }
}


#Preview {
    VStack {
        TabooButton(
            label: "Button",
            action: {
                print("Login")
            },
            size: .small
        )
        .disabled(true)
        
        TabooButton(
            label: "Button",
            action: {
                print("Login")
            },
            size: .medium
        )
        .disabled(true)
        
        TabooButton(
            label: "Button",
            action: {
                print("Login")
            },
            size: .large
        )
        .disabled(true)
        
        TabooButton(
            label: "Button",
            action: {
                print("Login")
            },
            size: .xlarge
        )
        .disabled(true)
    }
}
