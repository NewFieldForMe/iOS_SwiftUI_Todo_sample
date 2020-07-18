//
//  AddTodoItemView.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/07/06.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct AddTodoItemView: View {
    @State var title = ""
    @State var titleEditting = false
    @Environment(\.presentationMode) private var presentationMode
    var completionHandler: ((TodoData) -> Void)
    let mode: Mode

    enum Mode {
        case add
        case edit(TodoItem)

        var navigationTitle: String {
            switch self {
            case .add: return "Add Todo"
            case .edit: return "Edit Todo"
            }
        }
    }

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    TextField("Title", text: $title, onEditingChanged: { editting in
                        self.titleEditting = editting
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(color: titleEditting ? .blue : .clear, radius: 3)
                    Spacer()
                }
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                .navigationBarTitle(mode.navigationTitle)
                .navigationBarItems(leading: Button("Close") {
                    self.presentationMode.wrappedValue.dismiss()
                })

                FloatingButtonView() {
                    switch self.mode {
                    case .add:
                        self.completionHandler(self.makeTodoItem())
                    case let .edit(item):
                        let todo = TodoItem(id: item.id, title: self.title, data: item.data)
//                        self.completionHandler(todo)
                    }
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

private extension AddTodoItemView {
    func makeTodoItem() -> TodoData {
        let data = TodoData()
        data.title = title
        return data
    }
}

struct AddTodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoItemView(completionHandler: { _ in }, mode: .add)
    }
}
