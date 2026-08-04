//
//  CornerRoundExtension.swift
//  Taboo
//
//  Created by 권한준 on 8/4/26.
//
import SwiftUI

extension View {
    func cornerRadius(shape: TabooShape) -> some View {
        switch (shape) {
            case .extraSmall: return self.cornerRadius(4)
            case .small: return self.cornerRadius(6)
            case .medium: return self.cornerRadius(10)
            case .large: return self.cornerRadius(14)
            case .extraLarge: return self.cornerRadius(16)
        }
    }
}
