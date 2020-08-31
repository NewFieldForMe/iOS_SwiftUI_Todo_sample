//
//  TodoListViewModel.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/07/18.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

class TodoListViewModel: ObservableObject {
    @Published var todos: [TodoData] = []
    @Published var showingAddTodo = false
    @Published var isMenuOpen = false

    func fetch() {
        todos = CoreDataService.fetch(TodoData.fetchRequest())?.sorted(by: { a, b in
            a.order < b.order
        }) ?? []
    }

    func onAppear() {
        fetch()
    }

    func add(_ item: TodoData) {
        item.order = todos.count
        CoreDataService.insert(item)
        CoreDataService.save()
        fetch()
    }

    func delete(offsets: IndexSet) {
        offsets.forEach { index in
            CoreDataService.delete(todos[index])
        }
        setOrder()
        CoreDataService.save()
        fetch()
    }

    func move(from source: IndexSet, to destination: Int) {
        todos.move(fromOffsets: source, toOffset: destination)
        setOrder()
        CoreDataService.save()
        fetch()
    }

    func setOrder() {
        for (index, todo) in todos.enumerated() {
            todo.order = index
        }
    }

    func sortTodoByTitle() {
        todos = todos.sorted(by: { (a, b) -> Bool in
            return a.title < b.title
        })
        setOrder()
        CoreDataService.save()
    }

    func sortTodoByDeadline() {
        todos = todos.sorted(by: { (a, b) -> Bool in
            guard let aDeadline = a.deadlineDate else { return false }
            guard let bDeadline = b.deadlineDate else { return true }
            return aDeadline < bDeadline
        })
        setOrder()
        CoreDataService.save()
    }
}
