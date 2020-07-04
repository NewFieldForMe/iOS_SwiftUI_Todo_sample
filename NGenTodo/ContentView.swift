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
        List(taskItems) { item in
            Text(item.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
