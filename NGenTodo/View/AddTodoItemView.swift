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
    @Environment(\.presentationMode) private var presentationMode
    var completionHandler: ((TodoItem) -> Void)
    @State var editting = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    TextField("Title", text: $title, onEditingChanged: { editting in
                        self.editting = editting
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(color: editting ? .blue : .clear, radius: 3)
                    Spacer()
                }
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                .navigationBarTitle("Add Todo")
                .navigationBarItems(leading: Button("Close") {
                    self.presentationMode.wrappedValue.dismiss()
                })

                FloatingButtonView() {
                    self.completionHandler(self.makeTodoItem())
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

private extension AddTodoItemView {
    func makeTodoItem() -> TodoItem {
        return TodoItem(title: title, state: .todo)
    }
}

struct AddTodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoItemView(completionHandler: { _ in })
    }
}
