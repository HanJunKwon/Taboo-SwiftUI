//
//  TabooConfirm.swift
//  Taboo
//
//  Created by 권한준 on 8/10/26.
//
import SwiftUI

struct TabooConfirm: View {
    @Binding var isPresented: Bool
    
    var title: String
    var description: String?
    
    var cancelButtonLabel: String
    var confirmButtonLabel: String
    
    var cancelButtonAction: (() -> Void)?
    var confirmButtonAction: (() -> Void)?
    
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
            
            HStack(spacing: 15) {
                // 취소 버튼
                TabooButton {
                    isPresented = false
                    cancelButtonAction?()
                } label: {
                    Text(cancelButtonLabel)
                        .frame(maxWidth: .infinity)
                }
                .style(style: .secondary)
                
                
                // 확인 버튼
                TabooButton {
                    isPresented = false
                    confirmButtonAction?()
                } label: {
                    Text(confirmButtonLabel)
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .frame(maxWidth: 270)
        .padding(20)
        .background(.white)
        .cornerRadius(shape: .medium)
    }
}

#Preview {
    @Previewable @State var isPresented: Bool = false
    
    VStack {
        TabooButton {
            isPresented = true
        } label: {
            Text("Confirm 띄우기")
        }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .tabooConfirm(
        isPresented: $isPresented,
        title: "Confirm 타이틀",
        description: "Confirm 설명",
        cancelButtonLabel: "취소",
        confirmButtonLabel: "확인",
        cancelButtonAction: {
            print("취소")
        },
        confirmButtonAction: {
            print("확인")
        }
    )
}
