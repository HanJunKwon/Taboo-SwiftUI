//
//  TabooBottomSheetExtension.swift
//  Taboo
//
//  Created by 권한준 on 8/10/26.
//
import SwiftUI

extension View {
    func tabooBottomSheet<SheetContent: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> SheetContent
    ) -> some View {
        return self.modifier(BottomSheetModifier(isPresented: isPresented, sheetContent: content))
    }
}
