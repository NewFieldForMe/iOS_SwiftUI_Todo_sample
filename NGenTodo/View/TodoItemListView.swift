//
//  TodoItemListView.swift
//  NGenTodo
//
//  Created by 山田良 on 2020/07/04.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct TodoItemListView: View {
    @ObservedObject var vm: TodoListViewModel

    init() {
        vm = TodoListViewModel()
    }

    var body: some View {
        return ZStack {
            NavigationView {
                ZStack {
                    List {
                        ForEach(vm.todos) { item in
                            NavigationLink(destination: InputTodoView(item)) {
                                TodoItemListCellView(todo: item)
                                    .contextMenu {
                                        Button(action: {
                                            self.vm.delete(item)
                                        }, label: {
                                            Text("Delete Todo")
                                        })
                                }
                            }
                        }
                        .onDelete(perform: self.vm.delete)
                        .onMove(perform: self.vm.move)
                    }
                    .onAppear(perform: self.vm.onAppear)
                    .navigationBarTitle("Todo List")
                    .navigationBarItems(leading: (
                        Button(action: {
                            self.vm.isMenuOpen.toggle()
                        }, label: {
                            Image(systemName: "line.horizontal.3")
                                .imageScale(.large)
                        })), trailing: EditButton())

                    FloatingButtonView() {
                        self.vm.showingAddTodo.toggle()
                    }.sheet(isPresented: self.$vm.showingAddTodo) {
                        NavigationView {
                            InputTodoView(maxOrder: self.vm.todos.count).onDisappear(perform: self.vm.onAppear)
                        }
                    }
                }
            }

            TodoListSideMenu(
                isOpen: self.$vm.isMenuOpen,
                sortByTitle: vm.sortTodoByTitle,
                sortByDeadline: vm.sortTodoByDeadline)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct TodoItemListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemListView()
    }
}
