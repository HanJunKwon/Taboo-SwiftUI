//
//  TabooListRow.swift
//  Taboo
//
//  Created by 권한준 on 8/11/26.
//
import SwiftUI

struct TabooListRow<Header: View, Description: View, Right: View>: View {
    private let action: () -> Void
    private let header: Header
    private var description: Description
    private var left: TabooListRowLeft = .none
    private var right: Right
    private var verticalPadding: CGFloat = TabooListVPadding.medium.padding
    private var horizontalPadding: CGFloat = TabooListHPadding.small.padding
    
    private var hasDescription: Bool {
        Description.self != EmptyView.self
    }
    private var hasRight: Bool {
        Right.self != EmptyView.self
    }
    
    init(
        action: @escaping () -> Void,
        header: Header,
        description: Description,
        left: TabooListRowLeft,
        right: Right
    ) {
        self.action = action
        self.header = header
        self.description = description
        self.left = left
        self.right = right
    }
    
    var body: some View {
        HStack {
            switch left {
            case .none: EmptyView()
            case let .text(text, shape):
                VStack {
                    text
                }
                .frame(width: 36, height: 36)
                .background(TabooColor.tabooGray100)
                .clipShape(shape.shape)
            case let .asset(icon, shape):
                VStack {
                    icon.image
                        .frame(maxWidth: 36, maxHeight: 36)
                }
                .frame(width: 36, height: 36)
                .background(TabooColor.tabooGray100)
                .clipShape(shape.shape)
            }
            
            VStack(alignment: .leading) {
                header
                
                if hasDescription {
                    description
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if hasRight {
                right
            }
        }
        .frame(maxWidth: .infinity, minHeight: 50)
        .padding(.horizontal, horizontalPadding)
        .padding(.vertical, verticalPadding)
        .modifier(PressScaleModifier().action {
            action()
        })
    }
    
    func description<D: View>(@ViewBuilder _ desc: () -> D) -> TabooListRow<Header, D, Right> {
        .init(
            action: action,
            header: header,
            description: desc(),
            left: left,
            right: right
        )
    }
    
    func left(_ left: TabooListRowLeft) -> Self {
        var view = self
        view.left = left
        
        return view
    }
    
    func right<R: View>(@ViewBuilder _ right: () -> R) -> TabooListRow<Header, Description, R> {
        .init(
            action: action,
            header: header,
            description: description,
            left: left,
            right: right()
        )
    }
    
    func verticalPadding(vertical: TabooListVPadding) -> Self {
        var view = self
        view.verticalPadding = vertical.padding
        
        return view
    }
    
    func horizontalPadding(horizontal: TabooListHPadding) -> Self {
        var view = self
        view.horizontalPadding = horizontal.padding
        
        return view
    }
}

#Preview {
    VStack {
        TabooListRow {
            print("회사: 한세실업")
        } header: {
            Text("회사")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(TabooColor.tabooBlack900)
        }
        
        TabooListRow {
            print("회사: 한세실업")
        } header: {
            Text("회사")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(TabooColor.tabooBlack900)
        }
        .description {
            Text("한세실업")
                .foregroundColor(TabooColor.tabooGray600)
        }
        
        TabooListRow {
            print("회사: 한세실업")
        } header: {
            Text("회사")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(TabooColor.tabooBlack900)
        }
        .description {
            Text("한세실업")
                .foregroundColor(TabooColor.tabooGray600)
        }
        .left(TabooListRowLeft.asset(
            icon: TabooIcon.asset(.bubble),
            shape: .original
        ))
        .right {
            TabooIconButton(systemName: "chevron.right", size: .small)
        }
        
        
        
        TabooListRow {
            print("회사: 한세실업")
        } header: {
            Text("회사")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(TabooColor.tabooBlack900)
        }
        .description {
            Text("한세실업")
                .foregroundColor(TabooColor.tabooGray600)
        }
        .left(TabooListRowLeft.text(
            text:Text("오늘"),
            shape: .original
        ))
        .right {
            TabooIconButton(systemName: "chevron.right", size: .small)
        }
    }
}
