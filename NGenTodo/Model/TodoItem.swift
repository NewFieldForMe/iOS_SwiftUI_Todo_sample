//
//  TodoItem.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/07/04.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import Foundation

struct TodoItem: Identifiable {
    enum TodoState {
        case todo
        case progress
        case wait
        case done
    }

    var id = UUID()
    var title: String
    var state: TodoState
}

let testData = [
    TodoItem(title: "皿洗い", state: .todo),
    TodoItem(title: "部屋の掃除", state: .todo),
    TodoItem(title: "買い出し", state: .todo),
    TodoItem(title: "趣味プログラミング", state: .progress),
    TodoItem(title: "ねこのご飯を用意", state: .todo),
    TodoItem(title: "ねこと遊ぶ", state: .done),
    TodoItem(title: "昼ご飯の準備", state: .done),
    TodoItem(title: "夜ご飯の準備", state: .todo),
]
