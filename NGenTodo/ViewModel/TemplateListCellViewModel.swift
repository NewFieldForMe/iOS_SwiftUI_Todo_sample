//
//  TemplateListCellViewModel.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/10/13.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

class TemplateListCellViewModel: ObservableObject {
    @Published var template: TemplateData

    init(_ template: TemplateData) {
        self.template = template
    }
}
