//
//  TodoListSideMenuViewModel.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/08/27.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import SwiftUI
import Combine

class TodoListSideMenuViewModel: ObservableObject {
    @Published var darkModeModel: DarkModeModel
    @Published var darkModeSystemName: String = ""
    var bag = Set<AnyCancellable>()

    init() {
        let darkModeModel = DarkModeModel()
        self.darkModeModel = darkModeModel
        darkModeModel.$isDark.sink(receiveValue: { [weak self] isDark in
            self?.darkModeSystemName = isDark ? "moon.fill" : "sun.max.fill"
            }).store(in: &bag)
    }

    func switchDarkMode() {
        darkModeModel.isDark = !darkModeModel.isDark
    }
}
