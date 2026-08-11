//
//  TabooResultLayout.swift
//  Taboo
//
//  Created by 권한준 on 8/10/26.
//
import SwiftUI

struct TabooResultLayout<Content: View>: View {
    var icon: String
    var title: String
    var description: String
    
    @ViewBuilder var button: () -> Content
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 36)
            
            Text(title)
                .padding(.top, 16)
                .font(.system(size: 20))
                .fontWeight(.semibold)
            
            Text(description)
                .font(.system(size: 17))
                .fontWeight(.regular)
                .foregroundColor(TabooColor.tabooGray700)
            
            button()
                .padding(.top, 5)
        }
    }
}

#Preview {
    TabooResultLayout(icon: "text.document", title: "기안함", description: "기안한 전자 결재가 없어요") {
        TabooButton {
            print("OK")
        } label: {
            Text("새로고침")
        }
        .size(size: .medium)
    }
}
