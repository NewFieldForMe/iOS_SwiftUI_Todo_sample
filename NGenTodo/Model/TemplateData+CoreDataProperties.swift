//
//  TemplateData+CoreDataProperties.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/10/07.
//  Copyright © 2020 yamada.ryo. All rights reserved.
//
//

import Foundation
import CoreData


extension TemplateData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TemplateData> {
        return NSFetchRequest<TemplateData>(entityName: "TemplateData")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var order: Int
    @NSManaged public var title: String?
    @NSManaged public var templateTodoData: NSSet?

}

// MARK: Generated accessors for templateTodoData
extension TemplateData {

    @objc(addTemplateTodoDataObject:)
    @NSManaged public func addToTemplateTodoData(_ value: TemplateTodoData)

    @objc(removeTemplateTodoDataObject:)
    @NSManaged public func removeFromTemplateTodoData(_ value: TemplateTodoData)

    @objc(addTemplateTodoData:)
    @NSManaged public func addToTemplateTodoData(_ values: NSSet)

    @objc(removeTemplateTodoData:)
    @NSManaged public func removeFromTemplateTodoData(_ values: NSSet)

}

extension TemplateData : Identifiable {

}
