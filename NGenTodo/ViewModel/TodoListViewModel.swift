//
//  TodoListViewModel.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/07/18.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI
import CoreData

class TodoListViewModel: ObservableObject {
    @Published var todos: [TodoData] = []

    func fetch() {
        todos = CoreDataService.fetch(TodoData.fetchRequest()) ?? []
    }

    func onAppear() {
        fetch()
    }

    func delete(offsets: IndexSet) {
        offsets.forEach { index in
            CoreDataService.delete(todos[index])
        }
        CoreDataService.save()
        todos.remove(atOffsets: offsets)
    }
}
