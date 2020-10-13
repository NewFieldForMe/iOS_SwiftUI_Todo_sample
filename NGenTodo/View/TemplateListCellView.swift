//
//  TemplateListCellView.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/10/13.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct TemplateListCellView: View {
    @ObservedObject var vm: TemplateListCellViewModel

    init(template: TemplateData) {
        vm = TemplateListCellViewModel(template)
    }

    var body: some View {
        HStack {
            Spacer()
        }
    }
}
