//
//  AddTodoItemView.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/07/06.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct AddTodoItemView: View {
    @State var titleEditting = false
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var vm: AddTodoViewModel

    init(_ todo: TodoData? = nil) {
        self.vm = AddTodoViewModel(todo)
    }

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Form {
                        TextField("Title", text: self.vm.$todo.title, onEditingChanged: { editting in
                            self.titleEditting = editting
                        }).textFieldStyle(RoundedBorderTextFieldStyle())
                            .shadow(color: titleEditting ? .blue : .clear, radius: 3)
                            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))

                        DatePicker("Deadline",
                                   selection: Binding<Date>(get: {self.vm.todo.deadlineDate ?? Date()}, set: {self.vm.todo.deadlineDate = $0})
                        ).padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        Spacer()
                    }
                }
                .navigationBarTitle(vm.mode.navigationTitle)
                .navigationBarItems(leading: Button("Close") {
                    self.vm.cancel()
                    self.presentationMode.wrappedValue.dismiss()
                })

                FloatingButtonView() {
                    self.vm.save()
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

struct AddTodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoItemView()
    }
}
