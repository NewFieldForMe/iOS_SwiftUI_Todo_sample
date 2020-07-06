//
//  TodoItemListView.swift
//  NGenTodo
//
//  Created by 山田良 on 2020/07/04.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct TodoItemListView: View {
    @State
    var taskItems: [TodoItem] = []

    var body: some View {
        ZStack {
            List {
                ForEach(TodoItem.TodoState.allCases) { state in
                    Section(header: Text(state.label)) {
                        ForEach(self.taskItems.items(state: state)) { item in
                            Text(item.title)
                        }
                    }
                }
            }

            FloatingButtonView() {
                self.taskItems = testData
            }
        }
    }
}

struct TodoItemListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemListView()
    }
}
