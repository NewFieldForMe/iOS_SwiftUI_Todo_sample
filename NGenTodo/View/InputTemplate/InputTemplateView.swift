//
//  InputTemplateView.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/10/20.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct InputTemplateView: View {
    @State var templateTitle: String = ""

    var body: some View {
        Form {
            Section(header: Text("Template")) {
                TextField("Template Title", text: self.$templateTitle)
            }
            Section(header: Text("Todo")) {
                Text("Todo")
                Text("Todo")
            }
        }
    }
}

struct InputTemplateView_Previews: PreviewProvider {
    static var previews: some View {
        InputTemplateView()
    }
}
