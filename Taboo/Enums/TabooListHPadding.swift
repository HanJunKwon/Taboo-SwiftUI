//
//  TabooListHPadding.swift
//  Taboo
//
//  Created by 권한준 on 8/11/26.
//
import SwiftUI

enum TabooListHPadding {
    case xsmall, small, medium
    
    var padding: CGFloat {
        switch self {
        case .xsmall: 4
        case .small: 10
        case .medium: 15
        }
    }
}
