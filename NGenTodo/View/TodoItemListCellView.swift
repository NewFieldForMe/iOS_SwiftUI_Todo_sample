//
//  TodoItemListCellView.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/08/03.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct TodoItemListCellView: View {
    @ObservedObject var item: TodoData
    var body: some View {
        VStack {
            HStack {
                Text(item.title)
                Spacer()
            }
            HStack {
                Spacer()
                item.deadlineDateString.map {
                    Text($0)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
        }.padding()
    }

}
