//
//  TabooTextField.swift
//  Taboo
//
//  Created by 권한준 on 8/11/26.
//
import SwiftUI

struct TabooTextField: View {
    @Environment(\.isEnabled) var isEnabled: Bool
    
    var title: String
    @Binding var text: String
    @Binding var isError: Bool
    
    private var placeHolder: String = ""
    private var errorMessage: String = ""
    
    private var textColor: Color {
        isEnabled ? TabooColor.tabooBlack900 : TabooColor.tabooGray600
    }
    
    init(title: String, text: Binding<String>, isError: Binding<Bool>) {
        self.title = title
        self._text = text
        self._isError = isError
    }
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 5
        ) {
            Text(title)
                .foregroundColor(textColor)
            
            VStack {
                TextField(placeHolder, text: $text)
                    .padding(.horizontal, 10)
                    .foregroundColor(textColor)
            }
            .padding(.vertical, 16)
            .modifier(TabooBoxTextFieldModifer())
            
            if isError {
                Text(errorMessage)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(TabooColor.tabooRed600)
            }
        }
        .padding(.horizontal, 10)
    }
    
    func placeHolder(_ placeHolder: String) -> Self {
        var view = self
        view.placeHolder = placeHolder
        
        return view
    }
    
    func errorMessage(_ msg: String) -> Self {
        var view = self
        view.errorMessage = msg
        
        return view
    }
}

#Preview {
    @Previewable @State var text: String = ""
    @Previewable @State var isError: Bool = true
    
    VStack {
        TabooTextField(title: "비밀번호", text: $text, isError: $isError)
            .placeHolder("비밀번호를 입력해주세요.")
            .errorMessage("에러!!!")
        
        TabooTextField(title: "비밀번호", text: $text, isError: $isError)
            .placeHolder("비밀번호를 입력해주세요.")
            .disabled(true)
        
        Text("입력한 값: \(text)")
        
    }
}
