//
//  TabooButtonStyle+Primary.swift
//  Taboo
//
//  Created by 권한준 on 8/6/26.
//

import SwiftUI

struct TabooButtonPrimaryStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool
    let size: TabooButtonSize
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: size.height)
            .padding(.horizontal, size.horizontalPadding)
            .background(isEnabled ? TabooColor.tabooBlue600 : TabooColor.tabooBlue200)
            .foregroundColor(.white)
    }
}
