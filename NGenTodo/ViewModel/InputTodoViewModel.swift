//
//  InputTodoViewModel.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/07/19.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

class InputTodoViewModel: ObservableObject {
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
    @Published var isUseDeadline = false {
        willSet {
            if newValue && todo.deadlineDate == nil {
                todo.deadlineDate = Date()
            }
        }
    }

    var hasError: Bool {
        return todo.title.isEmpty
    }

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

    func onAppear() {
        self.isUseDeadline = self.todo.deadlineDate != nil
    }

    func save() {
        if mode == .add {
            todo.createDate = Date()
        }
        if isUseDeadline == false {
            todo.deadlineDate = nil
        }
        CoreDataService.insert(todo)
        CoreDataService.save()
    }

    func cancel() {
        CoreDataService.rollback()
    }
}
