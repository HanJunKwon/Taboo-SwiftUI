//
//  TabooCheckBoxCircle.swift
//  Taboo
//
//  Created by 권한준 on 8/5/26.
//
import SwiftUI

struct TabooCheckBoxCircle: View {
    private let checked: Bool
    
    private var tabooCheckBoxCircleDefault: TabooCheckBoxCircleDefault = .init()
    private var lineColor: Color {
        tabooCheckBoxCircleDefault.lineColor(checked: checked)
    }
    private var backgroundColor: Color {
        tabooCheckBoxCircleDefault.backgroundColor(checked: checked)
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
        .background(backgroundColor)
        .clipShape(Circle())
    }
}

struct TabooCheckBoxCircleDefault {
    func lineColor(checked: Bool) -> Color {
        return if checked {
            .white
        } else {
            TabooColor.tabooGray300
        }
    }
    
    func backgroundColor(checked: Bool) -> Color {
        return if checked {
            TabooColor.tabooBlue600
        } else {
            .clear
        }
    }
}

#Preview {
    VStack {
        TabooCheckBoxCircle()
        TabooCheckBoxCircle()
    }
}
