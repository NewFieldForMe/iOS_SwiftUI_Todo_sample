//
//  TodoItemListView.swift
//  NGenTodo
//
//  Created by 山田良 on 2020/07/04.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct TodoItemListView: View {
    @State var showingAddTodo = false
    @State var isMenuOpen = false
    @ObservedObject var vm: TodoListViewModel

    init() {
        vm = TodoListViewModel()
    }

    var body: some View {
        return ZStack {
            NavigationView {
                List {
                    ForEach(vm.todos) { item in
                        NavigationLink(destination: InputTodoView(item)) {
                            TodoItemListCellView(item: item)
                        }
                    }
                    .onDelete(perform: self.vm.delete)
                    .onMove(perform: self.vm.move)
                }
                .onAppear(perform: self.vm.onAppear)
                .navigationBarTitle("Todo List")
                .navigationBarItems(leading: (
                    Button(action: {
                        self.isMenuOpen.toggle()
                    }, label: {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                    })), trailing: EditButton())
            }

            FloatingButtonView() {
                self.showingAddTodo.toggle()
            }.sheet(isPresented: $showingAddTodo) {
                NavigationView {
                    InputTodoView().onDisappear(perform: self.vm.onAppear)
                }
            }

            TodoListSideMenu(
                isOpen: self.$isMenuOpen,
                sortByTitle: vm.sortTodoByTitle,
                sortByDeadline: vm.sortTodoByDeadline,
                switchDarkMode: vm.switchDarkMode)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct TodoItemListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemListView()
    }
}
