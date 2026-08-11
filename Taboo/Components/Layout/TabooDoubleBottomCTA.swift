//
//  TabooDoubleBottomCTA.swift
//  Taboo
//
//  Created by 권한준 on 8/10/26.
//
import SwiftUI

struct TabooDoubleBottomCTA<Content: View>: View {
    var cancelButtonLabel: String
    var confirmButtonLabel: String
    
    var cancelButtonAction: () -> Void
    var confirmButtonAction: () -> Void
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack {
            ScrollView {
                content()
            }
            .scrollIndicators(.hidden)
            
            HStack(spacing: 12) {
                TabooButton {
                    cancelButtonAction()
                } label: {
                    Text(cancelButtonLabel)
                        .frame(maxWidth: .infinity)
                }
                .style(style: .secondary)
                
                TabooButton {
                    confirmButtonAction()
                } label: {
                    Text(confirmButtonLabel)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    TabooDoubleBottomCTA(
        cancelButtonLabel: "취소",
        confirmButtonLabel: "확인",
        cancelButtonAction: { print("취소") },
        confirmButtonAction: { print("확인") }
    ) {
        LazyVStack {
            ForEach(1..<100) {
                Text("아이템 \($0)")
            }
        }
    }
}
