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
        NavigationView {
            List {
                ForEach(vm.templates) { template in
                    TemplateListCellView(template: template)
                }
            }
            .navigationBarTitle("Template List")
        }
    }
}

struct TemplateListView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateListView()
    }
}
