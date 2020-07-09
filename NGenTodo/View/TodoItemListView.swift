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
                    ForEach(TodoItem.TodoState.allCases) { state in
                        Section(header: Text(state.label)) {
                            ForEach(self.taskItems.items(state: state)) { item in
                                Text(item.title)
                            }
                        }
                    }
                }

                FloatingButtonView() {
                    self.showingAddTodo.toggle()
                }.sheet(isPresented: $showingAddTodo) {
                    AddTodoItemView(completionHandler: self.addItem)
                }
            }.navigationBarTitle("Todo List")
        }
    }
}

private extension TodoItemListView {
    func addItem(_ item: TodoItem) {
        // Todo: Refactoring and save state
        self.taskItems.append(item)
        let data = TodoData(context: context)
        data.id = item.id
        data.title = item.title
        do {
            try context.save()
        } catch {
            print(error)
        }
        show()
    }

    func show() {
        self.taskItems = notCompletedTasks.map { data in
            let item = TodoItem(id: data.id!, title: data.title!, state: .todo)
            return item
        }
    }
}

struct TodoItemListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemListView(taskItems: [])
    }
}
