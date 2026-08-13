//
//  TabooChip.swift
//  Taboo
//
//  Created by 권한준 on 8/5/26.
//
import SwiftUI

struct TabooChip: View {
    @State private var checked: Bool = false
    
    private var tabooChipDefault: TabooChipDefault = .init()
    private var backgroundColor: Color {
        tabooChipDefault.backgroundColor(checked: self.checked)
    }
    private var textColor: Color {
        tabooChipDefault.textColor(checked: self.checked)
    }
    
    private var label: String
    
    init(label: String) {
        self.label = label
    }
    
    var body: some View {
        Text(label)
            .padding(.vertical, 7)
            .padding(.horizontal, 12)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .modifier(PressScaleModifier()
                .action {
                    self.checked.toggle()
                })
    }
}

struct TabooChipDefault {
    func backgroundColor(checked: Bool) -> Color {
        return if checked {
            TabooColor.tabooGray100
        } else {
            .clear
        }
    }
    
    func textColor(checked: Bool) -> Color {
        return if checked {
            TabooColor.tabooBlack800
        } else {
            TabooColor.tabooGray500
        }
    }
}

#Preview {
    TabooChip(label: "Chip")
    
    TabooChip(label: "Chip")
}
