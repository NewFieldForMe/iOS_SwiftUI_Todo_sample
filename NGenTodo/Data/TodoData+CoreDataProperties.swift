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
    @NSManaged public var title: String?

}

extension TodoData: Identifiable { }
