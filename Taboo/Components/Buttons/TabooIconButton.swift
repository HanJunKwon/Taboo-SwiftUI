//
//  TabooIconButton.swift
//  Taboo
//
//  Created by 권한준 on 7/30/26.
//

import SwiftUI

public struct TabooIconButton: View {
    private var systemName: String
    private var size: TabooIconButtonSize
    private var style: TabooIconButtonStyle
    
    private var tabooIconButtonDefults: TabooIconButtonDefaults = .init()

    private var boxSize: CGFloat {
        tabooIconButtonDefults.boxSize(size: self.size)
    }
    
    private var boxColor: Color {
        tabooIconButtonDefults.boxColor(style: self.style)
    }
    
    private var iconSize: CGFloat {
        tabooIconButtonDefults.iconSize(size: self.size)
    }
    
    private var strokeColor: Color {
        tabooIconButtonDefults.strokeColor(style: self.style)
    }
    
    
    public init(
        systemName: String,
        size: TabooIconButtonSize = .medium,
        style: TabooIconButtonStyle = .clear
    ) {
        self.systemName = systemName
        self.size = size
        self.style = style
    }
    
    public var body: some View {
        VStack {
            Image(systemName: self.systemName)
                .resizable()
                .scaledToFit()
                .frame(
                    width: iconSize,
                    height: iconSize
                )
        }
        .frame(
            width: boxSize,
            height: boxSize
        )
        .background(
            self.boxColor
        )
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(self.strokeColor, style: StrokeStyle(lineWidth: 2))
        }
        .modifier(PressScaleModifier())
    }
}

struct TabooIconButtonDefaults {
    func boxSize(size: TabooIconButtonSize) -> CGFloat {
        return switch (size) {
            case .small: 32
            case .medium: 38
            case .large: 48
        }
    }
    
    func boxColor(style: TabooIconButtonStyle) -> Color {
        switch (style) {
            case .clear: .clear
            case .fill: TabooColor.tabooGray100
            case .outline: .clear
        }
    }
    
    func iconSize(size: TabooIconButtonSize) -> CGFloat {
        return switch (size) {
            case .small: 16
            case .medium: 20
            case .large: 24
        }
    }
    
    func strokeColor(style: TabooIconButtonStyle) -> Color {
        return switch (style) {
            case .clear: .clear
            case .fill: .clear
            case .outline : TabooColor.tabooGray100
        }
    }
}

public enum TabooIconButtonSize {
    case small, medium, large
}

public enum TabooIconButtonStyle {
    case clear, fill, outline
}

extension TabooIconButton {
    func buttonSize(size: TabooIconButtonSize) -> TabooIconButton {
        var view = self
        view.size = size
        
        return view
    }
    
    func buttonStyle(style: TabooIconButtonStyle) -> TabooIconButton {
        var view = self
        view.style = style
        
        return view
    }
}

#Preview {
    VStack {
        HStack {
            TabooIconButton(
                systemName: "star.fill"
            )
            .buttonStyle(style: .clear)
            .buttonSize(size: .small)
            
            TabooIconButton(
                systemName: "star.fill"
            )
            .buttonStyle(style: .clear)
            .buttonSize(size: .medium)
            
            TabooIconButton(
                systemName: "star.fill"
            )
            .buttonStyle(style: .clear)
            .buttonSize(size: .large)
        }
        
        HStack {
            TabooIconButton(
                systemName: "star.fill"
            )
            .buttonStyle(style: .fill)
            .buttonSize(size: .small)
            
            TabooIconButton(
                systemName: "star.fill"
            )
            .buttonStyle(style: .fill)
            .buttonSize(size: .medium)
            
            TabooIconButton(
                systemName: "star.fill"
            )
            .buttonStyle(style: .fill)
            .buttonSize(size: .large)
        }
    
        HStack {
            TabooIconButton(
                systemName: "star.fill"
            )
            .buttonStyle(style: .outline)
            .buttonSize(size: .small)
            
            TabooIconButton(
                systemName: "star.fill"
            )
            .buttonStyle(style: .outline)
            .buttonSize(size: .medium)
            
            TabooIconButton(
                systemName: "star.fill"
            )
            .buttonStyle(style: .outline)
            .buttonSize(size: .large)
        }
    }
}
