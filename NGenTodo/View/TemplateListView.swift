//
//  TemplateListView.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/10/06.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct TemplateListView: View {
    @EnvironmentObject var vm: TemplateListViewModel
    var body: some View {
        List {
            ForEach(vm.templates) { template in
                HStack {
                    Text(template.title!)
                    Spacer()
                    Text(template.templateTodoData?.count.description ?? "0")
                }
            }
        }
    }
}

struct TemplateListView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateListView()
    }
}
