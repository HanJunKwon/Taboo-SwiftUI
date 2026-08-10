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
        VStack(
            alignment: .leading,
            spacing: 20
        ) {
            Text(title)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
                .font(.system(size: 20, weight: .semibold))
            
            if let desc = self.description {
                Text(desc)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(TabooColor.tabooGray500)
                    .font(.system(size: 16, weight: .semibold))
            }
            
            TabooButton {
                isPresented = false
                buttonAction?()
            } label: {
                Text(buttonLabel ?? "Button")
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: 270)
        .padding(20)
        .background(.white)
        .cornerRadius(shape: .medium)
    }
}

#Preview {
    @Previewable @State var isPresented = false
    
    VStack {
        TabooButton {
            isPresented = true
        } label: {
            Text("다이얼로그 띄우기")
        }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.yellow)
    .tabooAlert(
        isPresented: $isPresented,
        title: "TabooAlert--",
        desc: "다이얼로그 창-----------------------------------------------------------",
        buttonLabel: "확인",
        buttonAction: {}
    )
}
