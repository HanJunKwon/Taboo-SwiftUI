//
//  TabooConfirmExtension.swift
//  Taboo
//
//  Created by 권한준 on 8/10/26.
//
import SwiftUI

extension View {
    func tabooConfirm(
        isPresented: Binding<Bool>,
        title: String,
        description: String,
        cancelButtonLabel: String,
        confirmButtonLabel: String,
        cancelButtonAction: (() -> Void)?,
        confirmButtonAction: (() -> Void)?
    ) -> some View {
        return self.modifier(
            TabooConfirmModifier(
                isPresented: isPresented,
                title: title,
                description: description,
                cancelButtonLabel: cancelButtonLabel,
                confirmButtonLabel: confirmButtonLabel,
                cancelButtonAction: cancelButtonAction,
                confirmButtonAction: confirmButtonAction
            )
        )
    }
}
