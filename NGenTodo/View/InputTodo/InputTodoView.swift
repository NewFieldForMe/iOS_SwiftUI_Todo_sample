//
//  InputTodoView.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/07/06.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct InputTodoView: View {
    @State var titleEditting = false
    @State var pointEditting = false
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var vm: InputTodoViewModel

    init(todo: TodoData) {
        self.vm = InputTodoViewModel(todo: todo)
        // Remove top space of form
        // https://stackoverflow.com/questions/58681243/how-to-remove-top-space-of-form-in-swiftui
        UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
    }
    init(maxOrder: Int) {
        self.vm = InputTodoViewModel(maxOrder: maxOrder)
        // Remove top space of form
        // https://stackoverflow.com/questions/58681243/how-to-remove-top-space-of-form-in-swiftui
        UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
    }

    var body: some View {
        ZStack {
            Form {
                TextField("Title", text: self.$vm.title, onEditingChanged: { editting in
                    self.titleEditting = editting
                }).textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(color: titleEditting ? .blue : .clear, radius: 3)
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))

                TextField("Point", text: self.$vm.point, onEditingChanged: { editting in
                    self.pointEditting = editting
                }).textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(color: pointEditting ? .blue : .clear, radius: 3)
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                    .keyboardType(.numberPad)

                HStack {
                    Text("Use Deadline: ")
                    Image(systemName: vm.isUseDeadline ? "checkmark.square" : "square")
                        .onTapGesture {
                            self.vm.isUseDeadline.toggle()
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))

                if vm.isUseDeadline {
                    DatePicker("Deadline",
                               selection: Binding<Date>(get: { self.vm.deadlineDate }, set: { self.vm.deadlineDate = $0 })
                    )
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                }
            }

            FloatingButtonView(isDisabled: self.vm.hasError) {
                self.vm.save()
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .onAppear(perform: vm.onAppear)
        .navigationBarTitle(vm.mode.navigationTitle)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.vm.cancel()
            self.presentationMode.wrappedValue.dismiss()
        }){
            HStack {
                Image(systemName: "chevron.left")
                Text("Cancel")
            }
        })
    }
}

struct InputTodoView_Previews: PreviewProvider {
    static var previews: some View {
        InputTodoView(maxOrder: 0)
    }
}

fileprivate extension Binding where Value == Int {
    func IntToStrDef(_ def: Int) -> Binding<String> {
        return Binding<String>(
            get: { () -> String in
                return String(self.wrappedValue)
        }, set: { value in
            self.wrappedValue = Int(value) ?? def
        })
    }
}
