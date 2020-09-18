//
//  MainTabBarView.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/09/15.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct MainTabBarView: View {
    @EnvironmentObject var vm: TodoListViewModel

    var body: some View {
        ZStack {
            TabView {
                TodoItemListView()
                    .tabItem {
                        VStack {
                            Image(systemName: "square.and.pencil")
                            Text("ToDo")
                        }
                }.tag(1)
                StatisticView()
                    .tabItem {
                        VStack {
                            Image(systemName: "s.square")
                            Text("Statistic")
                        }
                }.tag(2)
            }

            TodoListSideMenu(isOpen: self.$vm.isMenuOpen)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
