//
//  Alert+Dialog.swift
//  Taboo
//
//  Created by 권한준 on 8/7/26.
//
import SwiftUI

extension View {
    func tabooAlert(
        isPresented: Binding<Bool>,
        title: String,
        desc: String?,
        buttonLabel: String?,
        buttonAction: @escaping @MainActor () -> Void
    ) -> some View {
        
        return self.modifier(
            TabooAlertModifier(
                isPresented: isPresented,
                title: title,
                description: desc,
                buttonLabel: buttonLabel,
                buttonAction: buttonAction
            )
        )
    }
}
