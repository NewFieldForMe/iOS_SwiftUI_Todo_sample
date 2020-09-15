//
//  MainTabBarView.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/09/15.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct MainTabBarView: View {
    var body: some View {
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
    }
}

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
