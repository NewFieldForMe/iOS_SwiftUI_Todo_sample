//
//  AddTodoViewModel.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/07/19.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

class AddTodoViewModel: ObservableObject {
    @ObservedObject var todo: TodoData
    enum Mode {
        case add
        case edit

        var navigationTitle: String {
            switch self {
            case .add: return "Add Todo"
            case .edit: return "Edit Todo"
            }
        }
    }
    @Published var mode: Mode

    init(_ todo: TodoData? = nil) {
        guard let todo = todo else {
            self.mode = .add
            self.todo = CoreDataService.new()
            self.todo.id = UUID()
            return
        }
        self.mode = .edit
        self.todo = todo
    }

    func save() {
        CoreDataService.insert(todo)
        CoreDataService.save()
    }

    func cancel() {
        CoreDataService.rollback()
    }
}
