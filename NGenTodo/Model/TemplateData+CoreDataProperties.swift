//
//  TemplateData+CoreDataProperties.swift
//  NGenTodo
//
//  Created by yamada.ryo on 2020/09/29.
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
    @NSManaged public var order: Int64
    @NSManaged public var title: String?

}
