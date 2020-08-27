//
//  DarkModeModel.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/08/21.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import Foundation

class DarkModeModel: ObservableObject {
    @Published
    var isDark: Bool = UserDefaultsService.isDarkMode {
        didSet {
            UserDefaultsService.isDarkMode = isDark
            reflectDarkMode()
        }
    }

    func reflectDarkMode() {
        let isDarkMode = UserDefaultsService.isDarkMode
        guard let window = SceneDelegate.shared?.window else { return }
        window.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
    }
}
