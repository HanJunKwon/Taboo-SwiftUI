//
//  TabooBottomSheet.swift
//  Taboo
//
//  Created by 권한준 on 8/10/26.
//
import SwiftUI

struct TabooBottomSheet<Content>: View where Content: View {
    @Binding var isPresented: Bool
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack {
            content()
        }
        .frame(maxWidth: .infinity)
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
            Text("BottomSheet")
        }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .tabooBottomSheet(isPresented: $isPresented) {
        VStack {
            HStack {
                Text("아이템")
                TabooButton {
                    
                } label: {
                    Text("버튼")
                }
                .size(size: .small)
            }
            
            HStack {
                Text("아이템")
                TabooButton {
                    
                } label: {
                    Text("버튼")
                }
                .size(size: .small)
            }
            
            HStack {
                Text("아이템")
                TabooButton {
                    
                } label: {
                    Text("버튼")
                }
                .size(size: .small)
            }
        }
    }
}
