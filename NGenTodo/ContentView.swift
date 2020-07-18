//
//  ContentView.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/07/04.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(
        entity: TodoData.entity(),
        sortDescriptors: []
    ) var notCompletedTasks: FetchedResults<TodoData>

    var body: some View {
        TodoItemListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
