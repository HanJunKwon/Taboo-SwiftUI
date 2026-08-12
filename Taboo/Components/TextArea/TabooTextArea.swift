//
//  TabooTextArea.swift
//  Taboo
//
//  Created by 권한준 on 8/12/26.
//
import SwiftUI

struct TabooTextArea: View {
    @Binding private var text: String
    
    private var placeHolder: String
    
    private var help: String = ""
    private var limitText: Int = Int.max
    
    init(placeHolder: String, text: Binding<String>) {
        self.placeHolder = placeHolder
        self._text = text
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField(placeHolder, text: $text, axis: .vertical)
                .padding(.horizontal, 10)
                .padding(.vertical, 16)
                .modifier(TabooBoxTextFieldModifer())
            
            if help != "" {
                Text(help)
                    .font(.system(size: 13))
                    .foregroundColor(TabooColor.tabooGray400)
            }
        }
    }
    
    func help(_ help: String) -> Self {
        var view = self
        view.help = help
        
        return view
    }
}

#Preview {
    @Previewable @State var text: String = ""
    
    VStack {
        TabooTextArea(
            placeHolder: "의견을 남겨주세요",
            text: $text
        )
        
        TabooTextArea(
            placeHolder: "의견을 남겨주세요",
            text: $text
        )
        .help("100자 이내로 작성해주세요")
        .lineLimit(...3)
    }
}
