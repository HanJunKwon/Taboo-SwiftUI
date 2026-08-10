//
//  TabooBottomModifier.swift
//  Taboo
//
//  Created by 권한준 on 8/10/26.
//
import SwiftUI

struct BottomSheetModifier<SheetContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    @ViewBuilder var sheetContent: () -> SheetContent
    
    func body(content: Content) -> some View {
        content.overlay {
            if isPresented {
                ZStack(alignment: .bottom) {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            isPresented = false
                        }
                    
                    TabooBottomSheet(
                        isPresented: $isPresented
                    ) {
                        sheetContent()
                    }
                    .padding(.horizontal, 10)
                }
            }
        }
    }
}
