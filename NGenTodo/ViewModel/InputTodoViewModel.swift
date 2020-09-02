//
//  InputTodoViewModel.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/07/19.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

class InputTodoViewModel: ObservableObject {
    @Published var todo: TodoData
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
    @Published var isUseDeadline = false {
        willSet {
            if newValue && todo.deadlineDate == nil {
                todo.deadlineDate = Date()
            }
        }
    }
    let maxOrder: Int?

    var hasError: Bool {
        return todo.title.isEmpty
    }

    init(_ todo: TodoData? = nil, maxOrder: Int? = nil) {
        guard let todo = todo else {
            self.mode = .add
            self.todo = CoreDataService.new()
            self.maxOrder = maxOrder
            self.todo.id = UUID()
            return
        }
        self.mode = .edit
        self.todo = todo
        self.maxOrder = nil
    }

    func onAppear() {
        self.isUseDeadline = self.todo.deadlineDate != nil
    }

    func save() {
        if isUseDeadline == false {
            todo.deadlineDate = nil
        }
        if mode == .add {
            todo.createDate = Date()
            if let maxOrder = maxOrder {
                todo.order = maxOrder + 1
            }
            CoreDataService.insert(todo)
        }
        CoreDataService.save()
    }

    func cancel() {
        CoreDataService.rollback()
    }
}
