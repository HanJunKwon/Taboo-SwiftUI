//
//  TabooListRowExtension.swift
//  Taboo
//
//  Created by 권한준 on 8/11/26.
//
import SwiftUI

extension TabooListRow where Description == EmptyView, Right == EmptyView {
    init(
        action: @escaping () -> Void,
        @ViewBuilder header: () -> Header
    ) {
        self.init(
            action: action,
            header: header(),
            description: EmptyView(),
            left: .none,
            right: EmptyView()
        )
    }
}
