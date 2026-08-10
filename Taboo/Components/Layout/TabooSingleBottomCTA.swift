//
//  TabooSingleBottomCTA.swift
//  Taboo
//
//  Created by 권한준 on 8/10/26.
//
import SwiftUI

struct TabooSingleBottomCTA<Content: View>: View {
    var buttonLabel: String
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack {
            ScrollView() {
                content()
            }
            .scrollIndicators(.hidden)
            
            HStack {
                TabooButton {
                    
                } label: {
                    Text(buttonLabel)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    TabooSingleBottomCTA(buttonLabel: "확인") {
        LazyVStack {
            ForEach(1..<100) {
                Text("아이템 \($0)")
            }
        }
        .frame(maxWidth: .infinity)
    }
}
