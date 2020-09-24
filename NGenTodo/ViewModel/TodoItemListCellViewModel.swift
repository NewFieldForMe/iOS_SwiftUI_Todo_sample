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
        return todo.todoState == .ready ? .primary : .gray
    }

    func switchDone() {
        if todo.todoState == .ready {
            todo.todoState = .done
            addPointToday(todo.point)
        } else {
            todo.todoState = .ready
            addPointToday(todo.point * -1)
        }
        CoreDataService.save()
        changeStateSystemName()
    }
}

private extension TodoItemListCellViewModel {
    func changeStateSystemName() {
        stateSystemName = todo.todoState == .ready ? "square" : "checkmark.square"
    }

    func fetchTodayPointRecord() -> PointData? {
        return CoreDataService.fetch(PointData.fetchRequest())?
            .filter({ data -> Bool in
                guard let date = data.date else { return false }
                return Calendar.current.isDateInToday(date)
            }).first
    }

    func addPointToday(_ point: Int) {
        if let record = fetchTodayPointRecord() {
            record.point += point
        } else {
            let record: PointData = CoreDataService.new()
            record.id = UUID()
            record.date = Date()
            record.point = point
            CoreDataService.insert(record)
        }
        CoreDataService.save()
    }
}
