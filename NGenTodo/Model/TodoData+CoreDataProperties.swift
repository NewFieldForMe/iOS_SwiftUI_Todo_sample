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
    @NSManaged private var state: Int
    @NSManaged public var point: Int
}

extension TodoData: Identifiable { }
extension TodoData {
    var deadlineDateString: String? {
        guard let deadlineDate = deadlineDate else { return nil }
        return DateFormatters.shortDateShortTimeFormatter.string(from: deadlineDate)
    }

    var isOverDeadline: Bool {
        guard let deadline = deadlineDate else { return false }
        return deadline < Date()
    }

    var todoState: TodoState {
        get {
            return TodoState(rawValue: state)!
        }
        set {
            state = newValue.rawValue
        }
    }

    enum TodoState: Int {
        case ready
        case done
    }
}
