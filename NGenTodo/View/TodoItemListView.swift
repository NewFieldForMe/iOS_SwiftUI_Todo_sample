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
    @State var showingAddTodo = false
    @FetchRequest(
        entity: TodoData.entity(),
        sortDescriptors: []
    ) var notCompletedTasks: FetchedResults<TodoData>
    @ObservedObject var vm: TodoListViewModel

    init() {
        vm = TodoListViewModel()
    }

    var body: some View {
        return NavigationView {
            ZStack {
                List {
                    ForEach(vm.todos) { item in
//                        NavigationLink(destination: AddTodoItemView(title: item.title, completionHandler: self.editItem, mode: .edit(item))) {
                        Text(item.title ?? "")
//                        }
                    }
//                    .onDelete(perform: self.removeItem)
//                    .onMove(perform: self.moveItem)
                }
                .navigationBarItems(trailing: EditButton())

                FloatingButtonView() {
                    self.showingAddTodo.toggle()
                }.sheet(isPresented: $showingAddTodo) {
                    AddTodoItemView(completionHandler: self.vm.add, mode: .add)
                }
            }.navigationBarTitle("Todo List")
        }.onAppear(perform: self.vm.onAppear)
    }
}

//private extension TodoItemListView {
//    func addItem(_ item: TodoItem) {
//        item.save(context)
//        show()
//    }
//
//    func editItem(_ item: TodoItem) {
//        item.update(context)
//        show()
//    }
//
//    func removeItem(offsets: IndexSet) {
//        offsets.forEach { index in
//            taskItems[index].delete(context)
//        }
//        show()
//    }
//
//    func moveItem(from source: IndexSet, to destination: Int) {
//        taskItems.move(fromOffsets: source, toOffset: destination)
//        // Todo: save order
//    }
//
//    func show() {
//        self.taskItems = notCompletedTasks.map { data in
//            return TodoItem.item(data)
//        }
//    }
//}

struct TodoItemListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemListView()
    }
}
