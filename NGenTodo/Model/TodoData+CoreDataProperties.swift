//
//  TodoData+CoreDataProperties.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/07/17.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//
//

import Foundation
import CoreData


extension TodoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoData> {
        return NSFetchRequest<TodoData>(entityName: "TodoData")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String
    @NSManaged public var order: Int
    @NSManaged public var createDate: Date?
    @NSManaged public var deadlineDate: Date?

}

extension TodoData: Identifiable { }
extension TodoData {
    var deadlineDateString: String? {
        guard let deadlineDate = deadlineDate else { return nil }
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "MdkHm", options: 0, locale: Locale.current)
        return formatter.string(from: deadlineDate)
    }
}
