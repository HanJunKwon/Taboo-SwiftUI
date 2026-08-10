//
//  Taboo.swift
//  Taboo
//
//  Created by 권한준 on 7/17/26.
//

import Foundation
import SwiftUI

public struct TabooButton<Label>: View where Label: View {
    private var label: () -> Label
    private var action: () -> Void
    private var size: TabooButtonSize = .xlarge
    private var style: TabooButtonStyle = .primary
    
    public init(
        action: @escaping () -> Void,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.label = label
        self.action = action
    }
    
    public var body: some View {
        switch style {
        case .primary:
            Button {
                action()
            } label: {
                label()
            }
                .buttonStyle(TabooButtonPrimaryStyle(size: size))
                .modifier(PressScaleModifier())
        case .secondary:
            Button {
                action()
            } label: {
                label()
            }
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
        TabooButton {
            print("Login")
        } label: {
            Text("Button")
        }
        .size(size: .small)
        
        TabooButton {
            print("Login")
        } label: {
            Text("Button")
        }
        .size(size: .medium)
        
        TabooButton {
            print("Login")
        } label: {
            Text("Button")
        }
        .size(size: .large)
        
        TabooButton {
            print("Login")
        } label: {
            Text("Button")
        }
        .size(size: .xlarge)
    }
}

#Preview {
    VStack {
        TabooButton {
            print("Login")
        } label: {
            Text("Button")
        }
        .size(size: .small)
        .style(style: .secondary)
        
        TabooButton {
            print("Login")
        } label: {
            Text("Button")
        }
        .size(size: .medium)
        .style(style: .secondary)
        
        TabooButton {
            print("Login")
        } label: {
            Text("Button")
        }
        .size(size: .large)
        .style(style: .secondary)
        
        TabooButton {
            print("Login")
        } label: {
            Text("Button")
        }
        .size(size: .xlarge)
        .style(style: .secondary)
    }
}


#Preview {
    VStack {
        TabooButton {
            print("Login")
        } label: {
            Text("Button")
        }
        .size(size: .small)
        .disabled(true)
        
        TabooButton {
            print("Login")
        } label: {
            Text("Button")
        }
        .size(size: .medium)
        .disabled(true)
        
        TabooButton {
            print("Login")
        } label: {
            Text("Button")
        }
        .size(size: .large)
        .disabled(true)
        
        TabooButton {
            print("Login")
        } label: {
            Text("Button")
        }
        .size(size: .xlarge)
        .disabled(true)
    }
}
