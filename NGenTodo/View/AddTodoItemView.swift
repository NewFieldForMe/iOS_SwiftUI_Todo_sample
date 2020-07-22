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
        // Remove top space of form
        // https://stackoverflow.com/questions/58681243/how-to-remove-top-space-of-form-in-swiftui
        UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
    }

    var body: some View {
        ZStack {
            Form {
                TextField("Title", text: self.vm.$todo.title, onEditingChanged: { editting in
                    self.titleEditting = editting
                }).textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(color: titleEditting ? .blue : .clear, radius: 3)
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                HStack {
                    Text("Use Deadline: ")
                    Image(systemName: vm.isUseDeadline ? "checkmark.square" : "square")
                        .onTapGesture {
                            self.vm.isUseDeadline.toggle()
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))

                if (vm.isUseDeadline) {
                    DatePicker("Deadline",
                               selection: Binding<Date>(get: {self.vm.todo.deadlineDate ?? Date()}, set: {self.vm.todo.deadlineDate = $0})
                    )
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                }
                Spacer()
            }

            FloatingButtonView() {
                self.vm.save()
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .onAppear(perform: vm.onAppear)
        .navigationBarTitle(vm.mode.navigationTitle)
        .navigationBarItems(leading: Button("Close") {
            self.vm.cancel()
            self.presentationMode.wrappedValue.dismiss()
        })
    }
}

struct AddTodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoItemView()
    }
}
