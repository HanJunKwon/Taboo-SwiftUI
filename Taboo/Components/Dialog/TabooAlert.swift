//
//  TabooAlert.swift
//  Taboo
//
//  Created by 권한준 on 8/7/26.
//
import SwiftUI

struct TabooAlert: View {
    @Binding var isPresented: Bool
    
    let title: String
    let description: String?
    let buttonLabel: String?
    let buttonAction: (() -> Void)?
    
    var body: some View {
        VStack {
            Text(title)
            
            if let desc = self.description {
                Text(desc)
            }
            
            TabooButton(
                label: buttonLabel ?? "OK",
                action: {
                    isPresented = false
                    buttonAction?()
                }
            )
        }
        .padding(20)
        .background(.white)
        .cornerRadius(shape: .medium)
    }
}

#Preview {
    @Previewable @State var isPresented = false
    
    VStack {
        TabooButton(label: "다이얼로그 띄우기", action: {
            isPresented = true
        })
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.yellow)
    .tabooAlert(
        isPresented: $isPresented,
        title: "TabooAlert",
        desc: "다이얼로그 창",
        buttonLabel: "확인",
        buttonAction: {}
    )
}
