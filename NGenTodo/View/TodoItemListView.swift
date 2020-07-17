//
//  TodoItemListView.swift
//  NGenTodo
//
//  Created by 山田良 on 2020/07/04.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct TodoItemListView: View {
    @Environment(\.managedObjectContext) var context
    @State var taskItems: [TodoItem]
    @State var showingAddTodo = false
    @FetchRequest(
        entity: TodoData.entity(),
        sortDescriptors: []
    ) var notCompletedTasks: FetchedResults<TodoData>

    var body: some View {
        return NavigationView {
            ZStack {
                List {
                    ForEach(self.taskItems) { item in
                        NavigationLink(destination: AddTodoItemView(title: item.title, completionHandler: self.editItem, mode: .edit(item))) {
                            Text(item.title)
                        }
                    }.onDelete(perform: self.removeItem)
                }

                FloatingButtonView() {
                    self.showingAddTodo.toggle()
                }.sheet(isPresented: $showingAddTodo) {
                    AddTodoItemView(completionHandler: self.addItem, mode: .add)
                }
            }.navigationBarTitle("Todo List")
        }
    }
}

private extension TodoItemListView {
    func addItem(_ item: TodoItem) {
        item.save(context)
        show()
    }

    func editItem(_ item: TodoItem) {
        item.update(context)
        show()
    }

    func removeItem(offsets: IndexSet) {
        offsets.forEach { index in
            taskItems[index].delete(context)
        }
        show()
    }

    func show() {
        self.taskItems = notCompletedTasks.map { data in
            return TodoItem.item(data)
        }
    }
}

struct TodoItemListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemListView(taskItems: [])
    }
}
