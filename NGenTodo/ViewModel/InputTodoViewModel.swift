//
//  InputTodoViewModel.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/07/19.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

class InputTodoViewModel: ObservableObject {
    @Published var title: String
    @Published var point: String
    @Published var isUseDeadline: Bool
    @Published var deadlineDate: Date
    @Published var mode: Mode

    enum Mode {
        case add(maxOrder: Int)
        case edit

        var navigationTitle: String {
            switch self {
            case .add: return "Add Todo"
            case .edit: return "Edit Todo"
            }
        }
    }
    private let maxOrder: Int?
    private var todo: TodoData?

    var hasError: Bool {
        return title.isEmpty
    }

    init(todo: TodoData) {
        self.mode = .edit
        self.todo = todo
        self.title = todo.title
        self.point = todo.point.description
        self.isUseDeadline = todo.deadlineDate != nil
        self.deadlineDate = todo.deadlineDate ?? Date()
        self.maxOrder = nil
    }

    init(maxOrder: Int) {
        self.mode = .add(maxOrder: maxOrder)
        self.todo = nil
        self.title = ""
        self.point = ""
        self.isUseDeadline = false
        self.deadlineDate = Date()
        self.maxOrder = maxOrder
    }

    func onAppear() { }

    func save() {
        if todo == nil {
            todo = CoreDataService.new()
        }
        guard let todo = todo else { return }
        todo.title = title
        todo.point = Int(point) ?? 0
        todo.deadlineDate = isUseDeadline == false ? nil : deadlineDate
        if case .add(let maxOrder) = mode {
            todo.createDate = Date()
            todo.order = maxOrder + 1
            CoreDataService.insert(todo)
        }
        CoreDataService.save()
    }

    func cancel() {
        CoreDataService.rollback()
    }
}
