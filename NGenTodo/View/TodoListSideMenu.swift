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
                VStack {
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                            .imageScale(.large)
                        Text("Profile")
                            .foregroundColor(.gray)
                            .font(.headline)
                        Spacer()
                    }
                    .padding(.top, 100)
                    .padding(.leading, 30)
                    HStack {
                        Image(systemName: "gear")
                            .foregroundColor(.gray)
                            .imageScale(.large)
                        Text("Settings")
                            .foregroundColor(.gray)
                            .font(.headline)
                        Spacer()
                    }
                    .padding(.top, 30)
                    .padding(.leading, 30)
                    Spacer()
                }
                .frame(width: width)
                .background(Color.white)
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
