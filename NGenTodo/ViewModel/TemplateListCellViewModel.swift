//
//  TemplateListCellViewModel.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/10/13.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI
import Combine

class TemplateListCellViewModel: ObservableObject {
    private var template: TemplateData
    private var bag = [AnyCancellable]()
    @Published private(set) var title: String = ""
    @Published private(set) var todoCountText: String = ""

    init(_ template: TemplateData) {
        self.template = template

        template.publisher(for: \.title)
            .compactMap { $0 ?? "" }
            .assign(to: \.title, on: self)
            .store(in: &bag)

        template.publisher(for: \.templateTodoData)
            .compactMap { $0?.count.description }
            .map { "Todo: " + $0 }
            .assign(to: \.todoCountText, on: self)
            .store(in: &bag)
    }
}
