//
//  DateFormatters.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/09/17.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//

import Foundation

class DateFormatters {
    static let shortDateShortTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "MdkHm", options: 0, locale: Locale.current)
        return formatter
    }()

    static let mediumWithoutTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMd", options: 0, locale: Locale.current)
        return formatter
    }()
}
