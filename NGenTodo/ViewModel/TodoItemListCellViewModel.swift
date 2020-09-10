//
//  TodoItemListCellViewModel.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/09/07.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI
import Combine

class TodoItemListCellViewModel: ObservableObject {
    @Published var todo: TodoData
    @Published var stateSystemName: String = ""

    init(_ todo: TodoData) {
        self.todo = todo
        changeStateSystemName()
    }

    var foregroundColor: Color {
        return todo.todoState == .ready ? .black : .gray
    }

    func switchDone() {
        if todo.todoState == .ready {
            todo.todoState = .done
        } else {
            todo.todoState = .ready
        }
        CoreDataService.save()
        changeStateSystemName()
    }
}

private extension TodoItemListCellViewModel {
    func changeStateSystemName() {
        stateSystemName = todo.todoState == .ready ? "square" : "checkmark.square"
    }
}
