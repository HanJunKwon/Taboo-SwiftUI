//
//  TabooButtonStyle+Secondary.swift
//  Taboo
//
//  Created by 권한준 on 8/6/26.
//

import SwiftUI

struct TabooButtonSecondaryStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool
    let size: TabooButtonSize
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: size.height)
            .padding(.horizontal, size.horizontalPadding)
            .background(isEnabled ? TabooColor.tabooGray200 : TabooColor.tabooGray50)
            .foregroundColor(isEnabled ? TabooColor.tabooGray600 : TabooColor.tabooGray300)
    }
}
