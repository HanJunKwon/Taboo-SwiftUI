//
//  DialogModifier.swift
//  Taboo
//
//  Created by 권한준 on 8/7/26.
//

import SwiftUI

struct TabooAlertModifier: ViewModifier {
    @Binding var isPresented: Bool
    
    let title: String
    let description: String?
    let buttonLabel: String?
    let buttonAction: (() -> Void)?
    
    func body(content: Content) -> some View {
        content
            .overlay {
                if isPresented {
                    ZStack {
                        Color.black.opacity(0.4)
                            .ignoresSafeArea()
                            .onTapGesture {
                                isPresented = false
                            }
                        
                        TabooAlert(
                            isPresented: $isPresented,
                            title: title,
                            description: description,
                            buttonLabel: buttonLabel,
                            buttonAction: buttonAction
                        )
                    }
                    .ignoresSafeArea()
                }
            }
    }
}
