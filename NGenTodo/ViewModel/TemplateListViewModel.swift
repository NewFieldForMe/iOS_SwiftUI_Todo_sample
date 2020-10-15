//
//  TemplateListViewModel.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/09/30.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

class TemplateListViewModel: ObservableObject {
    @Published var templates: [TemplateData] = []
    @Published var showingAddTemplate: Bool = false

    init() {
        fetch()
    }

    func fetch() {
        templates = CoreDataService.fetch(TemplateData.fetchRequest())?.sorted(by: { (a, b) -> Bool in
            a.order < b.order
        }) ?? []

        if templates.isEmpty {
            generateTestData()
            fetch()
        }
        dump(templates)
    }

    private func generateTestData() {
        let templateTodo1: TemplateTodoData = CoreDataService.new()
        let templateTodo2: TemplateTodoData = CoreDataService.new()
        let templateTodo3: TemplateTodoData = CoreDataService.new()
        let templateTodo4: TemplateTodoData = CoreDataService.new()
        let templateTodo5: TemplateTodoData = CoreDataService.new()
        let templateTodo6: TemplateTodoData = CoreDataService.new()

        let setTodo = { (todo: TemplateTodoData, title: String, order: Int) in
            todo.id = UUID()
            todo.order = order
            todo.title = title
        }

        setTodo(templateTodo1, "Test1", 1)
        setTodo(templateTodo2, "Test2", 2)
        setTodo(templateTodo3, "Test3", 3)
        setTodo(templateTodo4, "Test4", 4)
        setTodo(templateTodo5, "Test5", 5)
        setTodo(templateTodo6, "Test6", 6)

        let template1: TemplateData = CoreDataService.new()
        let template2: TemplateData = CoreDataService.new()

        let setTemplate = { (template: TemplateData, title: String, order: Int) in
            template.id = UUID()
            template.order = order
            template.title = title
        }

        setTemplate(template1, "template1", 1)
        setTemplate(template2, "template2", 2)
        template1.addToTemplateTodoData(NSSet(array: [templateTodo1, templateTodo2, templateTodo3]))
        template2.addToTemplateTodoData(NSSet(array: [templateTodo4, templateTodo5, templateTodo6]))

        CoreDataService.save()
    }
}
