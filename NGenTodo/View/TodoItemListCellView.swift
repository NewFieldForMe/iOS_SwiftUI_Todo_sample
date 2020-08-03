//
//  TodoItemListCellView.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/08/03.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct TodoItemListCellView: View {
    @ObservedObject var item: TodoData
    var body: some View {
        HStack {
            Text(item.title)
            Spacer()
            item.deadlineDateString.map { Text($0) }
        }
    }
}
