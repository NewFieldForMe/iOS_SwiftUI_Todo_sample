//
//  StatisticView.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/09/15.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI

struct StatisticView: View {
    @ObservedObject var vm = StatisticViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView()
    }
}
