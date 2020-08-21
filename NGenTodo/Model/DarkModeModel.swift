//
//  DarkModeModel.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/08/21.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import Foundation

struct DarkModeModel {
    static var isDark: Bool = true {
        didSet {
            guard let window = SceneDelegate.shared?.window else { return }
            window.overrideUserInterfaceStyle = isDark ? .dark : .light
        }
    }
}
