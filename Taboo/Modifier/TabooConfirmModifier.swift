//
//  TabooConfirmModifier.swift
//  Taboo
//
//  Created by 권한준 on 8/10/26.
//
import SwiftUI

struct TabooConfirmModifier: ViewModifier {
    @Binding var isPresented: Bool
    
    let title: String
    let description: String?
    let cancelButtonLabel: String
    let confirmButtonLabel: String
    let cancelButtonAction: (() -> Void)?
    let confirmButtonAction: (() -> Void)?
    
    func body(content: Content) -> some View {
        content
            .overlay {
                if (isPresented) {
                    ZStack {
                        Color.black.opacity(0.4)
                            .ignoresSafeArea()
                            .onTapGesture {
                                isPresented = false
                            }
                        
                        TabooConfirm(
                            isPresented: $isPresented,
                            title: title,
                            description: description,
                            cancelButtonLabel: cancelButtonLabel,
                            confirmButtonLabel: confirmButtonLabel,
                            cancelButtonAction: cancelButtonAction,
                            confirmButtonAction: confirmButtonAction
                        )
                    }
                    .ignoresSafeArea()
                }
            }
    }
}
