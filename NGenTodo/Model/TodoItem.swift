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
    var id = UUID()
    var title: String
    var data: TodoData?
}

extension TodoItem {
//    static func item(_ data: TodoData) -> TodoItem {
//        return TodoItem(id: data.id!, title: data.title!, data: data)
//    }

    func save(_ context: NSManagedObjectContext) {
        let data = TodoData(context: context)
        data.id = id
        data.title = title
        try? context.save()
    }

    func update(_ context: NSManagedObjectContext) {
        guard let data = self.data else { return }
        data.title = self.title
        try? context.save()
    }

    func delete(_ context: NSManagedObjectContext) {
        guard let data = self.data else { return }
        context.delete(data)
        try? context.save()
    }
}

let testData = [
    TodoItem(title: "皿洗い"),
    TodoItem(title: "部屋の掃除"),
    TodoItem(title: "買い出し"),
    TodoItem(title: "趣味プログラミング"),
    TodoItem(title: "ねこのご飯を用意"),
    TodoItem(title: "ねこと遊ぶ"),
    TodoItem(title: "昼ご飯の準備"),
    TodoItem(title: "夜ご飯の準備"),
]
