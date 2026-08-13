//
//  TabooTextFieldModifier+Box.swift
//  Taboo
//
//  Created by 권한준 on 8/11/26.
//
import SwiftUI

struct TabooBoxTextFieldModifer: ViewModifier {
    @FocusState private var focus: Bool
    
    func body(content: Content) -> some View {
        content
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .background(focus ? TabooColor.tabooBlue100 : TabooColor.tabooGray100)
            .cornerRadius(14)
            .focused($focus)
    }
}
