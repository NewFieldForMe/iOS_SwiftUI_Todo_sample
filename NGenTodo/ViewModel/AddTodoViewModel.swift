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

    init(_ todo: TodoData? = nil) {
        guard let todo = todo else {
            self.todo = CoreDataService.new()
            self.todo.id = UUID()
            return
        }
        self.todo = todo
    }

    func save() {
        dump(todo)
        CoreDataService.insert(todo)
        CoreDataService.save()
    }

    func cancel() {
        CoreDataService.rollback()
    }
}
