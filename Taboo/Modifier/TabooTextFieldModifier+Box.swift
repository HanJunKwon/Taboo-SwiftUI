//
//  TabooTextFieldModifier+Box.swift
//  Taboo
//
//  Created by 권한준 on 8/11/26.
//
import SwiftUI

struct TabooBoxTextFieldModifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(TabooColor.tabooGray100)
            .cornerRadius(8)
    }
}
