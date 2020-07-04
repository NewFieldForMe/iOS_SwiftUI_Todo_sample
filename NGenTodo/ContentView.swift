//
//  ContentView.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/07/04.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
