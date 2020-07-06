//
//  AddTodoItemView.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/07/06.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct AddTodoItemView: View {
    @State
    var title = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Title", text: $title)
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
            .navigationBarTitle("Add Todo")
        }
    }
}

struct AddTodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoItemView()
    }
}
