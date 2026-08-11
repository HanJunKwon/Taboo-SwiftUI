//
//  TabooListRowSize.swift
//  Taboo
//
//  Created by 권한준 on 8/11/26.
//
import SwiftUI

enum TabooListVPadding {
    case small, medium, large, xlarge
    
    var padding: CGFloat {
        switch self {
        case .small: 4
        case .medium: 8
        case .large: 12
        case .xlarge: 16
        }
    }
}
