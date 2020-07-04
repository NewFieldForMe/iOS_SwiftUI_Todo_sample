//
//  TodoItemListView.swift
//  NGenTodo
//
//  Created by 山田良 on 2020/07/04.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct TodoItemListView: View {
    var taskItems = testData

    var body: some View {
        List {
            ForEach(TodoItem.TodoState.allCases) { state in
                Section(header: Text(state.label)) {
                    ForEach(self.taskItems.items(state: state)) { item in
                        Text(item.title)
                    }
                }
            }
        }
    }
}

struct TodoItemListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemListView()
    }
}
