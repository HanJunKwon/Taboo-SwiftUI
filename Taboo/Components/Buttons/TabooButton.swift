//
//  Taboo.swift
//  Taboo
//
//  Created by 권한준 on 7/17/26.
//

import Foundation
import SwiftUI

public struct TabooButton: View {
    private var label: String
    private var action: () -> Void
    private var size: TabooButtonSize = .xlarge
    private var style: TabooButtonStyle = .primary
    
    public init(
        label: String,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.action = action
    }
    
    public var body: some View {
        switch style {
        case .primary:
            Button(label, action: action)
                .buttonStyle(TabooButtonPrimaryStyle(size: size))
                .modifier(PressScaleModifier())
        case .secondary:
            Button(label, action: action)
                .buttonStyle(TabooButtonSecondaryStyle(size: size))
                .modifier(PressScaleModifier())
        }
    }
    
    func size(size: TabooButtonSize) -> Self {
        var view = self
        view.size = size
        
        return view
    }
    
    func style(style: TabooButtonStyle) -> Self {
        var view = self
        view.style = style
        
        return view
    }
}

#Preview {
    VStack {
        TabooButton(
            label: "Button",
            action: {
                print("Login")
            }
        )
        .size(size: TabooButtonSize.small)
        
        TabooButton(
            label: "Button",
            action: {
                print("Login")
            }
        )
        .size(size: TabooButtonSize.medium)
        
        TabooButton(
            label: "Button",
            action: {
                print("Login")
            }
        )
        .size(size: TabooButtonSize.large)
        
        TabooButton(
            label: "Button",
            action: {
                print("Login")
            }
        )
        .size(size: TabooButtonSize.xlarge)
    }
}

#Preview {
    VStack {
        TabooButton(
            label: "Button",
            action: {
                print("Login")
            }
        )
        .size(size: .small)
        .style(style: .secondary)
        
        TabooButton(
            label: "Button",
            action: {
                print("Login")
            }
        )
        .size(size: .medium)
        .style(style: .secondary)
        
        TabooButton(
            label: "Button",
            action: {
                print("Login")
            }
        )
        .size(size: .large)
        .style(style: .secondary)
        
        TabooButton(
            label: "Button",
            action: {
                print("Login")
            }
        )
        .size(size: .xlarge)
        .style(style: .secondary)
    }
}


#Preview {
    VStack {
        TabooButton(
            label: "Button",
            action: {
                print("Login")
            }
        )
        .size(size: .small)
        .disabled(true)
        
        TabooButton(
            label: "Button",
            action: {
                print("Login")
            }
        )
        .size(size: .medium)
        .disabled(true)
        
        TabooButton(
            label: "Button",
            action: {
                print("Login")
            }
        )
        .size(size: .medium)
        .disabled(true)
        
        TabooButton(
            label: "Button",
            action: {
                print("Login")
            }
        )
        .size(size: .large)
        .disabled(true)
    }
}
