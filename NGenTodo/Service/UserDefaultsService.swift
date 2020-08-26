//
//  UserDefaultsService.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/08/26.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import Foundation

class UserDefaultsService {
    fileprivate static let userDefault = UserDefaults.standard

    fileprivate enum UserDefaultsKey: String {
        case isDarkMode
    }

    static var isDarkMode: Bool {
        get {
            return self.userDefault.bool(forKey: UserDefaultsKey.isDarkMode.rawValue)
        }
        set {
            self.userDefault.set(newValue, forKey: UserDefaultsKey.isDarkMode.rawValue)
        }
    }
}
