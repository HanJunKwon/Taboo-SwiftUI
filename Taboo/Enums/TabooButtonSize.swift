//
//  TabooButtonSize.swift
//  Taboo
//
//  Created by 권한준 on 8/5/26.
//
import SwiftUI

public enum TabooButtonSize {
    case small, medium, large, xlarge
    
    var height: CGFloat {
        switch self {
        case .small: 35
        case .medium: 40
        case .large: 50
        case .xlarge: 60
        }
    }
    
    var horizontalPadding: CGFloat {
        switch self {
        case .small: 12
        case .medium: 15
        case .large: 18
        case .xlarge: 21
        }
    }
}
