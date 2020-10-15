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
        NavigationView {
            List {
                ForEach(vm.pointsData) { (point: PointData) in
                    HStack {
                        Text(point.dateString)
                        Spacer()
                        Text(point.point.description)
                    }
                }
            }
            .onAppear(perform: vm.onAppear)
            .navigationBarTitle("Statistic")
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView()
    }
}
