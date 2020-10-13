//
//  TemplateListCellViewModel.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/10/13.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

class TemplateListCellViewModel: ObservableObject {
    private let template: TemplateData

    var title: String {
        return template.title ?? ""
    }

    var todoCountText: String {
        guard let countString = template.templateTodoData?.count.description else { return "" }
        return "Todo: " + countString
    }

    init(_ template: TemplateData) {
        self.template = template
    }
}
