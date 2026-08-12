//
//  TabooTogle.swift
//  Taboo
//
//  Created by 권한준 on 8/12/26.
//
import SwiftUI

struct TabooToggle: View {
    @Environment(\.isEnabled) var isEnabled: Bool

    @Binding private var isOn: Bool
    
    private var label: String = ""
    
    init(_ label: String, isOn: Binding<Bool>) {
        self.label = label
        self._isOn = isOn
    }
    
    var body: some View {
        Toggle(label, isOn: $isOn)
            .foregroundColor(TabooColor.tabooBlack900)
            .toggleStyle(.switch)
            .tint(TabooColor.tabooBlue600)
            .padding(5)
            .modifier(PressScaleModifier().action {
                isOn.toggle()
            })
    }
}

#Preview {
    @Previewable @State var isOn: Bool = false
    
    VStack {
        TabooToggle("다크테마", isOn: $isOn)
        
        TabooToggle("다크테마", isOn: $isOn)
            .disabled(true)
    }
}
