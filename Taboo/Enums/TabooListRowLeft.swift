//
//  TabooListRowLeft.swift
//  Taboo
//
//  Created by 권한준 on 8/11/26.
//
import SwiftUI

enum TabooListRowLeft {
    case none
    case text(text: Text, shape: TabooListRowLeftShape)
    case asset(icon: TabooIcon, shape: TabooListRowLeftShape)
}

enum TabooIcon {
    case system(String)
    case asset(ImageResource)
    
    var image: Image {
        switch self {
        case .system(let name): Image(systemName: name)
        case .asset(let res): Image(res)
        }
    }
}

enum TabooListRowLeftShape {
    case original, squircle, circle
    
    var shape: AnyShape {
        switch self {
        case .original: AnyShape(RoundedRectangle(cornerRadius: 10))
        case .squircle: AnyShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        case .circle: AnyShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
    }
}
