//
//  TodoListViewModel.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/07/18.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI
import Combine

class TodoListViewModel: ObservableObject {
    var todos: [TodoData] = [] {
        willSet {
            objectWillChange.send()
        }
    }
    @Published var showingAddTodo = false
    @Published var isMenuOpen = false
    private var bag = [AnyCancellable]()

    func fetch() {
        todos = CoreDataService.fetch(TodoData.fetchRequest())?.sorted(by: { a, b in
            a.order < b.order
        }) ?? []
        todos.forEach { todo in
            let c = todo.objectWillChange.sink(receiveValue: {
                self.objectWillChange.send()
            })
            self.bag.append(c)
        }

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

    func delete(_ item: TodoData) {
        CoreDataService.delete(item)
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
