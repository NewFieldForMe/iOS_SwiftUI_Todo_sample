//
//  StatisticViewModel.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/09/16.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import Foundation

class StatisticViewModel: ObservableObject {
    @Published var pointsData: [PointData] = []

    init() {
        fetch()
    }


    func onAppear() {
        fetch()
    }
}

private extension StatisticViewModel {
    func fetch() {
        pointsData = CoreDataService.fetch(PointData.fetchRequest())?
            .sorted(by: { (a, b) -> Bool in
                guard let aDate = a.date, let bDate = b.date else { return false }
                return aDate > bDate
            }) ?? []
    }

}
