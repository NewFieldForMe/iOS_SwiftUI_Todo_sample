//
//  TemplateTodoData+CoreDataProperties.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/09/29.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//
//

import Foundation
import CoreData


extension TemplateTodoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TemplateTodoData> {
        return NSFetchRequest<TemplateTodoData>(entityName: "TemplateTodoData")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var point: Int64
    @NSManaged public var order: Int64
    @NSManaged public var templateId: UUID?

}
