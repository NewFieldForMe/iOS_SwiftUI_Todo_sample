//
//  TodoListSideMenu.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/08/11.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct TodoListSideMenu: View {
    @Binding var isOpen: Bool
    let width: CGFloat = 270
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(.easeIn(duration: 0.25))
            .onTapGesture {
                self.isOpen = false
            }

            HStack {
                List {
                    Text("hogehoge1")
                    Text("hogehoge2")
                    Text("hogehoge3")
                }
                .frame(width: width)
                .offset(x: self.isOpen ? 0 : -self.width)
                .animation(.easeIn(duration: 0.25))
                Spacer()
            }
        }
    }
}

struct TodoListSideMenu_Previews: PreviewProvider {
    static var previews: some View {
        TodoListSideMenu(isOpen: .constant(true))
    }
}
