//
//  TabooTableRow.swift
//  Taboo
//
//  Created by 권한준 on 8/12/26.
//
import SwiftUI

struct TabooTableRow: View {
    private var left: String
    private var right: String
    
    private var rightAlignment: Alignment = .trailing
    
    init(
        left: String,
        right: String
    ) {
        self.left = left
        self.right = right
    }
    
    var body: some View {
        HStack {
            Text(left)
            
            Text(right)
                .frame(maxWidth: .infinity, alignment: rightAlignment)
        }
        .padding(5)
        .frame(maxWidth: .infinity)
    }
    
    func rightAlignment(_ alignment: Alignment) -> Self {
        var view = self
        view.rightAlignment = alignment
        
        return view
    }
}

#Preview {
    VStack {
        TabooTableRow(left: "기안일", right: "2026.08.02")
        TabooTableRow(left: "기안일", right: "2026.08.02")
            .rightAlignment(.center)
        TabooTableRow(left: "기안일", right: "2026.08.02")
            .rightAlignment(.leading)
    }
}
