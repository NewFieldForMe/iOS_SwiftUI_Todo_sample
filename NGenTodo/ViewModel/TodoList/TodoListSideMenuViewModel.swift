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
    @Published var darkModeModel = DarkModeModel()
    @Published var darkModeSystemName: String = ""
    private var bag = Set<AnyCancellable>()

    init() {
        self.darkModeModel.$isDark.sink(receiveValue: { [weak self] isDark in
            self?.darkModeSystemName = isDark ? "moon.fill" : "sun.max.fill"
        }).store(in: &bag)
    }

    func switchDarkMode() {
        darkModeModel.isDark = !darkModeModel.isDark
    }
}
