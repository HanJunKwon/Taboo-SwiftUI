//
//  TabooTextFieldModifier+Line.swift
//  Taboo
//
//  Created by 권한준 on 8/11/26.
//
import SwiftUI

struct TabooLineTextFieldModifier: ViewModifier {
    var focus: FocusState<Bool>.Binding
    
    func body(content: Content) -> some View {
        content
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .focused(focus)
            .overlay(
                Rectangle()
                    .fill(focus.wrappedValue ? TabooColor.tabooBlue600 : TabooColor.tabooGray100)
                    .frame(height: 2),
                alignment: .bottom
            )
    }
}
