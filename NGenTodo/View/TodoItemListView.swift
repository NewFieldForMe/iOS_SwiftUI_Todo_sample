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
    @ObservedObject var vm: TodoListViewModel

    init() {
        vm = TodoListViewModel()
    }

    var body: some View {
        return NavigationView {
            ZStack {
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
                .navigationBarItems(trailing: EditButton())

                FloatingButtonView() {
                    self.showingAddTodo.toggle()
                }.sheet(isPresented: $showingAddTodo) {
                    NavigationView {
                        InputTodoView().onDisappear(perform: self.vm.onAppear)
                    }
                }
            }.navigationBarTitle("Todo List")
        }
    }
}

struct TodoItemListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemListView()
    }
}

struct TodoItemListCellView: View {
    @ObservedObject var item: TodoData
    var body: some View {
        HStack {
            Text(item.title)
            Spacer()
            item.deadlineDateString.map { Text($0) }
        }
    }
}
