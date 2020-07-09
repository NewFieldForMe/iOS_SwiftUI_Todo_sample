//
//  TodoItem.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/07/04.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

struct TodoItem: Identifiable {
    enum TodoState: CaseIterable, Identifiable {
        case todo, progress, wait, done

        var id :TodoState { return self }
        var label: String {
            switch self {
            case .todo: return "Todo"
            case .progress: return "Progress"
            case .wait: return "Wait"
            case .done: return "Done"
            }
        }
    }

    var id = UUID()
    var title: String
    var state: TodoState
}

extension TodoItem {
    static func item(_ data: TodoData) -> TodoItem {
        return TodoItem(id: data.id!, title: data.title!, state: .todo)
    }

    func save(_ context: NSManagedObjectContext) {
        let data = TodoData(context: context)
        data.id = id
        data.title = title
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}

extension Array where Element == TodoItem {
    func items(state: TodoItem.TodoState) -> [TodoItem] {
        return self.filter { $0.state == state }
    }
}

let testData = [
    TodoItem(title: "皿洗い", state: .todo),
    TodoItem(title: "部屋の掃除", state: .todo),
    TodoItem(title: "買い出し", state: .todo),
    TodoItem(title: "趣味プログラミング", state: .progress),
    TodoItem(title: "ねこのご飯を用意", state: .todo),
    TodoItem(title: "ねこと遊ぶ", state: .wait),
    TodoItem(title: "昼ご飯の準備", state: .done),
    TodoItem(title: "夜ご飯の準備", state: .todo),
]
