//
//  TabooCheckBoxLine.swift
//  Taboo
//
//  Created by 권한준 on 8/5/26.
//
import SwiftUI

struct TabooCheckBoxLine: View {
    private let checked: Bool
    
    private var tabooCheckBoxLineDefault: TabooCheckBoxLineDefault = .init()
    private var lineColor: Color {
        tabooCheckBoxLineDefault.lineColor(check: checked)
    }
    
    init(checked: Bool = false) {
        self.checked = checked
    }
    
    var body: some View {
        VStack {
            Image(systemName: "checkmark")
                .frame(width: 24, height: 24)
                .foregroundColor(lineColor)
                .padding(6)
        }
    }
}

struct TabooCheckBoxLineDefault {
    func lineColor(check: Bool) -> Color {
        return if check {
            TabooColor.tabooBlue600
        } else {
            TabooColor.tabooGray300
        }
    }
}

#Preview {
    VStack {
        TabooCheckBoxLine()
        TabooCheckBoxLine()
    }
}
