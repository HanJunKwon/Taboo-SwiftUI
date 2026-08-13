//
//  TabooSecureTextField.swift
//  Taboo
//
//  Created by 권한준 on 8/12/26.
//
import SwiftUI

struct TabooSecureTextField: View {
    @Environment(\.isEnabled) var isEnabled: Bool
    @FocusState var isFocused: Bool
    
    private var title: String
    @Binding private var text: String
    @Binding private var isError: Bool
    
    private var style: TabooTextFieldStyle = .box
    private var placeHolder: String = ""
    private var errorMessage: String = ""
    
    private var titleColor: Color {
        if isEnabled {
            if isFocused {
                TabooColor.tabooBlue600
            } else {
                TabooColor.tabooBlack900
            }
        } else {
            TabooColor.tabooGray600
        }
    }
    
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
                .font(.system(size: 15))
                .foregroundColor(titleColor)
            
            styledField
            
            if isError {
                Text(errorMessage)
                    .font(.system(size: 13))
                    .foregroundColor(TabooColor.tabooRed600)
            }
        }
        .padding(.horizontal, 10)
    }
    
    @ViewBuilder
    private var styledField: some View {
        let field = SecureField(placeHolder, text: $text)
            .padding(.horizontal, 10)
            .padding(.vertical, 16)
            .foregroundColor(textColor)
            .focused($isFocused)
        
        
        switch style {
        case .box: field.modifier(TabooBoxTextFieldModifer())
        case .line: field.modifier(TabooLineTextFieldModifier(focus: $isFocused))
        }
    }
    
    func style(_ style: TabooTextFieldStyle) -> Self {
        var view = self
        view.style = style
        
        return view
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
    @Previewable @State var boxPassword: String = ""
    @Previewable @State var linePassword: String = ""
    @Previewable @State var isError: Bool = false
    
    VStack {
        TabooSecureTextField(title: "비밀번호", text: $boxPassword, isError: $isError)
            .placeHolder("비밀번호를 입력해주세요.")
    
        TabooSecureTextField(title: "비밀번호", text: $linePassword, isError: $isError)
            .placeHolder("비밀번호를 입력해주세요.")
            .style(.line)
        
        Text("비밀번호: \(boxPassword)")
        Text("비밀번호: \(linePassword)")
    }
}
