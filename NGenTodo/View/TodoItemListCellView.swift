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
                    item.isOverDeadline ?
                        ViewBuilder.buildEither(first: OverDeadlineView(deadlineString: $0)) :
                        ViewBuilder.buildEither(second: DeadlineView(deadlineString: $0))
                }
            }
        }.padding()
    }

}

struct OverDeadlineView: View {
    var deadlineString: String
    var body: some View {
        HStack {
            Image(systemName: "bell.circle")
                .font(.system(size: 28))
                .foregroundColor(.white)
                .frame(width: 30.0)
            Text(deadlineString)
                .font(.system(size: 14))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 90.0)
        }
        .padding(8)
        .background(Color.red)
        .cornerRadius(8)
    }
}

struct DeadlineView: View {
    var deadlineString: String
    var body: some View {
        Text(deadlineString)
            .font(.system(size: 14))
            .foregroundColor(.gray)
    }
}
