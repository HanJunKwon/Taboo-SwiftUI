//
//  TabooCheckBox.swift
//  Taboo
//
//  Created by 권한준 on 8/4/26.
//
import SwiftUI

enum TabooCheckBoxStyle {
    case circle, line
}

struct TabooCheckBox<Content: View>: View {
    @State private var isChecked: Bool = false
    
    private var content: Content
    private var style: TabooCheckBoxStyle = .circle
    
    init(
        style: TabooCheckBoxStyle = .circle,
        @ViewBuilder content: () -> Content
    ) {
        self.style = style
        self.content = content()
    }
    
    var body: some View {
        HStack {
            self.content
            
            switch style {
            case .circle: TabooCheckBoxCircle(checked: isChecked)
            case .line: TabooCheckBoxLine(checked: isChecked)
            }
        }
        .modifier(
            PressScaleModifier()
                .action {
                    print(self.isChecked)
                    self.isChecked.toggle()
                }
        )
    }
    
    func checked(checked: Bool) -> Self {
        self.isChecked = checked
        
        return self
    }
}

#Preview {
    TabooCheckBox {
        Text("선택 항목 1")
    }
    
    TabooCheckBox(style: .line) {
        Text("선택 항목 2")
    }
}
