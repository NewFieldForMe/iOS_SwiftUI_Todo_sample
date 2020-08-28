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
    @ObservedObject var vm: TodoListSideMenuViewModel = TodoListSideMenuViewModel()
    let sortByTitle: (() -> Void)
    let sortByDeadline: (() -> Void)
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
                VStack {
                    SideMenuContentView(imageSystemName: "person", text: "Profile", onTapGesture: nil)
                        .padding(.top, 100)
                    SideMenuContentView(imageSystemName: "gear", text: "Settings", onTapGesture: nil)
                    SideMenuContentView(imageSystemName: "arrow.up.arrow.down.circle", text: "Sort By Title", onTapGesture: self.sortByTitle)
                    SideMenuContentView(imageSystemName: "arrow.up.arrow.down.circle", text: "Sort By Deadline", onTapGesture: self.sortByDeadline)
                    Spacer()
                    SideMenuContentView(imageSystemName: vm.darkModeSystemName, text: "Change DarkMode", onTapGesture: vm.switchDarkMode)
                    Spacer()
                        .frame(height: 66.0)
                }
                .frame(width: width)
                .background(Color(UIColor.systemGray6))
                .offset(x: self.isOpen ? 0 : -self.width)
                .animation(.easeIn(duration: 0.25))
                Spacer()
            }
        }
    }
}

fileprivate struct SideMenuContentView: View {
    let imageSystemName: String
    let text: String
    let onTapGesture: (() -> Void)?
    var body: some View {
        HStack {
            Image(systemName: imageSystemName)
                .foregroundColor(.gray)
                .imageScale(.large)
                .frame(width: 30.0)
            Text(text)
                .foregroundColor(.gray)
                .font(.headline)
            Spacer()
        }
        .padding(.top, 30)
        .padding(.leading, 30)
        .onTapGesture {
            self.onTapGesture?()
        }
    }
}

struct TodoListSideMenu_Previews: PreviewProvider {
    static var previews: some View {
        TodoListSideMenu(isOpen: .constant(true), sortByTitle: { }, sortByDeadline: { })
    }
}

